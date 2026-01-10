# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: coderobe <coderobe@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=udiskie
pkgver=2.5.8
pkgrel=2
pkgdesc="Removable disk automounter using udisks"
arch=("any")
url="https://pypi.python.org/pypi/udiskie"
license=("MIT")
depends=("udisks2" "python" "python-gobject" "python-yaml" "python-docopt" "gtk3" "libnotify" "python-keyutils")
makedepends=("asciidoc" "python-setuptools")
optdepends=("libappindicator-gtk3: --appindicator support")
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/coldfix/$pkgname/tar.gz/v$pkgver")
sha256sums=('ade0b67392fe5cfbd3a84c502c1e76bc2edb66e3c7e1d0ccbe2e62421f699674')

build(){
	cd "$pkgname-$pkgver"
	python setup.py build
	make -C doc
}

package() {
	cd "$pkgname-$pkgver"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -m 0644 -D "doc/$pkgname.8" "$pkgdir/usr/share/man/man8/$pkgname.8"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/share/zsh/site-functions"
	install -m644 completions/zsh/* "$pkgdir/usr/share/zsh/site-functions"
}
