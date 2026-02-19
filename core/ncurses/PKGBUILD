# Maintainer:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=ncurses
pkgver=6.6
pkgrel=1
pkgdesc='System V Release 4.0 curses emulation library'
arch=(x86_64)
url='https://invisible-island.net/ncurses/ncurses.html'
license=(MIT-open-group)
depends=(
  glibc
  libgcc
  libstdc++
)
makedepends=(
  autoconf-archive
  git
)
optdepends=('bash: for ncursesw6-config')
provides=(
  libncurses++w.so
  libformw.so
  libmenuw.so
  libpanelw.so
  libncursesw.so
)
replaces=(
  alacritty-terminfo
  rio-terminfo
  wezterm-terminfo
)
source=(
  $pkgname::git+https://github.com/ThomasDickey/ncurses-snapshots.git?signed#tag=v${pkgver/./_}
  $pkgname-6.6-libs.patch
  $pkgname-6.5-20250118-pkgconfig.patch
)
sha512sums=('cad17bf83ef3ccd71fb7c33933ddbbbef2e8bd050d5e4e4ebb344b5df8292b1cd3c9e1787e88087d73cc96f625ba0c7cd6714d7720af7f8bd50b314e9838d2a7'
            '46031bb868d4522c751aa15e569213b172ffb48cf708d9f6188d89a4c9f2085c94cab9f601f1ab16a46e760fe7ef3f06bfa9efb308261ed7c1187cc167829a82'
            '50f18928512b37935d29d463da2013772413752a8718f403d717464e50ea4f8e9b85c0bf6ec1c30c49f2798d2a2814bbb687e254b560faf9543d6142ca27204a')
b2sums=('af7f3dd1fd2d471d6b1b144acfbf4f44bdbf040ff8746a48aa9fdcc86f74a004939a31204d22966ef857096ccd7da6ee74769996e082a5a2735b1e6e934319a3'
        'bcf601da8243e332ace14966fd0f1bb2e11fb1ac11c49260ac711db20efa66f2c7357fcd741eaebf855ce0a205e9b22dd11d2a6523be8e9fb4f1db0d4dfeb482'
        'e98fcd297be873e0719d73b7d1611a98943d5efc3a2c5c1b61b901f36ebe40dd1a98c65b5605ee5ff6a5288e4217bea4d0dddc4767732f464bd4949270e42ac6')
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03')  # Thomas Dickey <dickey@invisible-island.net>

prepare() {
  # do not link against test libraries
  patch -Np1 -d $pkgname -i ../$pkgname-6.6-libs.patch
  # do not leak build-time LDFLAGS into the pkgconfig files:
  # https://bugs.archlinux.org/task/68523
  patch -Np1 -d $pkgname -i ../$pkgname-6.5-20250118-pkgconfig.patch
  # NOTE: can't run autoreconf because the autotools setup is custom and ancient
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-root-access
    --disable-root-environ
    --disable-setuid-environ
    --enable-widec
    --enable-pc-files
    --mandir=/usr/share/man
    --with-cxx-binding
    --with-cxx-shared
    --with-manpage-format=normal
    --with-pkg-config-libdir=/usr/lib/pkgconfig
    --with-shared
    --with-versioned-syms
    --with-xterm-kbs=del
    --without-ada
  )

  # allow building with gcc >= 15
  CFLAGS+=' -std=gnu17'

  cd $pkgname
  ./configure "${configure_options[@]}"
  make
}

package() {
  local _pkgver=${pkgver/_*/}

  make DESTDIR="$pkgdir" install -C $pkgname
  install -vDm 644 $pkgname/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # fool packages looking to link to non-wide-character ncurses libraries
  for lib in ncurses ncurses++ form panel menu; do
    printf "INPUT(-l%sw)\n" "${lib}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv ${lib}w.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done

  # some packages look for -lcurses during build
  printf 'INPUT(-lncursesw)\n' > "$pkgdir/usr/lib/libcursesw.so"
  ln -sv libncurses.so "$pkgdir/usr/lib/libcurses.so"

  # tic and ticinfo functionality is built in by default
  # make sure that anything linking against it links against libncursesw.so instead
  for lib in tic tinfo; do
    printf "INPUT(libncursesw.so.%s)\n" "${_pkgver:0:1}" > "$pkgdir/usr/lib/lib${lib}.so"
    ln -sv libncursesw.so.${pkgver:0:1} "$pkgdir/usr/lib/lib${lib}.so.${_pkgver:0:1}"
    ln -sv ncursesw.pc "$pkgdir/usr/lib/pkgconfig/${lib}.pc"
  done
}
