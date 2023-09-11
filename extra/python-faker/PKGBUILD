# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=19.4.0
_commit=c87c80c99acc5febe4a750c6c5b60401eb04a7b1
pkgrel=1
pkgdesc='Faker generates fake data for you.'
arch=('any')
url='https://faker.readthedocs.io/en/master/'
license=('MIT')
depends=('python-dateutil')
optdepends=('python-xmltodict: for xml provider')
makedepends=('git' 'python-setuptools' 'python-pytest')
checkdepends=('python-validators' 'python-ukpostcodeparser' 'python-freezegun' 'python-pillow'
              'python-xmltodict')
source=("git+https://github.com/joke2k/faker.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  sed -i -e 's/==/>=/' faker/setup.py
}

build() {
  cd faker
  python setup.py build
}

check() {
  cd faker
  python setup.py egg_info
  python -m pytest
}

package() {
  cd faker
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
