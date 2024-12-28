# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Carlier Laurent <lordheavym@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=libfbclient
pkgver=4.0.5.3140
pkgrel=1
pkgdesc="Client library for Firebird"
arch=('x86_64')
url="https://www.firebirdsql.org/"
license=('custom')
depends=('gcc-libs' 'libtommath')
makedepends=('editline' 'libtomcrypt' 're2' 'unzip')
source=(https://github.com/FirebirdSQL/firebird/releases/download/v${pkgver%.*}/Firebird-$pkgver-0.tar.xz
        LICENSE)
sha512sums=('716cd8ed7412b02e9a926e2314c0a3a67df946b85d879160710e6f2dc7fa78dcec7b9e514bd7ff653994bcfc3f353f25b5ac158e24c6c1399181aca34c0f2967'
            '1e4c24f60d2cdc1a89b52b45f778ed264ae14428a940b0509ca5c50182aed6149b7a6a546e7d08b0f264bafde81a210abe20db204c20db596f5fc2ec205ac37e')
options=(!lto) # Segfaults with LTO

prepare() {
  # Ensure system libs are used
  rm -r Firebird-$pkgver-0/extern/{editline,libtommath,libtomcrypt,zlib}
  find -type f -exec sed -e 's|c++11|c++17|g' -i {} \;
}

build() {
  cd Firebird-$pkgver-0

  ./configure --prefix=/usr \
    --without-fbsbin --without-fbconf --without-fbdoc --without-fbsample \
    --without-fbsample-db --without-fbintl --without-fbmisc --without-fbhelp \
    --without-fbsecure-db --with-fbmsg=/usr/share/firebird --without-fblog \
    --without-fbglock --without-fbplugins --without-fbtzdata --with-system-editline

  make
}

package() {
  cd Firebird-$pkgver-0

  mkdir -p "$pkgdir"/usr/{bin,share/{firebird,licenses/$pkgname}}

  cp -R gen/Release/firebird/{lib,include} "$pkgdir"/usr
  rm -f "$pkgdir"/usr/lib/{libdecFloat.a,libedit.a,libre2.a}

  install -m644 gen/Release/firebird/*.msg "$pkgdir"/usr/share/firebird
  install -m755 gen/Release/firebird/bin/fb_config "$pkgdir"/usr/bin
  install -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # Add libgds support FS#30062 FS#30282
  cd "$pkgdir"/usr/lib
  ln -s libfbclient.so libgds.so.0
  ln -s libfbclient.so libgds.so
}
