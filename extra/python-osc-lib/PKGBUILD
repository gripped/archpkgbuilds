# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=4.1.0
pkgrel=1
pkgdesc="OpenStackClient Library"
arch=('any')
url="https://docs.openstack.org/osc-lib/latest/"
license=('Apache-2.0')
depends=('python-pbr' 'python-cliff' 'python-keystoneauth1' 'python-openstacksdk' 'python-oslo-i18n'
         'python-oslo-utils' 'python-requests' 'python-stevedore')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-fixtures' 'python-oslotest' 'python-requests-mock' 'python-stestr'
              'python-testrepository' 'python-testtools')
source=("git+https://github.com/openstack/osc-lib.git#tag=$pkgver")
sha512sums=('f696ca80deb53ed4d64a137f4ca04b83792e684a1c327a20b0d843a7ef6c34ea67e0f680a47adf4b1584d294c23ef1d7f92effcf4c8cdf1dcf5eb31289232c81')

prepare() {
  cd osc-lib
  # Fix test expectations for program name in argparse usage line
  sed -i "s/parser = argparse.ArgumentParser(/parser = argparse.ArgumentParser(prog='run.py', /g" \
    osc_lib/tests/utils/test_tags.py
}

build() {
  cd osc-lib
  python -m build --wheel --no-isolation
}

check() {
  cd osc-lib
  stestr run
}

package() {
  cd osc-lib
  python -m installer --destdir="$pkgdir" dist/*.whl
}
