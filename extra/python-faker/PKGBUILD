# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=25.3.0
pkgrel=1
pkgdesc='Faker generates fake data for you.'
arch=('any')
url='https://faker.readthedocs.io/en/master/'
license=('MIT')
depends=('python-dateutil')
optdepends=('python-xmltodict: for xml provider')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
checkdepends=('python-validators' 'python-ukpostcodeparser' 'python-freezegun' 'python-pillow'
              'python-xmltodict')
source=("git+https://github.com/joke2k/faker.git#tag=v$pkgver")
sha512sums=('c21b35e878253727ac71db9f4123364827cad1eee23b28f6800acb43da37e3d8fb145ff8e909659134a00a6e9a278ebdeadd916ecd7e7f0a723b23a0672587a9')

build() {
  cd faker
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd faker
  python setup.py egg_info
  python -m pytest
}

package() {
  cd faker
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/faker-$pkgver.dist-info/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
