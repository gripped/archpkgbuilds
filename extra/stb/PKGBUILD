# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Noa-Emil Nissinen <aur.satella@spamgourmet.org>


pkgname=stb
pkgver=r2210.f58f558
pkgrel=1
pkgdesc='Single-file public domain (or MIT licensed) libraries for C/C++'
arch=(any)
url=https://github.com/nothings/stb
license=(MIT)
makedepends=(git)
_commit=f58f558c120e9b32c217290b80bad1a0729fbb2c
source=(git+https://github.com/nothings/stb.git#commit=${_commit})
b2sums=('59ddcabd5f1ecbad2b0838fe92f78a6ba9a95e04cda5a0c86c28464780c07ce873e008ea6dfe46493528d70bf321db14f94fe5e2bba49330099f6b909206b2b0')

pkgver() {
  cd stb
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 stb/*.{c,h} -t "${pkgdir}"/usr/include/stb/
  install -Dm 644 stb/LICENSE -t "${pkgdir}"/usr/share/licenses/stb/
}

# vim: ts=2 sw=2 et:
