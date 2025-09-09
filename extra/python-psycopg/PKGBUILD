# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-psycopg
pkgver=3.2.10
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
sha512sums=('c56cf933ad6efc591069c45017440a6332e8d93014b2674336b4c06a351ab0c45847df3f1f837b940fdb4332efcaea38b84cec87fd56edf639783727045aab38')
b2sums=('4b17c3c443da9800cc4b756661800a681e0b5abb806237d17f8bca427d88ec3030f7af7f9b3bc7f7a1499801899c6d925f24d31223cef147f3ed763294a6e0a0')

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
