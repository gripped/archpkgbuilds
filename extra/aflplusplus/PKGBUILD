# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor GI Jack <GI_Jack@hackermail.com>

pkgname=afl++
pkgver=4.35c
pkgrel=1
pkgdesc='instrumentation-driven fuzzer for binary format'
url='https://aflplus.plus/'
arch=(x86_64)
license=(Apache-2.0)
depends=(
  bash
  clang
  compiler-rt
  gcc-libs
  glib2
  glibc
  lld
  llvm
  python
  python-tqdm
  zlib
)
makedepends=(
  cpio
  git
  grep
  pax-utils
  python-jinja
  python-msgpack
  rust
)
checkdepends=(
  cmake
  cmocka
  meson
)
provides=(
  afl
)
conflicts=(
  afl
  aflplusplus
)
replaces=(
  afl
  aflplusplus
)
options=(!lto)
source=(
  "https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  aflplusplus4.35c-remove-Werror-from-tests.patch::https://github.com/AFLplusplus/AFLplusplus/commit/10f93e79e00c103c2f11a598c00553094fd7b3b1.patch
  aflplusplus4.35c-hopefully-fix-race-in-frida-make.patch::https://github.com/AFLplusplus/AFLplusplus/commit/3a8093f18f262d92cd67ffee329438c53eeeb299.patch
)
sha256sums=('b6e3d90ad65c7adb5681803126454f979e15b1e74323aecf2603cab490202249'
            '8947fc5460bbb2ef075940230f9c32f482c789aa7aa49243713426e05c92504f'
            '4a95255b0da99489213ef2694324461c7e43bb15ff96f5d239818831a82a5781')
b2sums=('b8b068a5b7eca17eee8bc71f70df9220adb438ed82a169fbfb8da1d7948012b712d3d7ac24bddb48f779abb33467211a3d708eb3b4f0b13bc6e5a832c88a922f'
        '017b4d15b885b856c6b359740b20e09808b70163b0650783a08a87574666d3333c4ea384aa8faf23560d178988d0ce41ff4476854e25df5759c85b17d9796a50'
        '3da2c54b6240d19a14249bb74bc7542f7b84dce653a7597c4ab7b1e694b307aa55ee3cb8c93a8c461361c20baba2511e110ede4fc5c56e8b2c0af4a8e2663f3a')

prepare() {
  # https://github.com/AFLplusplus/AFLplusplus/issues/2643
  # Drop afl+ +'s CFLAGS when building qemu due to broken escaping
  sed -i 's|-cd qemu_mode && sh ./build_qemu_support.sh|-cd qemu_mode \&\& unset CFLAGS \&\& sh ./build_qemu_support.sh|' "AFLplusplus-${pkgver}"/GNUmakefile

  cd "AFLplusplus-${pkgver}"
  patch -Np1 < ../aflplusplus4.35c-remove-Werror-from-tests.patch
  patch -Np1 < ../aflplusplus4.35c-hopefully-fix-race-in-frida-make.patch
}

build() {
  cd "AFLplusplus-${pkgver}"
  CFLAGS=${CFLAGS/-fcf-protection/} make PREFIX=/usr
}

check() {
  cd "AFLplusplus-${pkgver}"
  # Unset our CFLAGS/CXXFLAGS for the tests since these may
  # interact in unexpected ways with afl-cc instrumentation.
  CFLAGS= CXXFLAGS= make test
}

package() {
  cd "AFLplusplus-${pkgver}"
  CFLAGS=${CFLAGS/-fcf-protection/} make install PREFIX=/usr DESTDIR="${pkgdir}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
