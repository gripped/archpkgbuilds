# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: lowercase

pkgname=unace
pkgver=2.5
pkgrel=12
pkgdesc="An extraction tool for the proprietary ace archive format"
arch=('x86_64')
url="https://web.archive.org/web/20170714193504/http://winace.com/"
license=('LicenseRef-Public-UnAce')
depends=('glibc' 'ncurses')
makedepends=('patch')
install=$pkgname.install
changelog=$pkgname.changelog
source=(https://ftp.debian.org/debian/pool/non-free/u/unace-nonfree/unace-nonfree_2.5.orig.tar.gz
        https://salsa.debian.org/fabian/unace-nonfree/raw/6f374bfd86ced925409a8bd70b5786e6020b4cbe/debian/patches/20-isatty.diff
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/01-only-unace.patch
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/02-no-io_h.patch
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/03-gcc-call.patch
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/04-64bit.patch
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/05-warning-fixes.patch
        https://sources.debian.org/data/non-free/u/unace-nonfree/2.5-12/debian/patches/15-format-security.patch)
sha512sums=('f7e9f3431f882160693cb55a90449e881aead9dc501bb4bb8303f04530bd3f6e1d84bbc2775d23e7c680e1e2d55a06872658c4b14c7bf51dd2db73fdcdea953b'
            '61ebf66c1edf15693d59d5444fc9de5911f409981bd81afcfb5ac90c2f165319148f3b3e94e86c79075869247850e33797a3e6f50cfe0fc5789d25522b7621ea'
            'ad1303fdc11ae22045c846a81aadba63cd8ded48abfaf1abe3b34de9b602f24045b67436d2650133b99265e1419bae3aa4a743384ceaeb8fbcf961114dac948f'
            'dcd4dda0662546a12f2cae4b4835ee38730bdb5c231259026b249f2e9b81728690621b35c44794d57a2c52cf669b12233605cb3c528543352271948c2cd7baac'
            'a7cd029a4eb730bff6c0c9be91f052a44875f1c809028f5cbb7be686a7dfcaaa97352e97358e8eccff1ad853c0de8e365ad2d73921e28bf092105b74e0c0c1d0'
            'e991c0cbc48ab09da7e01294b9a08af993ab12d9b3f7e903517ed0b5af970ab475120c0baaa5f7e21b8b5b45bce65b52d940a7ff1648c25765153204323e2760'
            '03e829ba14aa032caf235e74eb2e352ed91a4b2bd2ad8e17dde15359a59f3b64b1bbdba647b7f04d741145130bf99a5acd68fe4b50128a23ff31a1f968efe896'
            '005fb2a72044acf69789d9460f70d052d4b2c40064faeb1003c74b10130ca17fc7f8968742a4701b40cb5f87cdbdf92a127df0eabdf835ed2694cffb58d03b14')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -p1 < ../01-only-unace.patch
  patch -p1 < ../02-no-io_h.patch
  patch -p1 < ../03-gcc-call.patch
  patch -p1 < ../04-64bit.patch
  patch -p1 < ../05-warning-fixes.patch
  patch -p1 < ../15-format-security.patch
  patch -p1 < ../20-isatty.diff

  sed -i '/INT BASE_UNINORM_CP850ToUTF8NFD(UCHAR \*cp1252String\, INT len);/i INT BASE_UNINORM_CP850ToANSI(UCHAR *cp1252String, INT len);' source/base/all/uninorm/uninorm.h
}


build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 unace "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 licence "${pkgdir}"/usr/share/licenses/$pkgname/license
}
