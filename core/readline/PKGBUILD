# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
_basever=8.3
_patchlevel=0
pkgver=${_basever}.${_patchlevel}
pkgrel=3
pkgdesc='GNU readline library'
arch=('x86_64')
url='https://tiswww.case.edu/php/chet/readline/rltop.html'
license=('GPL-3.0-or-later')
backup=('etc/inputrc')
depends=(
  glibc
  libncursesw.so
  ncurses
)
provides=(
  libhistory.so
  libreadline.so
)
options=('!emptydirs')
source=(
  https://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz{,.sig}
  8.3.0-display-null-prompt.patch
  8.3.0-event-hook.patch
  inputrc
    )
b2sums=('45d6fe7e34c56d309102a94aa776a7f5284201e844450e14ff818df9fa84a72154bdca70f11828c94954b080cbbe4666fa0b00ffa8460118ec8f3ea551b73dad'
        'SKIP'
        '5dd79798607d477ba626e4aeeb4a80865b997edba00fb1774c802ecaa0617ad9a9c0903b1b84cf9896737d838ffe216e5106372e62e8ffa600e53037cfaffbea'
        'fe4dd88248792b766bfa8e1783d1b81c83ec30e9526fceae3a5696e564e875c189ae78ace63b4773f618224a0f2f865b535ca6ae9502440477fab50981661c0a'
        '50db43bff430f282175aba4c4259e0b2222bc7e342fbe47b9dcce0172458472e72aebb9852eeafa4d10d4e89f2e1e8bb83b6b5dfc68eeababe699d4b5eae80f7')
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [ $_patchlevel -gt 0 ]; then
    for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} https://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//.}-$(printf "%03d" $_p){,.sig})
    done
fi

prepare() {
  cd $pkgname-$_basever
  for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
    msg "applying patch readline${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../readline${_basever//.}-$(printf "%03d" $_p)
  done

  # fix iwctl crashing, issue number #1
  # upstream: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
  patch -Np2  -i ../8.3.0-display-null-prompt.patch

  # fix an other issue:
  # upstream: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00012.html
  patch -Np2 -i ../8.3.0-event-hook.patch

  # remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd $pkgname-$_basever

  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}

package() {
  make -C $pkgname-$_basever DESTDIR="$pkgdir" install
  install -Dm644 inputrc "$pkgdir"/etc/inputrc
}
