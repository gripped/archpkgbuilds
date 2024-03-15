# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: AliReza AmirSamimi <alireza.amirsamimi at gmail dot com>
# Contributor: M A <morealaz at gmail dot com>

pkgname=persepolis
pkgver=4.0.0
pkgrel=1
pkgdesc='Qt front-end for aria2 download manager'
arch=('any')
url='https://persepolisdm.github.io/'
license=('GPL3')
depends=('aria2' 'ffmpeg' 'libnotify' 'libpulse' 'python-psutil' 'pyside6' 'python-requests'
         'python-setproctitle' 'qt6-svg' 'sound-theme-freedesktop' 'yt-dlp')
makedepends=('python-setuptools')
source=("https://github.com/persepolisdm/persepolis/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5d066cf3491511d81730e24319d414830791cd5e717e72219f81157cae623e9e')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|/usr/share/pixmaps/|/usr/share/icons/hicolor/scalable/apps/|' setup.py
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver 
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
