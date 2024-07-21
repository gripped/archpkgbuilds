# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-jaraco.text
# https://github.com/jaraco/jaraco.text/blob/main/NEWS.rst
pkgver=3.14.0
pkgrel=1
pkgdesc='Module for text manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.text'
license=('MIT')
depends=('python' 'python-jaraco.functools' 'python-jaraco.context' 'python-autocommand' 'python-inflect' 'python-more-itertools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-jaraco')
replaces=('python-jaraco')
source=("git+https://github.com/jaraco/jaraco.text.git?signed#tag=v$pkgver")
sha512sums=('6ea46cedd7ae8fb80280e3c95c58a7bdab77176ade823fce63dd656e0e3f7ef70be5f35caad747b11c34e3111b15b964516d49549f077a8a740b848265ce4ba1')
validpgpkeys=(
  'CE380CF3044959B8F377DA03708E6CB181B4C47E' # https://github.com/jaraco.gpg
)

build() {
  cd "$srcdir/jaraco.text"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.text"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$srcdir/jaraco.text"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
