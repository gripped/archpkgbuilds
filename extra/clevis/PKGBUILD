# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=clevis
pkgver=21
pkgrel=1
pkgdesc='Automated Encryption Framework'
arch=('x86_64')
url='https://github.com/latchset/clevis'
license=('GPL3')
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
sha512sums=('4805c247d6a8a102ef04905d9070f83331af02aa01057c62215aca85d454164d18af45621db1ea8421639521d9d5764ebf4b2b9df521ec2ed6825838b76ed14d')
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
