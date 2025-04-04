# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wes Brown <wesbrown18@gmail.com>

pkgname=volatility3
pkgver=2.11.0
pkgrel=1
pkgdesc='Advanced memory forensics framework'
url='https://github.com/volatilityfoundation/volatility3/wiki'
arch=(any)
license=(custom)
depends=(
  python
  python-capstone
  python-jsonschema
  python-pefile
  python-pycryptodome
  python-snappy
  python-yara
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
provides=(volatility)
replaces=(volatility)
source=(https://github.com/volatilityfoundation/volatility3/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6cb02e2db34a64e26115883c7ac545c25effcc5600ec075c7d115c4ec825350788957bc8798370753fb5872467d4438cc45d11f40e8b772dac9ded3ac0148831')
b2sums=('e32a7b804e0cec74d093e56ce5b448ad8f51d268880c103e68a6ab24341492d4acd66eab98bc9afd70ec8df4bb3191620f27f0d71be06cf70669bca114e6d1c1')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
