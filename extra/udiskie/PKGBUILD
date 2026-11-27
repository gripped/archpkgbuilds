# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: coderobe <coderobe@archlinux.org>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=udiskie
pkgver=2.8.2
pkgrel=1
pkgdesc="Removable disk automounter using udisks"
arch=("any")
url="https://pypi.python.org/pypi/udiskie"
license=("MIT")
depends=("udisks2" "python" "python-gobject" "python-yaml" "python-docopt" "gtk3" "libnotify")
makedepends=("asciidoc" "python-build" "python-installer" "python-setuptools" "python-wheel")
optdepends=("libappindicator-gtk3: --appindicator support")
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/coldfix/$pkgname/tar.gz/v$pkgver")
sha256sums=('41c86803664f26f515d8805f27cd4e913cc5497b5a4146e3d70461aa7b4a75da')

build(){
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	make -C doc
}

package() {
	cd "$pkgname-$pkgver"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -m 0644 -D "doc/$pkgname.8" "$pkgdir/usr/share/man/man8/$pkgname.8"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -dm755 "$pkgdir/usr/share/zsh/site-functions"
	install -m644 completions/zsh/* "$pkgdir/usr/share/zsh/site-functions"
}
