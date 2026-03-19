# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=mkdocs-material
pkgver=9.7.5
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
b2sums=('7ae9e51f0c088577315919df37a551c50bac77a145d7f95d3fe254cad3110dbffa785f1a720c07b4f8132a8a74d3bd903bbbf8c87f46b13f19f04ef3d21c2886')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
