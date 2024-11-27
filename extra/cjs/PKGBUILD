# Maintainer: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=cjs
pkgver=6.4.0
pkgrel=1
pkgdesc="Javascript Bindings for Cinnamon"
arch=('x86_64')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL')
depends=('gtk3' 'gobject-introspection-runtime' 'js115')
makedepends=('meson' 'samurai' 'gobject-introspection')
checkdepends=('xorg-server-xvfb')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('525f19f7a5fba642b9d98ca29406d6663ca029d0f92d177bb10ffb68f03843085b86dfc623ef49ceada01dacb64e03742f16e9d7e2fb86a3cc67c25b6de4a616')
b2sums=('7cedfa8c9c3b53b417cbe6cebc335cb9ca056c6d98cb6c0abc03db5da678f275ff73b867b4c85289797c4701fe1f4dc10aa257eaa55b97824d9e4bebe61eadeb')

build() {
    mkdir -p ${pkgname}-${pkgver}/builddir
    cd ${pkgname}-${pkgver}/builddir

    meson --prefix=/usr \
          --libexecdir=/usr/lib \
          --buildtype=plain \
          -Dinstalled_tests=false \
          ..

    samu
}

check() {
    cd ${pkgname}-${pkgver}/builddir

    # Needs a display
    xvfb-run meson test --print-errorlogs
}

package() {
    cd ${pkgname}-${pkgver}/builddir

    DESTDIR="${pkgdir}" samu install
}
