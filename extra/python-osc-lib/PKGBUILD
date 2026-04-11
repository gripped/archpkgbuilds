# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-osc-lib
pkgver=4.0.2
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
sha512sums=('df5e2055015a29088c1fe5e7fd7535030b1dbf5b49b3d42b9f573b73ba408e79a861dff9851f647abec63227bb34b94aac9e5b00c1c1de159b25e083363c037e')

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
