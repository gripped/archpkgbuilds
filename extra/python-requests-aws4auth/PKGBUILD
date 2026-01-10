# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

_pkgname=requests-aws4auth
pkgname=python-requests-aws4auth
pkgver=1.3.1
pkgrel=2
pkgdesc='Amazon Web Services version 4 authentication for the Python Requests module'
url='https://github.com/sam-washington/requests-aws4auth'
arch=('any')
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-httpx')
optdepends=('python-httpx')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('478842dc91a3aca6ebbc4b3ee7538bd4c0ec2f71fcf6473842c8389570b1ab7ae2ccf3a64e893999173daee714435a7778c8cf362cf709e0d2f9dd642f1891d1')
b2sums=('f700e71090cc2b69632040471346676ea4de363a640c6b0577158f72afa91679c2f656b3f57fd245829fdf9e8011dd76a0fd655b2fcb78f4d02a10afcc21dc2c')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed '/./{H;$!d} ; x ; s/package_data=.*\n.*]},\n//' -i setup.py
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  python -m pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
