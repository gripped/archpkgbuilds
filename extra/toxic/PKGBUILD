# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=toxic
pkgver=0.16.2
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
sha512sums=('c53f47b6577890da49ff9a5fdf6de3a43a83a2d37cb655fb140eee71512d1317cc330857d433e45e75a5790f53a9eae675afd51af2d3ae6212b4a5229dffad47')
validpgpkeys=('BABD00573A065BFA90D53D563627F3144076AE63') # Jfreegman <jfreegman@gmail.com>

build() {
  cd "$pkgname"
  make PREFIX=/usr DISABLE_GAMES=1
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
