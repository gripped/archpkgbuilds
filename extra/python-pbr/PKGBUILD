# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-pbr
pkgver=7.0.2
pkgrel=1
pkgdesc="Python Build Reasonableness"
arch=('any')
url='https://pypi.python.org/pypi/pbr'
license=('Apache-2.0')
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testresources' 'python-testscenarios'
              'python-testtools' 'python-virtualenv' 'python-sphinx' 'python-testrepository')
source=("git+https://github.com/openstack-dev/pbr.git#tag=$pkgver")
sha512sums=('78f755684d783207291ffdbdf1c61caaf99f62915961a259c4c7ff676f6d190fa80449408186777d6fb7a708d5d1f74f08c0ce9f63b9de2313120214aee4c15f')

build() {
  cd pbr
  python -m build --wheel --no-isolation
}

check() {
  cd pbr
  stestr run --exclude-regex 'test_pep_517_support|test_requirement_parsing'
}

package() {
  cd pbr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
