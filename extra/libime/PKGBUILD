# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=libime
pkgver=1.1.16
_lmver=20260629
_dictver=20260703
_tablever=20240108
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=('x86_64')
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later' 'BSD-3-Clause' 'MIT')
depends=('boost-libs' 'fcitx5')
makedepends=('git' 'boost' 'extra-cmake-modules' 'ninja' 'python')
source=("git+https://github.com/fcitx/libime.git#tag=$pkgver?signed"
        "git+https://github.com/kpu/kenlm.git"
        "https://download.fcitx-im.org/data/lm_sc.arpa-$_lmver.tar.zst"
        "https://download.fcitx-im.org/data/dict-$_dictver.tar.zst"
        "https://download.fcitx-im.org/data/table-$_tablever.tar.zst")
noextract=("lm_sc.arpa-$_lmver.tar.zst"
           "dict-$_dictver.tar.zst"
           "table-$_tablever.tar.zst")
sha512sums=('ee985bac1a0654ca94fcb1e1b75984eb2e67c061fd790052d5f1928cda8716d2ffa2c57f9634d2bbce9e0d658a0b0d286fc7196b1ef970e531258b16c93d63c5'
            'SKIP'
            'ae9b77e7ab3007579f5e7455d340e310caaca92b93387bd1025e895f355456601471decac36d8addc02deba9e79f6e8cbf453718d93f04780f0b1b815822e014'
            '2149ff44e98b6552af80770fa77197f5a39c392d4b3617e5ffb4736c4f2d138b98f0ea3ddce6357bb99f04acdd9f9dbe14db51c8d363b731715750db504cc8dc'
            '0d1642ff84e5da2c5b95710e17439bda11b39d3f65d53426bdc03a775dbe592ae64bff8f9191ce27c57b92db8cfed8284a3b6a4f7f02f8ab7fcc8f28cfa0c0ff')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/libime/kenlm.url "$srcdir"/kenlm
  git -c protocol.file.allow=always submodule update

  mv ../lm_sc.arpa-$_lmver.tar.zst data/
  mv ../dict-$_dictver.tar.zst data/
  mv ../table-$_tablever.tar.zst data/
  # grep to make sure the version is correct
  grep lm_sc.arpa-$_lmver.tar.zst data/CMakeLists.txt
  grep dict-$_dictver.tar.zst data/CMakeLists.txt
  grep table-$_tablever.tar.zst data/CMakeLists.txt
}

build() {
  cd $pkgname

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib .
  ninja
}

check() {
  cd $pkgname
  ninja test
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja install

  install -Dm644 src/libime/core/kenlm/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.kenlm"
  install -Dm644 src/libime/core/kenlm/util/double-conversion/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.double-conversion"
  sed -n '6,33p' src/libime/core/kenlm/util/string_piece.hh > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.string_piece"
  sed -n '13,44p' src/libime/core/kenlm/util/integer_to_string.cc > "$pkgdir/usr/share/licenses/$pkgname/LICENSE.integer_to_string"
}
