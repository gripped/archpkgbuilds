# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=libime
pkgver=1.1.15
_lmver=20260606
_dictver=20260430
_tablever=20240108
pkgrel=1
pkgdesc="A library to support generic input method implementation"
arch=('x86_64')
url="https://github.com/fcitx/libime"
license=('LGPL-2.1-or-later')
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
sha512sums=('a691aa9e0ac697a90d6d0df9bb6306a9a7adf2b296f9bc8b4396cc2400ac135ba5a83ffc318307e71fa1a665d51070c3a5f78f0aa6830ccd281e5811b7b6993a'
            'SKIP'
            '5e34f20a1645921891cef58fe36e381ba528eb48054c6f6b9e3d297bc2d24d6228c2a5c297b647fa8a2a7b687aa03fe0627448351d7c90b8cac902e0a51dcdf6'
            'c5ba44ba86aefcc56166de01e93432da25daa9629791ba4e844f1181926b4916ba67a6ce20ec7b5183de43e365a6d6ac9fe2d7d53997f548ea562c0c92f31e56'
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
}
