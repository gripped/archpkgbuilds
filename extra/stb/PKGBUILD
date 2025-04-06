# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Noa-Emil Nissinen <aur.satella@spamgourmet.org>


pkgname=stb
pkgver=r2205.f056911
pkgrel=1
pkgdesc='Single-file public domain (or MIT licensed) libraries for C/C++'
arch=(any)
url=https://github.com/nothings/stb
license=(MIT)
makedepends=(git)
_commit=f0569113c93ad095470c54bf34a17b36646bbbb5
source=(git+https://github.com/nothings/stb.git#commit=${_commit})
b2sums=('a14532eadc572dec97fca8ae8b564a35ef7214f5d2f28ea3668629a6ae09881a96b9df66f0cbd0089ddbd09b7d8d96b6620381c3a1b4cd7a19d71e0672f2371a')

pkgver() {
  cd stb
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 stb/*.{c,h} -t "${pkgdir}"/usr/include/stb/
  install -Dm 644 stb/LICENSE -t "${pkgdir}"/usr/share/licenses/stb/
}

# vim: ts=2 sw=2 et:
