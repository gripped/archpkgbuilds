# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=toxic
pkgver=0.16.1
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
sha512sums=('19ff76357be3dbde72bc406cc64dd63ad359640aae381f8b07d9fdb6cb4e14ca692748fa0a0ab5f192047dd8fae2f3957c41ffdd597e66bebf993987ee57a018')
validpgpkeys=('BABD00573A065BFA90D53D563627F3144076AE63') # Jfreegman <jfreegman@gmail.com>

build() {
  cd "$pkgname"
  make PREFIX=/usr DISABLE_GAMES=1
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
