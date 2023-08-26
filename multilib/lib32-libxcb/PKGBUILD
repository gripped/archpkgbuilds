# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libxcb
pkgname=lib32-$_pkgbasename
pkgver=1.16
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
arch=(x86_64)
url="https://xcb.freedesktop.org/"
depends=('lib32-libxdmcp' 'lib32-libxau' 'lib32-glibc' $_pkgbasename)
makedepends=('pkgconfig' 'libxslt' 'python' 'xorg-util-macros' 'gcc-multilib'
             'autoconf' 'xorgproto')
license=('custom')
source=(https://xorg.freedesktop.org/archive/individual/lib/$_pkgbasename-$pkgver.tar.xz{,.sig})
sha512sums=('002fbc126c6f09eb7db5e4197cd0572d495f64b6de714a76d9a024fe3e13122c1cfc7c55207c0dee76cc63fcccf87b37db513223eadaf760af2bd2a926443bf8'
            'SKIP')
validpgpkeys=('A66D805F7C9329B4C5D82767CCC4F07FAC641EFF') # "Daniel Stone <daniels@collabora.com>"
validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC="gcc -m32 -mstackrealign"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  ./autogen.sh \
          --prefix=/usr \
          --enable-xinput \
          --enable-xkb \
          --libdir=/usr/lib32 \
          --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
