# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=cinnamon-session
pkgver=6.4.0
pkgrel=1
pkgdesc="The Cinnamon Session Handler"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL' 'LGPL')
depends=('cinnamon-desktop' 'libsm' 'libcanberra' 'xapps')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai' 'xtrans' 'glib2-devel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('464075d920df360b5ad94f72395a09b5fbf8b14f0190406ec76055a17659e243')
b2sums=('13bed1e5cec912f679c13c9ef8e4bbca8c267c37663910ba0a82e78074c77405c259020dffb86c843f2e080792e836a567d120eb5c80459e870a29a959f7f4a3')

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
