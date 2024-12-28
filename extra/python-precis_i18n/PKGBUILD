# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archliunx.org>

_pkgname=precis_i18n
pkgname=python-precis_i18n
pkgver=1.1.1
pkgrel=2
pkgdesc='PRECIS framework (RFC 8264, RFC 8265, RFC 8266)'
url='https://github.com/byllyfish/precis_i18n'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d7245c89c8faa34723b00fb643ca4bd33cb83fb326228af0a4eba951134b0c47513268f54acb01d3a06baeb755d65b6a41a355a792ee34dc0a2379e43826aadf')
b2sums=('3f7d5b7d70160f2cd1ad356b95ff6837023961bd98ad57860fe537783b4bf1a4efe57478c38549844e67970cdcf06bb405e308083a72ff7e34a70b5ea10623d1')

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_pkgname}-${pkgver}
  pytest
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
