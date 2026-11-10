# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox
_commit='a4287bd28d68d8bdb4dc6595f01c8e2b0c21dbea'
pkgver=1.3.7+268+ga4287bd2
pkgrel=1
pkgdesc='A lightweight and highly-configurable window manager'
arch=('x86_64')
url='http://www.fluxbox.org/'
license=('MIT')
depends=(
  'bash'
  'fontconfig' 'libfontconfig.so'
  'fribidi' 'libfribidi.so'
  'glibc'
  'imlib2' 'libImlib2.so'
  'libgcc' 'libgcc_s.so'
  'libstdc++' 'libstdc++.so'
  'libx11' #'libX11.so'
  'libxext' #'libXext.so'
  'libxft' #'libXft.so'
  'libxinerama' #'libXinerama.so'
  'libxpm' #'libXpm.so'
  'libxrandr' #'libXrandr.so'
  'libxrender' #'libXrender.so'
)
makedepends=('git')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=("git+https://github.com/fluxbox/fluxbox.git#commit=${_commit}"
        'fluxbox.desktop')
sha256sums=('24d8b66a8e2bdac7c8f28ac0b06c9dc3f499bc18f8015067a7f9c10d144b857c'
            '2148a90aca653b596e9632264dbdbd8c7e673d732e4b04eee66a8ac1e68b3c5d')

pkgver() {
  cd "${pkgname}"

  git describe --tags | sed 's/Release-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${pkgname}"

  autoreconf -fi
}

build() {
  cd "${pkgname}"

  ./configure \
    --prefix=/usr \
    --enable-imlib2 \
    --enable-nls \
    --enable-xft \
    --enable-xinerama
  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -D -m0644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
