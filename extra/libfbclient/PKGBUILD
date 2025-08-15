# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Carlier Laurent <lordheavym@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=libfbclient
pkgver=5.0.3
pkgrel=1
pkgdesc='Client library for Firebird'
arch=(x86_64)
url='https://www.firebirdsql.org'
license=(MPL-1.1 Interbase-1.0)
depends=(gcc-libs libtommath)
makedepends=(git editline libtomcrypt unzip cmake)
options=('!lto') # segfaults with LTO
source=("$pkgname::git+https://github.com/FirebirdSQL/firebird#tag=v$pkgver")
sha512sums=('c96a9c384f12b92a2ab07aabc031ce697e608683c978a6a68c0fa0235593a93809bbc80a636914fea830224207c336c839eeb985759d24658cef9c15329aa1c6')
b2sums=('f16119b11063de5a64157c8ed2d51cda15437739072e202a4408ac26ffd6be57c80381e99cb9d5353de7fe5bdd25dcec4149da91ead0671491019dc3de110ae1')


prepare() {
  cd "$pkgname"

  # Ensure system libs are used
  rm -r extern/{editline,libtommath,libtomcrypt,zlib}

  autoreconf -vfi
}

build() {
  cd "$pkgname"

  local configure_options=(
    --prefix=/usr
    --without-fbsbin
    --without-fbconf
    --without-fbdoc
    --without-fbsample
    --without-fbsample-db
    --without-fbintl
    --without-fbmisc
    --without-fbhelp
    --without-fbsecure-db
    --with-fbmsg=/usr/share/firebird
    --without-fblog
    --without-fbglock
    --without-fbplugins
    --without-fbtzdata
    --with-system-editline
  )

  ./configure "${configure_options[@]}"

  make
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir"/usr/{bin,share/{firebird,licenses/$pkgname}}

  cp -R gen/Release/firebird/{lib,include} "$pkgdir"/usr
  rm -f "$pkgdir"/usr/lib/{libdecFloat.a,libedit.a,libre2.a}

  install -m644 gen/Release/firebird/*.msg "$pkgdir"/usr/share/firebird
  install -m755 gen/Release/firebird/bin/fb_config "$pkgdir"/usr/bin
  install -m644 doc/license/README.license.usage.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -m644 doc/license/IDPL.txt "$pkgdir"/usr/share/licenses/$pkgname/IDPL.txt
}
