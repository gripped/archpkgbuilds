# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=mkdocs-material
pkgver=9.8.0
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('15fb5eb683d5924e9ed04e7acc176a25f37349bff35edbae552e9ecf4fb920e554dbcb047644e2d328229dbee29f8208cee557c6341026979b328bef6559aa01')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
