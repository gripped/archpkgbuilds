# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kde-gtk-config
pkgver=6.0.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=4
pkgdesc='Syncs KDE settings to GTK applications'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glib2
         glibc
         kcolorscheme
         kconfig
         kcoreaddons
         kdbusaddons
         kdecoration
         kguiaddons
         kwindowsystem
         qt6-base
         qt6-svg
         sh
         xsettingsd)
makedepends=(extra-cmake-modules
             gtk3
             sassc)
optdepends=('gtk3: GTK3 apps support')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/kde-gtk-config/-/commit/0760b1fd.patch)
sha256sums=('884570500ced842f1e1c545edf6fdd5036673f83a7188644f8b9f761e2682f7e'
            'SKIP'
            '554291f4c4b8990f09843c7254511251394f98573f34c377a4753bd1d49ed960')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 0760b1fd.patch # Fix update script
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
