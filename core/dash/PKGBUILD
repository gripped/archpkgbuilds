# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=dash
pkgver=0.5.13.2
pkgrel=1
pkgdesc='POSIX compliant shell that aims to be as small as possible'
url='http://gondor.apana.org.au/~herbert/dash/'
arch=(x86_64)
license=(
  BSD-3-Clause
  GPL-2.0-or-later
)
depends=(
  glibc
  libedit
  libedit.so
)
install=dash.install
source=(
  https://git.kernel.org/pub/scm/utils/dash/dash.git/snapshot/${pkgname}-${pkgver}.tar.gz
)
sha512sums=('5713b61d095f277b5faa9fe64cc4ddb3219e4baad732839a663e9ce7a72d7a59ac7531ed9c53d61af734df9e00a424793a69f164fde7444561106bf068dab57d')
b2sums=('277d12ba6d6949e4a1b1ef9034c97d6f5416d4f4a8e019c8187a55cfa857cf1156a26ef85de600d3a3816c396dff79e03fce1ce7699f23025d061bd471c772cd')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --mandir=/usr/share/man \
    --exec-prefix="" \
    --with-libedit
  make V=1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
