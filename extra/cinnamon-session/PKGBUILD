# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=cinnamon-session
pkgver=6.0.3
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL' 'LGPL')
depends=('cinnamon-desktop' 'libsm' 'libcanberra' 'xapps')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai' 'xtrans')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('76ce6cd4e09d1da37021cb2aa8e89e55d2f894ee83a926ed68aecabd971c5747')
b2sums=('52e32beb7f055469c016bd0341f113beff03323b8e212df2b9591d93167fa9cb96adbc0a1aca31a4ff5d69d85ffe3af7dff1c7b19d7d20b70b1dcf84abbb8579')

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
