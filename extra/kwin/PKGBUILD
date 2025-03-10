# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin
pkgver=6.3.2.1
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=4
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze
         gcc-libs
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kidletime
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwayland
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libei
         libepoxy
         libinput
         libpipewire
         libqaccessibilityclient-qt6
         libx11
         libxcb
         libxcvt
         libxi
         libxkbcommon
         libxkbcommon-x11
         mesa
         pipewire-session-manager
         libplasma
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-sensors
         qt6-svg
         qt6-tools
         qt6-wayland
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols
             python
             wayland-protocols
             xorg-xwayland)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/kwin/-/commit/bb263454.patch
        https://invent.kde.org/plasma/kwin/-/commit/e652bdd3.patch)
install=$pkgname.install
sha256sums=('e6123eda2b1fd9f65b36061fdacf96234068d1e24fa7a3352288f4d51b2fc4c2'
            'SKIP'
            '2d27a8deb86a76b5da155c6c9d133ce1c9bdaa56cc5053a2f38d451899f5c585'
            '8b4ba379d96b2619ba3e697ab342d0ba997c96b998b1e8207217189b4f2fe865')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < bb263454.patch
  patch -d $pkgname-$pkgver -p1 < e652bdd3.patch # Fix black screen with some multi monitor configurations
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
