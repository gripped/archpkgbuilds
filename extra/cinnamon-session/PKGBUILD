# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=cinnamon-session
pkgver=6.6.1
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL' 'LGPL')
depends=('cinnamon-desktop' 'libsm' 'libcanberra' 'xapp')
optdepends=('cinnamon-translations: i18n')
makedepends=(git meson xtrans glib2-devel)
source=(git+${url}#tag=$pkgver)
sha256sums=('941ea06e5d74db150b86118f1bbf6ab0eb9d417cafb7a5d29c93f601c89893ae')
b2sums=('b8c352551d7381fe7dd718a760e77a1d6041065b26d8c88d34b76ea35d252fa25856117cc54038ee385787616828103e7f1b171efc379bc8738a5cb436390446')

build() {
    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          build $pkgname
    meson compile -C build
}

package() {
    meson install -C build --destdir="$pkgdir"
}
