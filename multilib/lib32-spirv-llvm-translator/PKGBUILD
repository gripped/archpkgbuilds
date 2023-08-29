# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>

_srcname=SPIRV-LLVM-Translator
pkgname=lib32-${_srcname,,}
pkgver=16.0.0.r9+g322fca5d
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR (32-bit)"
arch=(x86_64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(custom)
depends=(lib32-llvm-libs lib32-spirv-tools ${pkgname#lib32-})
makedepends=(git cmake llvm lib32-llvm spirv-headers)
# Current point in the used LLVM branch
_commit=322fca5d9c59bfdb80562a52ace51cdbe2a60e92
source=(git+${url}.git#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd ${_srcname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

build() {
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -B build -S ${_srcname} \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_FLAGS:STRING=-m32 \
    -DCMAKE_C_FLAGS:STRING=-m32 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_CONFIG="/usr/bin/llvm-config32" \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
    -DLLVM_LIBDIR_SUFFIX=32 \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/{bin,include}
  install -Dm644 ${_srcname}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
