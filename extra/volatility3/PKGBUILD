# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility3
pkgver=2.26.2
pkgrel=2
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3'
arch=(any)
license=(LicenseRef-VolatilityFoundation)
depends=(
  python
  python-capstone
  python-jsonschema
  python-pefile
  python-pycryptodome
  python-yara
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  unzip
)
provides=(volatility)
replaces=(volatility)
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}-linux-sample-1.bin.gz::https://downloads.volatilityfoundation.org/volatility3/images/linux-sample-1.bin.gz"
  "${pkgname}-symbols-linux.zip::https://downloads.volatilityfoundation.org/volatility3/symbols/linux.zip"
)
sha512sums=('00597fde942995741d4439aac8fc51c050267ded1ff38ef726886c69ac98fcb7a7092845c433eac470d5b2dc79abf72d95095b72b6e8e9ff100ef652fe4a2ead'
            '82a34aa1d4e7d7deb9ea12e892f14ba0a28908b2da2e31ca76efd1e9e59d87769064a1ffffe8979a58b992cea7005fa20954df50984dbe1dd186513ad95168d7'
            '59056044c3702c1ffd5f1490cb457831d65d1f48fbc523da92b950963155df994a2ff2f11abd5f3b1a977c7f28ed48b3b256c88f81dfa96a66419cb50934ba49')
b2sums=('4c0a27af5145182000fae8412d138a1656343846b32010f2dca2d038ef405cfcd38efc748a0cd7359c645c998dd72e7ffdccf3007305a8f9f19105c782d8f212'
        '3321e991a50b6e4ccf19e0ee48d779664f43f4cdbdb950ca31a5d08c8ee9de0018e2d4f69f42206f7e8f1c6ea735c47f8aa42806ed0f85e9a837b611f07b3289'
        '53cd49663938c6f39e71193ae225e4985f8d0e6d301f2420eaa021c2722bfa6f9c9e7d029854b81f4cdd47bf2870e28efeff432fdc1281842b54ee9ffe6e3807')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  mkdir -p test_images
  gzip -dc ../${pkgname}-linux-sample-1.bin.gz > test_images/linux-sample-1.bin

  mkdir -p volatility3/symbols
  unzip ../${pkgname}-symbols-linux.zip -d volatility3/symbols

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ./test/plugins/linux/linux.py --volatility=volshell.py --image-dir=./test_images -k test_linux_volshell -v
  test-env/bin/python -m pytest ./test/plugins/linux/linux.py --volatility=vol.py --image-dir=./test_images -k "test_linux and not test_linux_volshell" -v --durations=0
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
