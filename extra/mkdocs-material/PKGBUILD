# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=mkdocs-material
pkgver=9.8.1
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
b2sums=('a5f2ceddf5a8b927cc185cb973e52e3bcce401911f681d1b00a633029ccab69a2012354dfbfdf6b3bac7bdfb75b87a32236905ee70300402ad9c19e1a426b27d')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
