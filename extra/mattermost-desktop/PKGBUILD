# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Raphael Nestler <archlinux@rnstlr.ch>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: AUR[Severus]
# Contributor: Matthias Mailänder <matthias@mailaender.name>

pkgname=mattermost-desktop
pkgver=5.13.0
pkgrel=1
pkgdesc='Mattermost Desktop application'
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(Apache-2.0)
_electron=electron37
depends=($_electron
         libxcrypt-compat)
makedepends=(git
             jq
             python-setuptools
             moreutils
             nodejs-lts-iron
             node-gyp
             npm)
_archive="${pkgname#*-}-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('36514c732511ca587de3d336a91f305392179bb5063fc8b1f94e2236bcdaf63b'
            '1c2bf48b6397d04a5a536c5c9f4960db53249c838c380f03f808c612b00ba4c6'
            '27c798af15d6aefbd41da5aacb9f9b15438349c649e9c05658387981760fd3b7')

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"

prepare() {
	cd "$_archive"
	sed -i -e "s/git rev-parse --short HEAD/echo $pkgver/" webpack.config.base.js
	sed -e "s/@ELECTRON@/$_electron/" "../$pkgname.sh" > "$pkgname.sh"
	local _electronVersion="$(< "/usr/lib/$_electron/version")"
	jq '	.linux["target"] = [ "dir" ]' electron-builder.json |
		sponge electron-builder.json
	jq '	.devDependencies["electron"] = $electronVersion |
		del(.devDependencies["electron-rebuild"]) |
		.config.target = $electronVersion |
		.config.runtime = $electronRuntime' \
			--arg electronRuntime "$_electron" \
			--arg electronVersion "$_electronVersion" \
			package.json |
		sponge package.json
	sed -i 's/ && cross-env CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ electron-builder --linux tar.gz --arm64 --publish=never//g' package.json
	npm $_npmargs install
}

build() {
	cd "$_archive"
	export NODE_ENV=production
	npm $_npmargs --offline run build
	npm $_npmargs --offline run package:linux-tar
}

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" release/linux-unpacked/resources/app.asar
	cp -a release/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$pkgname/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -Dm0644 src/assets/linux/app_icon.png "$pkgdir/usr/share/icons/$pkgname.png"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
}
