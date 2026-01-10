# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-svglib
_name="${pkgname#python-}"
pkgver=1.6.0
pkgrel=2
pkgdesc="Read SVG files and convert them to other formats"
arch=(any)
url="https://github.com/deeplook/svglib"
license=(LGPL-3.0-only)
depends=(
  python
  python-lxml
  python-reportlab
  python-tinycss2
  python-cssselect2
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pillow
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('089e867e04256282d2e7b2877fb49b9713f39449dd1df3d38eba25ae4f12e8ac6884da0826c7ca658425482a42940b9ee88112d7a7ac9b6e9d7aa2ef519fbb14')
b2sums=('ca71c83bc803dd582849d5a0db07345fced468873d09818e08ac77f0baaa4168f0fbeaa6a6e39288e716ce9de5e6a761ecb96a205cf29194d6026e5e0be0c77d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # disable tests that need remote resources
    --ignore tests/test_samples.py
  )

  cd $_name-$pkgver
  export PYTHONPATH="src:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,CONTRIBUTORS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
