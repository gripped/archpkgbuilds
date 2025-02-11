# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=toxic
pkgver=0.16.0
pkgrel=1
pkgdesc='CLI Tox client'
arch=('x86_64')
url='https://github.com/JFreegman/toxic'
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'freealut'
  'glibc'
  'libconfig'
  'libnotify'
  'libpng'
  'libvpx'
  'libx11'
  'ncurses'
  'openal'
  'qrencode'
  'toxcore'
)
makedepends=('git')
source=("git+https://github.com/JFreegman/$pkgname?signed#tag=v$pkgver")
sha512sums=('481419e24597c18a921ef760ace815056eec3bf54496cca497a424c6bc873a2ad7cd30a84a6218bc8c248e7277bcb296080fbf4608193ea66d8bc550e2839d63')
validpgpkeys=('BABD00573A065BFA90D53D563627F3144076AE63') # Jfreegman <jfreegman@gmail.com>

build() {
  cd "$pkgname"
  make PREFIX=/usr DISABLE_GAMES=1
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
