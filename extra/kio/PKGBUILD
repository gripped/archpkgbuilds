# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio
pkgver=6.19.0
pkgrel=2
pkgdesc='Resource and network access abstraction'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(acl
         gcc-libs
         glibc
         karchive
         kauth
         kbookmarks
         kcolorscheme
         kcompletion
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kguiaddons
         ki18n
         kiconthemes
         kitemviews
         kjobwidgets
         kservice
         kwallet
         kwidgetsaddons
         kwindowsystem
         libxml2
         libxslt
         qt6-base
         solid
         util-linux-libs)
makedepends=(doxygen
             extra-cmake-modules
             kdoctools
             qt6-tools)
optdepends=('audiocd-kio: for accessing audio CDs'
            'kded: proxy management and cookie storage'
            'kdoctools: for the help kioslave'
            'kio-extras: extra protocols support (sftp, fish and more)'
            'kio-fuse: to mount remote filesystems via FUSE'
            'switcheroo-control: hybrid GPU support')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/frameworks/kio/-/commit/bcc84065.patch)
sha256sums=('06de4ce5c91aac91a127c50bd9caad6fbdef26c6c86164ed28a546a8e4cf0567'
            'SKIP'
            '42816c7399fcc27ceab9728815267b5a0d59d0803646c274550fac1a880942a7')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

prepare() {
  patch -d $pkgname-$pkgver -p1 < bcc84065.patch # Fix writing to smb shares
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
