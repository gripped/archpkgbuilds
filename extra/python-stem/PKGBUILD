# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Spider.007 <archlinux AT spider007 DOT net>

pkgname=python-stem
_pypiname=${pkgname#*-}
pkgver=1.8.3
pkgrel=1
pkgdesc='Python controller library for Tor'
url='https://stem.torproject.org/'
arch=('any')
license=('LGPL-3.0-only')
depends=(
  'procps-ng'
  'python'
  'python-cryptography'
  'python-pynacl'
)
checkdepends=('tor')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('tor: tor-server to talk to')
replaces=('stem')
provides=('stem')
source=(https://github.com/torproject/stem/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('789e591d30b5682ef65dd463ca80bfeb4a8bf69348b77c4733a701449bc837f4')

prepare() {
  cd ${_pypiname}-${pkgver}
  # remove flaky integration tests
  sed -i test/settings.cfg \
    -e '/|test.integ.client.connection.TestConnection/d' \
    -e '/|test.integ.process.TestProcess/d' \
    -e '/|test.integ.installation.TestInstallation/d' \
    -e '/|test.integ.control.controller.TestController/d'
  rm test/integ/{client/connection,{installation,process},control/controller}.py
}

build() {
  cd ${_pypiname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pypiname}-${pkgver}
  ./run_tests.py --all
}

package() {
  cd ${_pypiname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim: ts=2 sw=2 et:
