# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin "juster" Davis <jrcd83@gmail.com>
# Generator : pbjam 0.01

pkgname=perl-http-message
pkgver=7.03
pkgrel=1
pkgdesc="HTTP style messages"
arch=(any)
url='https://search.cpan.org/dist/HTTP-Message'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')
options=(!emptydirs)
depends=(perl perl-clone perl-encode-locale perl-http-date perl-io-html
         perl-lwp-mediatypes perl-uri)
checkdepends=(perl-io-compress-brotli perl-test-needs perl-try-tiny)
conflicts=('perl-libwww<6')
source=("https://github.com/libwww-perl/HTTP-Message/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('121643cf3e28e11c2acc626e0d7da37a5b36215dc6fc82478d863ba7ab1dfe2cb3d5b28df20d0f431d7202c2b84a7fefcd052832b6f7f3544d12b847f4696387')

build() {
  cd HTTP-Message-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd HTTP-Message-$pkgver
  make test
}

package() {
  cd HTTP-Message-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
