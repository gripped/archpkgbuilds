# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=liblxqt
pkgver=2.5.1
pkgrel=1
pkgdesc="Common base library for LXQt components"
arch=("x86_64")
url="https://github.com/lxqt/$pkgname"
# AUTHORS declares LGPL-2.1+; source headers explicitly allow LGPL version 2.1
# or any later version, hence LGPL-2.1-or-later.
# https://github.com/lxqt/liblxqt/blob/2.5.1/AUTHORS#L9-L10
license=("LGPL-2.1-or-later")
depends=("kwindowsystem" "libxss" "polkit-qt6" "libQt6Xdg.so")
makedepends=("lxqt-build-tools")
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha256sums=('5afcd6093733434e8c91d4fea583fc3597f35f1b751eed750e5e31e1beed063d'
            'SKIP')
validpgpkeys=(
  "169704C6FB490C6892C7F23C37E0AF1FDA48F373"  # Jerome Leclanche <jerome@leclan.ch>
  "7C733BA5F585AAD669E4D23A42C9C8D3AF5EA5E3"  # Alf Gaida <agaida@siduction.org>
  "19DFDF3A579BD509DBB572D8BE793007AD22DF7E"  # Pedram Pourang <tsujan2000@gmail.com>
  "48836EB124A1EAAE695EDFEA229CA0A00A17D258"  # the key owned by an email used by https://github.com/stefonarch/, a long-time LXQt contributor, as per keys.openpgp.org
)

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
