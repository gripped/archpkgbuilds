# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-copr
pkgver=1.125
pkgrel=1
pkgdesc="Python interface for Copr"
url="https://github.com/fedora-copr/copr"
license=('GPL')
arch=('any')
depends=('python-filelock' 'python-requests' 'python-requests-toolbelt' 'python-setuptools'
         'python-six' 'python-munch' 'python-future')
checkdepends=('python-pytest' 'python-requests-gssapi')
source=("https://github.com/fedora-copr/copr/archive/python-copr-$pkgver-1.tar.gz")
sha512sums=('1440acb90d41e1aa396f5d31c2250117d8aac95f977b22bbb64c6c39a2ffd079df9c708e176573e9b94d33397666d5511d927730b7a27ccd5de5cd61fdf1decc')

build() {
  cd copr-python-copr-$pkgver-1/python
  python setup.py build
}

check() {
  cd copr-python-copr-$pkgver-1/python
  python -m pytest
}

package() {
  cd copr-python-copr-$pkgver-1/python
  python setup.py install --root="$pkgdir" --optimize=1
}
