# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-paste
pkgver=3.7.1
pkgrel=1
pkgdesc="Tools for using a Web Server Gateway Interface stack"
arch=('any')
url="https://pythonpaste.readthedocs.io/"
license=('MIT')
depends=('python-six')
optdepends=('python-flup: WSGI utilities')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-flup')
source=("https://files.pythonhosted.org/packages/source/P/Paste/Paste-${pkgver}.tar.gz")
sha512sums=('672f0476582b0c0f65a049800fbd23f7df2c62b405ed1b803474715a80d532bbf117558b201329967bf83f4c88c8740e5f626ff5c2dafa3eade04fccefd332b0')

build() {
  cd Paste-$pkgver
  python setup.py build
}

check() {
  cd Paste-$pkgver
  PYTHONWARNINGS="ignore::DeprecationWarning" pytest
}

package() {
  cd Paste-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
