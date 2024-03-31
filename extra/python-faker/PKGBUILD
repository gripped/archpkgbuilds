# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=24.3.0
_commit=93bfa1cba061333a7c17462c7b6e65046c891eaf
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
sha512sums=('4979687e87156d399bcef897208646bb58123349bfe128b3feb0261fc46b9870fe10ff63f813c83f9a5b8393636877b1b24cdbfd942cbb34172fb899a6f9f03e')

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
