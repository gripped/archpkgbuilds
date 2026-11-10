# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=lxqt-archiver
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple & lightweight desktop-agnostic Qt file archiver"
arch=("x86_64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
# Seems all files contain "any later"
license=("GPL-2.0-or-later")
depends=('libfm-qt' 'qt6-base' 'glib2' 'json-glib' 'libfm-qt6.so')
makedepends=('cmake' 'qt6-tools' 'lxqt-build-tools')
optdepends=(
  'libarchive: for handling rpm files'
  'p7zip: 7Z support'
)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('da09ac7e80cdf5ced408c500e1de58196798ff583eded5385ac9da11dae82c78'
            'SKIP')
validpgpkeys=(
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib

  make -C build
}

package() {
  cd build

  make DESTDIR="$pkgdir" install
}
