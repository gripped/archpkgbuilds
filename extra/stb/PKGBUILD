# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Noa-Emil Nissinen <aur.satella@spamgourmet.org>


pkgname=stb
pkgver=r2193.31707d1
pkgrel=1
pkgdesc='Single-file public domain (or MIT licensed) libraries for C/C++'
arch=(any)
url=https://github.com/nothings/stb
license=(MIT)
makedepends=(git)
_commit=31707d14fdb75da66b3eed52a2236a70af0d0960
source=(git+https://github.com/nothings/stb.git#commit=${_commit})
b2sums=('f1d3fa3e690e7e94abb8d10071ea1809acdf7cd6d5c7c10d07d1ba98c2d843bf1c39ce2d7a953133547655554b6cad40b3d9227f29c83f723ff788c3267edbfe')

pkgver() {
  cd stb
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  install -Dm 644 stb/*.{c,h} -t "${pkgdir}"/usr/include/stb/
  install -Dm 644 stb/LICENSE -t "${pkgdir}"/usr/share/licenses/stb/
}

# vim: ts=2 sw=2 et:
