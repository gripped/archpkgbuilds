# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kbd
pkgver=2.7
pkgrel=1
pkgdesc="Keytable files and keyboard utilities"
arch=('x86_64')
url="http://www.kbd-project.org"
license=('GPL-2.0-or-later')
depends=(
  glibc
  gzip
  pam
)
makedepends=(
  check
  git
)
source=(
  git+https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git#tag=v$pkgver?signed
  fix-euro2.patch
  vlock.pam
)
backup=('etc/pam.d/vlock')
provides=('vlock')
conflicts=('vlock')
replaces=('vlock')
b2sums=('ddc6cdc397ba0a40242ca479542d0173f8f8b5c89775a9c10287e4b88ae72aa23f60b93f044bab79b63950d2eb8fdb2cf21342952a3531ab102a0afef30d5539'
        'd122ddb1a86e7a282df8e438903f94d697e3d18a24154d976334e6b54b8f1cf1df432cf8dbcd98daa55014ada462f284d0319fbf015554266e91f4d2a8bf812b'
        '104543e72331a633572a26059e6dce1f25c3c8d6deabb855dd94bfffb72edf8a53a58c6ea7ef6806dd80bcd6ab0aa47cc1a45cc0cd90330be6514ff7591b5140')
validpgpkeys=(
  '7F2A3D07298149A0793C9A4EA45ABA544CFFD434' #Alexey Gladkov 
)

prepare() {
  cd "${pkgname}"
  # rename keymap files with the same names
  # this is needed because when only name of keymap is specified
  # loadkeys loads the first keymap it can find, which is bad (see FS#13837)
  # this should be removed when upstream adopts the change
  mv data/keymaps/i386/qwertz/cz{,-qwertz}.map
  mv data/keymaps/i386/olpc/es{,-olpc}.map
  mv data/keymaps/i386/olpc/pt{,-olpc}.map
  mv data/keymaps/i386/fgGIod/trf{,-fgGIod}.map
  mv data/keymaps/i386/colemak/{en-latin9,colemak}.map
  # fix euro2 #28213
  patch -Np1 -i ../fix-euro2.patch
  autoreconf -if
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --datadir=/usr/share/kbd --mandir=/usr/share/man --enable-optional-progs
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes
}

check() {
  cd "${pkgname}"

# This test is expected to fail since kbd-fix-loadkmap-compat.patch modifies the binary format
  sed -e 's|dumpkeys-bkeymap ||' -i tests/Makefile

  make check
}

package() {
  cd "${pkgname}"
  make KEYCODES_PROGS=yes RESIZECONS_PROGS=yes DESTDIR="${pkgdir}" install
  install -Dm644 ../vlock.pam "${pkgdir}"/etc/pam.d/vlock
}
