# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lynx
pkgver=2.9.0
_relver=$pkgver
pkgrel=1
pkgdesc="A text browser for the World Wide Web"
url="https://lynx.invisible-island.net/"
arch=('x86_64')
license=('GPL-2.0-only')
depends=('glibc' 'openssl' 'libidn2' 'ncurses' 'brotli' 'zlib' 'bzip2')
backup=('etc/lynx.cfg')
options=('!lto')
source=("https://invisible-mirror.net/archives/lynx/tarballs/${pkgname}${_relver}.tar.bz2"{,.asc})
sha256sums=('5bcae5e2e6043ca7b220963a97763c49c13218d849ffda6be7739bfd5a2d36ff'
            'SKIP')
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03') # Thomas Dickey <dickey@invisible-island.net>

build() {
  cd "${srcdir}/${pkgname}${_relver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-ssl=/usr \
    --enable-externs \
    --enable-nls \
    --enable-ipv6 \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}${_relver}"
  make DESTDIR="${pkgdir}" install

  # FS#20404 - points to local help
  sed -i -e "s|^HELPFILE.*$|HELPFILE:file:///usr/share/doc/lynx/lynx_help/lynx_help_main.html|" "${pkgdir}/etc/lynx.cfg"

  install -d "${pkgdir}/usr/share/doc/lynx"
  cp -rf lynx_help "${pkgdir}/usr/share/doc/lynx"
}
