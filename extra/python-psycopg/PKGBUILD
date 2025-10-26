# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.12
pkgrel=1
pkgdesc='PostgreSQL database adapter for Python'
arch=(x86_64)
url='https://www.psycopg.org/psycopg3/'
license=(LGPL-3.0-only)
depends=(
  python
  postgresql-libs
)
makedepends=(
  git
  cython
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-pytest python-pytest-asyncio)
source=("$pkgname::git+https://github.com/psycopg/psycopg.git#tag=$pkgver")
sha512sums=('28f6649ed86d1ab9ea7e7019f00a77afd2084abc7323361f982b3cd3ae6e482936fdbe65a29be256b7af84c98433ff8e31482fe66db1fa7d613fb8cb45ab127a')
b2sums=('1cce9aa7dff26673de4fa3237849d9d0c2952598214f5ba72cb09ab502e0cc06ecb21e3c01b6d577f88debcada24de27df927ea5b988cbbd8b2e69a4848756e5')

build(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m build --wheel --no-isolation
    popd
  done
}

package(){
  cd "$pkgname"

  for pkg in psycopg psycopg_c; do
    pushd "$pkg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    popd
  done
}
