# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

_pkgbasename=libssh2
pkgname=lib32-$_pkgbasename
pkgver=1.11.0
pkgrel=1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (32-bit)"
url="https://www.libssh2.org/"
arch=('x86_64')
license=('BSD')
depends=('lib32-openssl' 'lib32-zlib' $_pkgbasename)
provides=('libssh2.so')
source=("https://www.libssh2.org/download/${_pkgbasename}-${pkgver}.tar.gz"{,.asc})
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2')   # Daniel Stenberg
sha512sums=('ef85e152dc252bd9b1c05276972b9c22313f5d492743dde090235742746d67f634f2a419eff9162132e2274c8582113b75279b074e0c7b34b2526b92fd1a1e8e'
            'SKIP')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbasename}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbasename}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
