# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=firefox-noscript
pkgver=13.6.19
pkgrel=1
pkgdesc="Extension for firefox which disables javascript"
arch=('any')
url="https://noscript.net/"
license=('GPL2')
checkdepends=('jq')
makedepends=('nodejs' 'git' 'npm')
groups=('firefox-addons')
source=("git+https://github.com/hackademix/noscript.git#tag=$pkgver"
	"nscl.git::git+https://github.com/hackademix/nscl.git")
sha256sums=('b02bb681523a05984bad921cca6ca8a9fd91c1b52c1f99213b720386c59453f0'
            'SKIP')
b2sums=('e634e1517212b28152aec1bdc0e9b26d7ea08a12899f6a196d5d413b945e28dbc9f3fdb5dfc7eb9172e005251b3818e1d82c3a8f454c8fc3cc49fef02ca080bb'
        'SKIP')

prepare() {
  cd noscript
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd noscript
  npm install web-ext decomment
  PATH=`pwd`/node_modules/.bin:$PATH bash ./build.sh
}

package() {
  depends=('firefox')
  _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 noscript/xpi/noscript-$pkgver.xpi "${_extension_dest}.xpi"
}
