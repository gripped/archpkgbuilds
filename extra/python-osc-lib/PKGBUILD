# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=3.2.0
pkgrel=1
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache-2.0')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-requests' 'python-stevedore')
makedepends=('git' 'python-setuptools')
checkdepends=('python-oslotest' 'python-requests-mock' 'python-stestr' 'python-testrepository'
              'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#tag=$pkgver")
sha512sums=('845cb09806d12ee67fda58d2029235fba4bf6f2af2912efbf90bb060e61ec541b86e130c973940f923db1d77c6d8a9c134e9c21339350e39b3989f22fc5f1b69')

prepare() {
  cd osc-lib
  # Fix test expectations for program name in argparse usage line
  sed -i "s/parser = argparse.ArgumentParser()/parser = argparse.ArgumentParser(prog='run.py')/g" \
    osc_lib/tests/utils/test_tags.py
}

build() {
  cd osc-lib
  python setup.py build
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python setup.py install --root="$pkgdir" --optimize=1
}
