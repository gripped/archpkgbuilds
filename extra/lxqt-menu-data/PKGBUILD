# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-menu-data
pkgver=2.5.0
pkgrel=1
pkgdesc='LXQt menu files'
arch=(any)
groups=(lxqt)
url='https://github.com/lxqt/lxqt-menu-data'
license=('GPL' 'LGPL')
makedepends=(cmake lxqt-build-tools qt6-tools)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha512sums=('23c4f5ea49d35a51f3ceab1799a7a19865ffb367c8b93380fafb480c9e241e8c3fa3ec330071bdbc0569218044f3cfbc06b4813c67fb57b9df072e4e90aa77f6'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
