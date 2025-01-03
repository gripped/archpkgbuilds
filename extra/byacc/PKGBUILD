# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jens Adam <jra@byte.cx>
# Contributor: Abel Stern <abel.stern AT gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=byacc
pkgver=20241231
pkgrel=1
pkgdesc='Berkeley reimplementation of the Unix parser generator Yacc'
url='https://invisible-island.net/byacc/'
arch=('x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
replaces=('byacc-noconflict')
source=(${pkgname}::git+https://github.com/ThomasDickey/byacc-snapshots.git#tag=t${pkgver})
sha512sums=('86dd45c8acef0e078448d04078c5cc290952dbf588a98019b4f26984260fb7269b915c6b1207041db6b2df567f5ff5f92120780e39f5c091297c077363285e6c')
#validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03') # Thomas Dickey <dickey@his.com>

build() {
  cd ${pkgname}
  sed -n '/is distributed/,/distributed freely/p' README > LICENSE
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --program-transform=s,^,b, \
    --enable-btyacc
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
