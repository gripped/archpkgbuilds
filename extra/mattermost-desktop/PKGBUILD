# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Raphael Nestler <archlinux@rnstlr.ch>
# Contributor: William Gathoye <william + aur at gathoye dot be>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Jan Was <janek dot jan at gmail dot com>
# Contributor: AUR[Severus]
# Contributor: Matthias Mailänder <matthias@mailaender.name>

pkgname=mattermost-desktop
pkgver=6.2.1
pkgrel=2
pkgdesc='Mattermost Desktop application'
arch=(x86_64)
url="https://github.com/${pkgname/-//}"
license=(Apache-2.0)
_electron=electron41
depends=($_electron
         libxcrypt-compat)
makedepends=(git
             jq
             python-setuptools
             moreutils
             nodejs-lts-jod
             node-gyp
             npm)
_archive="${pkgname#*-}-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('3ca67ef6469e6ed9937e18b06e4d1c5bb944ff7781a6408041b58ba6527d97ff'
            '1c2bf48b6397d04a5a536c5c9f4960db53249c838c380f03f808c612b00ba4c6'
            '13df5ad4c7813986403658f5f88d723907db507703942f3facfb37ceaca657ef')

_npmargs="--cache '$srcdir/npm-cache' --no-audit --no-fund"

prepare() {
	cd "$_archive"
	sed -i -e "s/git rev-parse --short HEAD/echo $pkgver/" webpack.config.base.js
	sed -e "s/@ELECTRON@/$_electron/" "../$pkgname.sh" > "$pkgname.sh"
	# Make sure we are using the same major version of Electron as upstream
	local _origElectron="electron$(jq -r '.devDependencies.electron | split(".")[0]' package.json)"
	if [ "$_electron" != "$_origElectron" ]; then
		echo "Electron version mismatch: $_electron vs $_origElectron"
		exit 1
	fi
	# Substitute our exact distro packaged version of Electron
	local _electronVersion="$(< "/usr/lib/$_electron/version")"
	jq '	.devDependencies["electron"] = $electronVersion |
		del(.devDependencies["electron-rebuild"]) |
		.config.target = $electronVersion |
		.config.runtime = $electronRuntime' \
			--arg electronRuntime "$_electron" \
			--arg electronVersion "$_electronVersion" \
			package.json |
		sponge package.json
	# Change the build type so it doesn't try to bundle Electron
	sed '/module.exports/i config.linux.target = ["dir"];' -i electron-builder.ts
	# Set desktop name to match with the desktop file
	npm pkg set desktopName="$pkgname"
	# Set path for autostart
	sed -i "/new AutoLaunch({/a\            path: '/usr/bin/mattermost-desktop'," src/main/AutoLauncher.ts
	npm $_npmargs install
}

build() {
	cd "$_archive"
	export NODE_ENV=production
	npm $_npmargs --offline run build-prod
	npx electron-builder --linux dir --publish=never
}

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/lib/$pkgname/" release/linux-*unpacked/resources/app.asar
	cp -a release/linux-*unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$pkgname/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	install -Dm0644 src/assets/linux/app_icon.png "$pkgdir/usr/share/icons/$pkgname.png"
	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
}
