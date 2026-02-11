# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-hacking
pkgver=7.0.0
pkgrel=4
arch=('any')
pkgdesc='OpenStack Hacking Guideline Enforcement'
url='https://docs.openstack.org/developer/hacking'
license=('Apache-2.0')
depends=('flake8')
makedepends=('git' 'python-build' 'python-installer' 'python-pbr' 'python-setuptools' 'python-wheel')
checkdepends=('python-subunit' 'python-stestr' 'python-testscenarios' 'python-testtools'
              'python-ddt' 'python-eventlet')
source=("git+https://github.com/openstack/hacking.git#tag=$pkgver")
sha512sums=('82cdb3099877b9bba72855a9c4a2729f03ea94d6ba3f4fa1c8d31befccd250abec044b9fe8fd7c13e54b579634f6280b9d3e9e8e237ce85453e9fee51d28aa8d')

prepare() {
  cd hacking
  sed -i 's/~=/>=/' requirements.txt
}

build() {
  cd hacking
  python -m build --wheel --no-isolation
}

check() {
  cd hacking
  stestr run
}

package() {
  cd hacking
  python -m installer --destdir="$pkgdir" dist/*.whl
}
