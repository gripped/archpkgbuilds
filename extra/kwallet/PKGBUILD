# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet
pkgver=6.0.0
pkgrel=3
pkgdesc='Secure and unified container for user passwords'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         gpgme
         kcolorscheme
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         knotifications
         kwidgetsaddons
         kwindowsystem
         libgcrypt
         qca-qt6
         qt6-base)
makedepends=(doxygen
             extra-cmake-modules
             kdoctools
             kservice
             qt6-doc
             qt6-tools)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kwallet/-/commit/be09140e.patch)
sha256sums=('bab43823de8b1b086dc4b2ad10d10bd6c4d0d2e1f8b5fd5fdd5f7d365fb8e5cc'
            'SKIP'
            '1bffd652780d29bf7ea17b20b914a101b51223f7afa40447b34299beec454c3c')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB  # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D) # Jonathan Esk-Riddell <jr@jriddell.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < be09140e.patch # Fix kwallet-query
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# Fix conflicts for now
  rm "$pkgdir"/usr/share/dbus-1/services/org.kde.kwalletd5.service
}
