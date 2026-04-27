# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ccache
pkgver=4.13.4
pkgrel=1
pkgdesc='Compiler cache that speeds up recompilation by caching previous compilations'
url='https://ccache.dev/'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
  'fmt'
  'glibc'
  'hiredis'
  'libblake3'
  'libgcc'
  'libstdc++'
  'xxhash' 'libxxhash.so'
  'zstd' 'libzstd.so'
)
makedepends=(
  'asciidoctor'
  'cmake'
  'git'
  'perl'
  'tl-expected'
)
checkdepends=('doctest')
source=("git+https://github.com/ccache/ccache.git#tag=v$pkgver?signed")
sha512sums=('a923b8b447e7d60c11e70b8d4ebeb72ad4aa06b0ffbe94cd58adfea373fb8342fd2cf59124ee56ba7c607a9f0d39b8cc916d78f3f2625801608f1b7fb3e3068f')
b2sums=('639bd93acbfe93cc6086942ed1f1976ac717442ad096df3f2ef4fc4a20603d44e48a9d0a15276581fe9249f917015090aad51815b05ecd893680adb5fe6f5f48')
validpgpkeys=('5A939A71A46792CF57866A51996DDA075594ADB8') # Joel Rosdahl <joel@rosdahl.net>

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
  cmake --build build --target doc
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  make DESTDIR="$pkgdir" install -C build
  make DESTDIR="$pkgdir" install -C build/doc

  install -vdm 755 "$pkgdir/usr/lib/ccache/bin"
  local prog
  for prog in gcc g++ c++; do
    ln -vs /usr/bin/ccache "$pkgdir/usr/lib/ccache/bin/$prog"
    ln -vs /usr/bin/ccache "$pkgdir/usr/lib/ccache/bin/$CHOST-$prog"
  done
  for prog in cc clang clang++; do
    ln -vs /usr/bin/ccache "$pkgdir/usr/lib/ccache/bin/$prog"
  done

  cd $pkgname
  install -vDm 644 -t "$pkgdir/usr/share/doc/$pkgname" doc/*.md doc/*.adoc
}
