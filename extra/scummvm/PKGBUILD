# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: Manolis Tzanidakis, Petter Gundersen

pkgname=scummvm
pkgver=2.9.0
pkgrel=1
pkgdesc="A 'virtual machine' for several classic graphical point-and-click adventure games."
arch=('x86_64')
license=('GPL')
url="http://www.scummvm.org/"
depends=('libpng' 'libtheora' 'sdl2' 'sdl2_net' 'fluidsynth' 'flac' 'faad2' 'libvorbis' 'libmad' 'freetype2'
         'libgl' 'glu' 'libjpeg-turbo' 'libmpeg2' 'curl' 'a52dec' 'giflib' 'glew' 'libspeechd' 'gtk3' 'sndio')
makedepends=('mesa')
source=("https://downloads.scummvm.org/frs/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('51236557f93052f2c6f840a135fa775ec4396cfbe618ee74259f29be7e0f0aa6b62d40920e3f03b92991794434ae44ef6f4a26a4615c5e27b362c1545e33b536')
b2sums=('bb9af6016e4849220b873f35f091d31b9648c3e87b3838f6b4605dc727d2a37687e1d8993218715f3579b400eb11a29c52671136e16fac86415fcbbb87f0c016')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --enable-release \
    --enable-all-engines \
    --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
