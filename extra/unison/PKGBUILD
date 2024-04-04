# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: xs5871 <xs5871@qn-4.net>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison
pkgver=2.53.4
pkgrel=3
pkgdesc='File-synchronization tool'
url="https://github.com/bcpierce00/$pkgname/"
arch=(x86_64)
license=(GPL-3.0-Only)
optdepends=('gtk3: graphical interface')
makedepends=(emacs
             lablgtk3
             ocaml)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
        "$pkgname.desktop")
sha512sums=('91077955aabbd919e6d6df04a704878238d745ac3693e0e41b8a37a922db4ebfceb204378ab1283303ef5ad9d80445bc8caeafad36f67b8df8c30d8b4e0c6947'
            '3e6e7b793deb60dab64c6e585e3b2ceee01ced0f8b73d1373ac1cd8aaaadb5c7415f2295b8a044a57fc15356dfe76bab002e1e633495e5f8e436871c83c48990')
options=('!makeflags')

build() {
	cd "$_archive"
	export CFLAGS=
	make all DEBUGGING=false THREADS=true
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "src/$pkgname"{,-fsmonitor,-gui}
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "../$pkgname.desktop"
	install -Dm0644 -t "$pkgdir/usr/share/man/man1/" man/*.1
	install -Dm0644 icons/U.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
	for i in 16 24 32 48 256; do
		install -Dm0644 "icons/U.${i}x${i}x16m.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
}
