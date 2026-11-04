# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox
_commit='5ba8c92163b9ece224dd16d23ca590091c16e4af'
pkgver=1.3.7+248+g5ba8c921
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
sha256sums=('17b06e4df3d2ca6871d2a89f0c3ce0a4f7d8ef6c709421990ad3f7a38ea6fb33'
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
