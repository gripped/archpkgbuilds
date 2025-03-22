# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-material
pkgver=9.6.9
pkgrel=1
pkgdesc="Documentation that simply works"
arch=(any)
url="https://github.com/squidfunk/mkdocs-material"
license=(ISC)
depends=(
  mkdocs
  python
  python-babel
  python-backrefs
  python-colorama
  python-jinja
  python-markdown
  # python-paginate # Not packaged
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-hatch-nodejs-version
  python-hatch-requirements-txt
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  'python-cairosvg: for image processing'
  'python-pillow: for image processing'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3474243956107f631145b889511f1a7ca8bf35da849c735cedf995bd792378e8')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
