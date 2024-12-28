# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-asyncpg
_pkgname=${pkgname#python-}
pkgver=0.30.0
pkgrel=2
pkgdesc="A fast PostgreSQL Database Client Library for Python/asyncio"
arch=(x86_64)
url="https://github.com/MagicStack/asyncpg"
license=(Apache-2.0)
depends=(
  glibc
  python
  python-async-timeout
  python-typing_extensions
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  postgresql
  python-distro
  python-pytest
  python-uvloop
)
source=(
  "git+$url.git#tag=v$pkgver"
  "git+https://github.com/MagicStack/py-pgproto"
)
sha256sums=('9f9812ecd04ec04484d440a8e21436db91946867c2ec91303742db88f52ea9cf'
            'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.asyncpg/pgproto.url "$srcdir/py-pgproto"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
