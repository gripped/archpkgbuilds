# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-arrow-adbc
pkgname=(
  python-arrow-adbc
  python-arrow-adbc-driver-bigquery
  python-arrow-adbc-driver-flightsql
  python-arrow-adbc-driver-postgresql
  python-arrow-adbc-driver-sqlite
  python-arrow-adbc-driver-snowflake
)
pkgver=23
pkgrel=1
pkgdesc='Database connectivity API for Apache Arrow'
arch=(x86_64)
url='https://arrow.apache.org/adbc/current/index.html'
license=(Apache-2.0)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
  cython
  cmake
  ninja
  go
  postgresql-libs
)
source=("$pkgbase::git+https://github.com/apache/arrow-adbc#tag=apache-arrow-adbc-$pkgver")
sha512sums=('c6be025efc966ed792fba1f6933fea75a6d157559ded68e14f3d53fa78d62cdc61ebccc3a5eca01a7e281e481ca43803baf6212369d6bc54594b3ba773bdabee')
b2sums=('e3a776155dedfcb02156e33569e01082134a51f57cf580a0b5024d52e1396719663d4f968a4c4b31d0fb41b329bce8721c80e77ec165841448ba1bb28afc6e3c')

build() {
  local cmake_options=(
    -B build
    -S "$pkgbase/c"
    -G Ninja
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D ADBC_BUILD_PYTHON=ON
    -D ADBC_DRIVER_MANAGER=ON
    -D ADBC_DRIVER_BIGQUERY=ON
    -D ADBC_DRIVER_FLIGHTSQL=ON
    -D ADBC_DRIVER_POSTGRESQL=ON
    -D ADBC_DRIVER_SQLITE=ON
    -D ADBC_DRIVER_SNOWFLAKE=ON
    
    -W no-dev
  )

  cmake "${cmake_options[@]}"

  cmake --build build

  # build wheels
  cd "$pkgbase/python"

  pushd adbc_driver_bigquery
  ADBC_BIGQUERY_LIBRARY="$srcdir/build/driver/bigquery/libadbc_driver_bigquery.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_flightsql
  ADBC_FLIGHTSQL_LIBRARY="$srcdir/build/driver/flightsql/libadbc_driver_flightsql.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_manager
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_postgresql
  ADBC_POSTGRESQL_LIBRARY="$srcdir/build/driver/postgresql/libadbc_driver_postgresql.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_snowflake
  ADBC_SNOWFLAKE_LIBRARY="$srcdir/build/driver/snowflake/libadbc_driver_snowflake.so" \
  python -m build --wheel --no-isolation
  popd
  pushd adbc_driver_sqlite
  ADBC_SQLITE_LIBRARY="$srcdir/build/driver/sqlite/libadbc_driver_sqlite.so" \
  python -m build --wheel --no-isolation
  popd
}

package_python-arrow-adbc() {
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-typing_extensions
    python-pandas
    python-pyarrow
  )
  optdepends=(
    'python-arrow-adbc-driver-bigquery: BigQuery driver'
    'python-arrow-adbc-driver-flightsql: Flight SQL driver'
    'python-arrow-adbc-driver-postgresql: PostgreSQL driver'
    'python-arrow-adbc-driver-sqlite: SQLite driver'
    'python-arrow-adbc-driver-snowflake: Snowflake driver'
  )

  cd "$pkgbase/python/adbc_driver_manager"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-bigquery() {
  pkgdesc+=' - BigQuery driver'
  depends=(
    glibc
    python
    python-arrow-adbc
    python-importlib_resources
  )

  cd "$pkgbase/python/adbc_driver_bigquery"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-flightsql() {
  pkgdesc+=' - Flight SQL driver'
  depends=(
    glibc
    python
    python-arrow-adbc
    python-importlib_resources
  )

  cd "$pkgbase/python/adbc_driver_flightsql"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-postgresql() {
  pkgdesc+=' - PostgreSQL driver'
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-arrow-adbc
    python-importlib_resources
    postgresql-libs
  )

  cd "$pkgbase/python/adbc_driver_postgresql"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-sqlite() {
  pkgdesc+=' - SQLite driver'
  depends=(
    glibc
    libgcc
    libstdc++
    python
    python-arrow-adbc
    python-importlib_resources
    sqlite
  )

  cd "$pkgbase/python/adbc_driver_sqlite"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-arrow-adbc-driver-snowflake() {
  pkgdesc+=' - Snowflake driver'
  depends=(
    glibc
    python
    python-arrow-adbc
    python-importlib_resources
  )

  cd "$pkgbase/python/adbc_driver_snowflake"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
