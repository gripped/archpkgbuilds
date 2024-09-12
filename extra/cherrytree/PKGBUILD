# Maintainer: 
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree
pkgver=1.1.4
pkgrel=1
pkgdesc="Hierarchical note-taking application"
arch=('x86_64')
url="https://www.giuspen.com/cherrytree/"
license=('GPL-3.0-or-later')
depends=(
  'atkmm'
  'cairo'
  'cairomm'
  'curl'
  'fmt'
  'fribidi'
  'gcc-libs'
  'glib2'
  'glibc'
  'glibmm'
  'gspell'
  'gtk3'
  'gtkmm3'
  'gtksourceview3'
  'gtksourceviewmm'
  'hicolor-icon-theme'
  'libsigc++'
  'libxml++2.6'
  'libxml2'
  'pango'
  'pangomm'
  'sqlite'
  'uchardet'
  'vte3'
)
makedepends=(
  'cmake'
  'python'
  'spdlog'
)
checkdepends=(
  'aspell'
  'hspell'
  'hunspell'
  'libvoikko'
  'nuspell'
  'texlive-bin'
  'texlive-core'
  'xorg-server-xvfb'
)
source=(
  "https://github.com/giuspen/cherrytree/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.xz"{,.asc}
  "0001-removed-fmt-custom-formatter-for-Glib-ustring-2548.patch::https://github.com/giuspen/cherrytree/commit/ccc2d101f24a409efddb2f29e8c14002c9836a85.patch"
  "0002-fixed-fmt-issue-on-fs-path-2548.patch::https://github.com/giuspen/cherrytree/commit/76f0030e2e2b6e1488148d3828baeb8f5911eb8d.patch"
  "0003-fixed-fmt-issue-on-fs-path-2548.patch::https://github.com/giuspen/cherrytree/commit/22142f3b44fef81e67c9bfbcdaed2f80ab2ff5de.patch"
  "0004-fixed-fmt-issue-on-fs-path-2548.patch::https://github.com/giuspen/cherrytree/commit/05233db2b25977037c7520a8316183636a262130.patch"
  "0005-Fix-formatting-issues-with-fmt-11-2548-2560.patch::https://github.com/giuspen/cherrytree/commit/fc1d7499067b9db9841175b5a2d6934dc65e4522.patch"
)
sha512sums=('053871386b4fd5e9964082421c63a10f332942fb1b29e5145b18858a1219ad55e108235dda279bdbf9b3516fd17502c55357e196a327232a6d82aaa1e06598d9'
            'SKIP'
            '5dab5d257edfd3a3b304f407a9ba1790c092553af39564e55a6653977bca2dade7c88787306f914aca7a503b2cdc5c4197cfd6c9a3625cf6dc2349cef0bdfdb8'
            '61f29a14b788ef0b5d6bc24eddd7f70975b261b9013ea60ef724c12428b030b1f8e40a7965ae57159f58191042a43b9d1cc5210e5f1ebb6093939d1b36c31d8d'
            'b7b7ad3ec030ebaae49cbe9fbd69b3d41d71d29fab54c3103b34dfdb6f051e901f4f37f540b0f70765b01268cfb1813c5594f11e77f764a5fdd243986eeaa0ba'
            '63fbb40009bd26cd99a5bb04f768ddece58b2d863412baf7786d989048af482ef7f333aff23d5d8968dcb1678cb0e05032ca5238281f9779a0818433bb2742ce'
            'fe292b4c26e6b891ba11db12bd1d4dd5c5f4424990c03888764c8214cc56b510a29ea852f34d154bc5b886cc43eae5af88eb51565022a090b7fba3498faabec7')
validpgpkeys=('C7BF38CE0BD442C2369AA984049128A20CE0648D') # Giuseppe Penone <giuspen [at] gmail [dot] com>

prepare() {
  cd "${pkgname}_${pkgver}"
  patch -Np1 -i "$srcdir/0001-removed-fmt-custom-formatter-for-Glib-ustring-2548.patch"
  patch -Np1 -i "$srcdir/0002-fixed-fmt-issue-on-fs-path-2548.patch"
  patch -Np1 -i "$srcdir/0003-fixed-fmt-issue-on-fs-path-2548.patch"
  patch -Np1 -i "$srcdir/0004-fixed-fmt-issue-on-fs-path-2548.patch"
  patch -Np1 -i "$srcdir/0005-Fix-formatting-issues-with-fmt-11-2548-2560.patch"
}

build() {
  cmake -B build -S "${pkgname}_${pkgver}" \
  -DINSTALL_GTEST:BOOL='OFF' \
  -DAUTO_RUN_TESTING:BOOL='OFF' \
  -DCMAKE_BUILD_TYPE='None' \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -Wno-dev
  cmake --build build
}

check() {
  xvfb-run build/run_tests_with_x_1
  xvfb-run build/run_tests_with_x_2
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
