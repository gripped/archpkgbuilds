# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=clevis
pkgver=24
pkgrel=1
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL-3.0-or-later')
depends=('bash' 'jose')
makedepends=('git' 'meson' 'asciidoc' 'audit' 'bash-completion' 'cryptsetup' 'dracut' 'glib2'
             'jansson' 'libpwquality' 'luksmeta' 'openssl' 'tpm2-tools' 'udisks2')
checkdepends=('jq' 'tang')
optdepends=('audit: UDisks2 unlocker support'
            'cryptsetup: LUKS unlocker support'
            'curl: Tang pin support'
            'dracut: dracut unlocker support'
            'glib2: UDisks2 unlocker support'
            'jansson: SSS pin and UDisks2 unlocker support'
            'jq: LUKS edit support'
            'libpwquality: LUKS unlocker support'
            'luksmeta: LUKS and UDisks2 unlocker support'
            'nmap: dracut unlocker support'
            'openssl: SSS pin support'
            'tpm2-tools: TPM2 pin support'
            'udisks2: UDisks2 unlocker support')
source=("git+$url.git#tag=v$pkgver")
sha512sums=('ecbd814961901c11ed5e61639cf4ec7604639c4df54a6bf3cb1e2117e3647092ee0f92078ff4ec656f0c59c6bced43a788ce962f0f6a577c893f03dc7c4aa440')
validpgpkeys=('7CE2CB3D2AF59FE1EA22F551D0D219ED1F7E762C'  # Sergio Correia <scorreia@redhat.com>
	      '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23')  # Github signing key

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	meson --prefix=/usr --libexecdir=/usr/lib --buildtype=plain build
	meson compile -C build
}

check() {
	cd "$pkgname"
	meson test -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" meson install -C build
}
