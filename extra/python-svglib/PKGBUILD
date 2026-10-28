# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-svglib
_name="${pkgname#python-}"
pkgver=2.3.2
pkgrel=1
pkgdesc="Read SVG files and convert them to other formats"
arch=(any)
url="https://github.com/deeplook/svglib"
license=(LGPL-3.0-only)
depends=(
  python
  python-lxml
  python-pillow
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
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('302f4df0ae86a9dd791e20ae58cebfde63e560e1ff10f9d2b0cb8a2087d4c08ec8d4c12100e712daa8e2fc32e6c7a5f4f339f3c925eec874c0f8dbaab2ebd881')
b2sums=('4d0ee3af3713d8adc6be8bcbf073c40231bdf3185649cb6f29d5a4c9d03617339abceb6c4576e18d71732507366b85851a12a8809f9b3d215603b28f4ab1c26e')

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
  install -vDm 644 {CHANGELOG,CONTRIBUTORS,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
