# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrum
pkgver=4.5.3
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
makedepends=('python-setuptools')
depends=('python-pyaes' 'python-ecdsa' 'python-pbkdf2' 'python-requests' 'python-qrcode'
         'python-protobuf' 'python-dnspython' 'python-jsonrpclib-pelix' 'python-pysocks'
         'python-pyqt5' 'python-pycryptodomex' 'python-websocket-client' 'python-certifi'
         'python-aiorpcx' 'python-aiohttp' 'python-aiohttp-socks'
         'libsecp256k1' 'python-bitstring' 'python-jsonpatch')
optdepends=('python-btchip: BTChip hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-qdarkstyle: optional dark theme in graphical mode'
            'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
         )

url="https://electrum.org"
license=('MIT')
source=("https://download.electrum.org/${pkgver}/${pkgname^}-${pkgver}.tar.gz"
        "${pkgname^}-${pkgver}.tar.gz.asc::https://download.electrum.org/${pkgver}/${pkgname^}-${pkgver}.tar.gz.ThomasV.asc")
sha512sums=('6a005b3351c9cedcef69343fa85c3a9f3ed61c99d8e75c9e483aefd90fe2c53dc6b55d8b592796c7d2cc32b4db7425339af08a9851cc17685869b4a8f51f591e'
            'SKIP')
validpgpkeys=('6694D8DE7BE8EE5631BED9502BD5824B7F9470E6')

prepare() {
  cd "${pkgname^}-${pkgver}"
}

build() {
  cd "${pkgname^}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname^}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 LICENCE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
