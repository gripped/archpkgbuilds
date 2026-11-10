# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s@arch@gmail.com>
# Contributor: Andreas Wagner <Andreas.Wagner@em.uni-frankfurt.de>

pkgname=s-nail
pkgver=14.9.25
pkgrel=2
pkgdesc='Environment for sending and receiving mail'
url='https://www.sdaoden.eu/code.html#s-nail'
license=('custom:BSD')
arch=('x86_64')
depends=('openssl' 'krb5' 'libidn2')
makedepends=('git')
optdepends=('smtp-forwarder: for sending mail')
backup=('etc/mail.rc')
replaces=('mailx' 'mailx-heirloom' 'heirloom-mailx')
provides=('mailx' 'mailx-heirloom' 'heirloom-mailx')
conflicts=('mailx' 'mailx-heirloom' 'heirloom-mailx')
source=("git+https://git.sdaoden.eu/scm/s-nail.git?signed#tag=v${pkgver}"
        "https://github.com/sdaoden/s-mailx/commit/e18fd33710c13947c702143cc3d5a6464ba57019.patch")
sha512sums=('9225f543455c5befc88bb7fe9f5267eff43519020e09ffd0a2117f871f2a60487e3292bbede900716a687b7ab68b5c672e314a51b1282f768f2e5e4f9fb3fd3a'
            'd8ab06a22a72e6f3c12f98921c54e4980ac35d830295e3e1387829e7c35189a5cc953d490043b35da5f9354939709e36667848101ec45c8e6bef507843b56e4c')
validpgpkeys=('EE19E1C1F2F7054F8D3954D8308964B51883A0DD')

prepare() {
	cd ${pkgname}

	# OpenSSL 4 compatibility
	patch -Np1 -i "${srcdir}/e18fd33710c13947c702143cc3d5a6464ba57019.patch"
}

build() {
	cd ${pkgname}
	export CFLAGS+=" $CPPFLAGS"
	make \
		VAL_PREFIX=/usr \
		VAL_SYSCONFDIR=/etc \
		VAL_LIBEXECDIR=/usr/lib \
		VAL_MAIL=/var/spool/mail \
		VAL_SID= VAL_MAILX=mail \
		OPT_AUTOCC=0 \
		config

	make build
}

check() {
	cd ${pkgname}
	make test
}

package() {
	cd ${pkgname}
	make DESTDIR="${pkgdir}" install
	ln -sf mail "${pkgdir}"/usr/bin/mailx
	ln -sf mail.1.gz "${pkgdir}"/usr/share/man/man1/mailx.1.gz
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
