# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: dnuux <dnuuxx@gmail.com>

pkgname=python-faker
pkgver=28.0.0
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
sha512sums=('424480263fe8ed00bf1a2c93a1fe91f14f67e2e2ea59c0287afe2914b1546d3da68fadae2b26f40a39fd3e0781f5f95f8eff2289ef12b7452b24a8c3636bf969')

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
