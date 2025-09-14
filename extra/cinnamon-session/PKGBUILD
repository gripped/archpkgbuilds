# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=cinnamon-session
pkgver=6.4.2
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL' 'LGPL')
depends=('cinnamon-desktop' 'libsm' 'libcanberra' 'xapp')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai' 'xtrans' 'glib2-devel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e4f0380ef45be08366fcdfbda431c6b0b20760d251ea78b810b4e0e223134690')
b2sums=('f14215e9680ead7ab9220911bc5cd0d348c2d7334bbcb9ca3891ee06d3aae7334c89348937217f47b839b086149be473badaed9a1539b205675f653b332c56af')

build() {
    mkdir -p ${pkgname}-${pkgver}/build
    cd ${pkgname}-${pkgver}/build

    meson --prefix=/usr \
          --libexecdir=lib/${pkgname} \
          --buildtype=plain \
          ..
    samu
}

package() {
    cd ${pkgname}-${pkgver}/build

    DESTDIR="${pkgdir}" samu install
}
