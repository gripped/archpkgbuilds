# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-niche-elf
pkgver=0.3.6
pkgrel=1
pkgdesc='Library that optimizes some niche operations commonly used by debugger extensions'
url='https://github.com/pwndbg/niche-elf'
arch=(any)
license=(GPL-3.0-or-later)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0e1a04436a99b47e241b9ca579d3d9e81f86f35bab26adca2436587e0d8d16ee532169eaea9f9eff832752c68b36f851a18eb34f650ca14c9fcaf8518fcdeee6')
b2sums=('a83f7ed82faa801f00b4dc25e6f0d8d056691b37418d72c69f4a303df3c6cfb7e516a91adfa1117ba3b175d3c3b10299cafd23dd32f36473f120a3c7630e21cd')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
