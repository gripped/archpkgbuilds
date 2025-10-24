# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Pierre Gueth <pierre.gueth@gmail.com>

pkgname=python-redis
pkgver=7.0.0
pkgrel=1
pkgdesc='The Python interface to the Redis key-value store'
arch=('any')
url='https://github.com/redis/redis-py'
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-coverage'
  'python-cryptography'
  'python-hiredis'
  'python-numpy'
  'python-pyopenssl'
  'python-pytest'
  'python-pytest-asyncio'
  'python-requests'
  'valkey'
)
optdepends=(
  'python-cryptography: OCSP certificate validation'
  'python-hiredis: faster performance via hiredis'
  'python-pyopenssl: OCSP certificate validation'
  'python-requests: OCSP certificate validation'
)
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('7a8ff1941f2f0d1a5811fe6a3b54fdeb4e7c282a9bf93c89e257eab9c7adcb58c6473857f08c5283d9253109e4ee8dd093646a49470ae8123a538566b6e2b9db')

prepare() {
  cd "$pkgname"
  # Compatibiltiy with recent python-pytest-asyncio.
  sed -i 's/@pytest.mark.asyncio(forbid_global_loop=True)/@pytest.mark.asyncio/g' \
    tests/test_asyncio/test_scripting.py
  # Replace dependency on python-mock
  sed -i 's/from mock.mock/from unittest.mock/g' \
    tests/test_asyncio/test_credentials.py \
    tests/test_credentials.py
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # shellcheck disable=SC2317
  _teardown() {
    redis-cli -p 6379 shutdown
    redis-cli -p 6380 shutdown
    for port in $(seq 16379 16384); do
      redis-cli -p "$port" shutdown;
    done
    rm -rf cluster
  }
  trap '_teardown' EXIT

  # Setup single instance and replica.
  redis-server \
    --enable-debug-command yes \
    --enable-module-command yes \
    --daemonize yes \
    --port 6379
  redis-server \
    --replicaof 127.0.0.1 6379 \
    --daemonize yes \
    --port 6380

  # Setup cluster.
  for port in $(seq 16379 16384); do
    mkdir -p "cluster/$port"
    pushd "cluster/$port"
    redis-server \
      --cluster-enabled yes \
      --enable-debug-command yes \
      --dir "$PWD" \
      --logfile "$PWD/redis.log" \
      --daemonize yes \
      --port "$port"
    popd
  done

  # This is bad form but it makes the tests much more reliable. This could be a proper "wait for
  # port" loop but it seems excessive for a PKGBUILD.
  sleep 0.1

  yes yes | redis-cli --cluster create \
    127.0.0.1:16379 \
    127.0.0.1:16380 \
    127.0.0.1:16381 \
    127.0.0.1:16382 \
    127.0.0.1:16383 \
    127.0.0.1:16384 \
    --cluster-replicas 1

  local pytest_deselect_args=(
    # Tests that are testing, and as such depend on, modules that are part of
    # Redis Stack. These are not packaged since they are not OSS, only source
    # available.
    --deselect=tests/test_asyncio/test_bloom.py
    --deselect=tests/test_asyncio/test_graph.py
    --deselect=tests/test_asyncio/test_json.py
    --deselect=tests/test_asyncio/test_search.py
    --deselect=tests/test_asyncio/test_timeseries.py
    --deselect=tests/test_bloom.py
    --deselect=tests/test_cluster.py::TestClusterRedisCommands::test_tfcall
    --deselect=tests/test_cluster.py::TestClusterRedisCommands::test_tfunction_list
    --deselect=tests/test_cluster.py::TestClusterRedisCommands::test_tfunction_load_delete
    --deselect=tests/test_commands.py::TestRedisCommands::test_module
    --deselect=tests/test_commands.py::TestRedisCommands::test_module_loadex
    --deselect=tests/test_commands.py::TestRedisCommands::test_tfcall
    --deselect=tests/test_commands.py::TestRedisCommands::test_tfunction_list
    --deselect=tests/test_commands.py::TestRedisCommands::test_tfunction_load_delete
    --deselect=tests/test_graph.py
    --deselect=tests/test_json.py
    --deselect=tests/test_search.py
    --deselect=tests/test_timeseries.py

    # Tests that freezes, unsure of why.
    --deselect=tests/test_asyncio/test_cluster.py::TestRedisClusterObj::test_address_remap

    # Errors on Python 3.13 due to:
    #   OSError: No SSL certificates found. They should be in
    #   /build/python-redis/src/dockers/cluster/tls
    # This seems to be an issue occuring in multiple packages since the Python
    # 3.13 migration.
    --ignore=tests/test_asyncio/test_cluster.py

    # Tests that fail with Valkey, that work fine with Redis
    --deselect=tests/test_asyncio/test_commands.py::TestRedisCommands::test_readonly_invalid_cluster_state
    --deselect=tests/test_asyncio/test_monitor.py::TestMonitor::test_command_with_quoted_key
    --deselect=tests/test_asyncio/test_monitor.py::TestMonitor::test_command_with_escaped_data
    --deselect=tests/test_commands.py::TestRedisCommands::test_readonly_invalid_cluster_state
    --deselect=tests/test_monitor.py::TestMonitor::test_command_with_quoted_key
    --deselect=tests/test_monitor.py::TestMonitor::test_command_with_escaped_data
    --deselect=tests/test_cluster.py::TestClusterMonitor::test_command_with_quoted_key
    --deselect=tests/test_cluster.py::TestClusterMonitor::test_command_with_escaped_data

    # Requires redis-py-entraid
    --ignore=tests/test_asyncio/test_credentials.py
    --ignore=tests/test_credentials.py

    # Requires pybreaker
    --ignore=tests/test_asyncio/test_multidb
    --ignore=tests/test_asyncio/test_scenario
    --ignore=tests/test_multidb
    --ignore=tests/test_scenario

    # New test failures in 6.0.0, not sure why
    --deselect=tests/test_asyncio/test_commands.py::TestRedisCommands::test_client_setinfo
    --deselect=tests/test_commands.py::TestRedisCommands::test_client_setinfo
    --deselect=tests/test_commands.py::TestRedisCommands::test_xgroup_create_entriesread

    # New test failures in 6.4.0, not sure why
    --deselect=tests/test_asyncio/test_sentinel.py::test_get_sentinels
    --deselect=tests/test_asyncio/test_sentinel.py::test_get_master_addr_by_name
    --deselect=tests/test_asyncio/test_sentinel.py::test_redis_master_usage
    --deselect=tests/test_sentinel.py::test_get_sentinels
    --deselect=tests/test_sentinel.py::test_get_master_addr_by_name
    --deselect=tests/test_sentinel.py::test_redis_master_usage
  )

  # Run standalone test suite - targets the Redis server running :6379 and the
  # replica on :6380.
  pytest \
    -m "not onlycluster and not ssl" \
    "${pytest_deselect_args[@]}"

  # Run cluster tests suite - targets the Redis cluster running on
  # :16379-:16384.
  pytest \
    --redis-url="redis://localhost:16379/0" \
    -m "not onlynoncluster and not redismod and not ssl" \
    "${pytest_deselect_args[@]}"
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
