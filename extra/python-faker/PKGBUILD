# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=24.4.0
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
source=("git+https://github.com/joke2k/faker.git#tag=v$pkgver")
sha512sums=('0ff170d266d2fea3981baedbf527586096d6e948e74c13c46738a725fa2138ce031edc333bab0748f93da0d8b515c6e9818772a305219887dfdd3f015dab0c46')

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
