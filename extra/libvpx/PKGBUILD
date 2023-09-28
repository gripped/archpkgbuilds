# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libvpx
pkgver=1.13.0
pkgrel=2
pkgdesc='VP8 and VP9 codec'
arch=(x86_64)
url=https://www.webmproject.org/
license=(BSD)
depends=(gcc-libs)
makedepends=(
  git
  nasm
)
provides=(libvpx.so)
_tag=d6eb9696aa72473c1a11d34d928d35a3acc0c9a9
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag}
        CVE-2023-5217.patch)
sha256sums=('SKIP'
            '06283734652c6f57b4cf398e6da9f9870ba163d198eff0f734246a59248f7a4a')

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd libvpx

# Fix CVE-2023-5217
  patch -p1 -i ../CVE-2023-5217.patch
}

build() {
  cd libvpx

  CFLAGS+=' -ffat-lto-objects'
  CXXFLAGS+=' -ffat-lto-objects'

  ./configure \
    --prefix=/usr \
    --disable-install-docs \
    --disable-install-srcs \
    --disable-unit-tests \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising
  make
}

package() {
  cd libvpx

  make DIST_DIR="${pkgdir}"/usr install
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/libvpx/
}

# vim:set sw=2 sts=-1 et:
