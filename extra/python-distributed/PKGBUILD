# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkg=distributed
pkgname=python-${_pkg}
pkgver=2024.12.1
pkgrel=1
pkgdesc="Distributed task scheduler for Dask"
arch=(any)
url="https://distributed.dask.org/"
license=(BSD-3-Clause)
depends=(
    python
    python-click
    python-cloudpickle
    python-dask
    python-jinja
    python-locket
    python-msgpack
    python-packaging
    python-psutil
    python-sortedcontainers
    python-tblib
    python-toolz
    python-tornado
    python-urllib3
    python-yaml
    python-zict
)
makedepends=(
    python-build
    python-installer
    python-setuptools
    python-versioneer
    python-wheel
)
checkdepends=(
    ipython
    python-pytest
    python-pytest-repeat
    python-pytest-timeout
    python-flaky
    python-blosc
    python-cryptography
    python-dask-expr
    python-fsspec
    python-h5py
    python-ipykernel
    python-ipywidgets
    python-jsonschema
    python-lz4
    python-netcdf4
    python-numpy
    python-pandas
    python-paramiko
    python-prometheus_client
    python-pyarrow
    python-requests
    python-scipy
    python-snappy
    python-zstandard
)
# No tests in PyPi tarballs
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/dask/distributed/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d4340561e8cfc773f4558b031e0aee358fd044025eba599047027b2f2c55ffca')

prepare() {
  sed -i 's/, "versioneer\[toml\].*"//' ${_pkg}-${pkgver}/pyproject.toml
}

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --deselect distributed/cli/tests/test_dask_scheduler.py
    --deselect distributed/cli/tests/test_dask_spec.py
    --deselect distributed/cli/tests/test_dask_worker.py
    --deselect distributed/cli/tests/test_tls_cli.py
    --deselect distributed/comm/tests/test_comms.py::test_tls_comm_closed_implicit[tornado]
    --deselect distributed/deploy/tests/test_local.py::test_defaults_5
    --deselect distributed/deploy/tests/test_old_ssh.py  # crashes the test suite
    --deselect distributed/deploy/tests/test_subprocess.py
    --deselect distributed/tests/test_client.py::test_computation_object_code_dask_compute
    --deselect distributed/tests/test_init.py::test_git_revision
    --deselect distributed/tests/test_queues.py::test_queue_in_task
    --deselect distributed/tests/test_steal.py::test_steal_twice
    --deselect distributed/tests/test_variable.py::test_variable_in_task
    --deselect distributed/tests/test_worker_memory.py::test_fail_to_pickle_execute_1
    --deselect distributed/tests/test_active_memory_manager.py::test_RetireWorker_with_actor[True]  # TimeoutError
    # TypeError: _FlakyPlugin._make_test_flaky() got an unexpected keyword argument 'reruns'
    --deselect distributed/comm/tests/test_ws.py
    --deselect distributed/deploy/tests/test_slow_adaptive.py::test_scale_up_down
    --deselect distributed/diagnostics/tests/test_progress.py::test_many_Progress
    --deselect distributed/diagnostics/tests/test_progress.py::test_AllProgress
    --deselect distributed/diagnostics/tests/test_progress.py::test_AllProgress_lost_key
    --deselect distributed/tests/test_client.py::test_profile
    --deselect distributed/tests/test_worker.py::test_statistical_profiling
    -m "not avoid_ci and not gpu and not extra_packages"
  )

  cd ${_pkg}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" distributed
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
