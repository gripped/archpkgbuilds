# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-svglib
_name="${pkgname#python-}"
pkgver=2.1.0
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
sha512sums=('71c574a33bfd4faca37941c2003a2d21579773e783606fc0bfb5d0f8e3f5e2f985dbd72d00df1829a241677158e6e613fb84873bec9d08d7585776b53f669870')
b2sums=('84b7151edfd21397701de023311b2bcb365279021373da78ac3f2db4077cf5e22c13fefc59c5f7ee23e6c394ffb76af8cf22b375c0c69d942cdf419a6eb3b9f6')

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
