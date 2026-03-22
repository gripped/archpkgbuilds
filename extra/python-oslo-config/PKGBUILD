# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>

pkgname=python-oslo-config
pkgver=9.6.1
pkgrel=2
pkgdesc="parsing command line arguments and .ini style configuration files"
arch=('any')
url="https://pypi.python.org/pypi/oslo.config/$pkgver"
license=('Apache-2.0')
depends=('python-debtcollector' 'python-netaddr' 'python-stevedore'
         'python-oslo-i18n' 'python-rfc3986' 'python-yaml' 'python-requests')
optdepends=('python-sphinx: for rst-generator')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-pbr')
checkdepends=('python-testscenarios' 'python-stestr' 'python-testtools' 'python-oslotest'
              'python-oslo-log' 'python-requests-mock' 'python-sphinx')
options=('!emptydirs')
source=(
  "git+https://github.com/openstack/oslo.config.git#tag=$pkgver"
  "$pkgname-python-3.14.patch"
)
sha512sums=('213334295aad2ab10e9816677fbf10e38e150558a447cd2f4e07900bda55e6b1719b7e634a73bae3f825a1bda0cfd805ff8cb6dd50a6469e0adad13a7ecfc0e9'
            '84c6db3076dcd0190f467313efb3df66925bdf0c3db377bf118564af341304eaae0799aaa746058549b9c6cef4199daf5b8c272d29ffb534432411863dcfb5d5')

prepare() {
  cd oslo.config
  # Fix test_sub_command_multiple on Python 3.12.5+
  git cherry-pick -n 972d304bb23baef538ce759004410a20d8109ccb

  patch -Np1 < ../$pkgname-python-3.14.patch
}

build() {
  cd oslo.config
  python -m build --wheel --no-isolation
}

check() {
  cd oslo.config
  stestr run
}

package() {
  cd oslo.config
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
