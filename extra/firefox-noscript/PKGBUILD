# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Eli schwartz <eschwartz@archlinux.org>

pkgname=firefox-noscript
pkgver=13.6.23
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
sha256sums=('cfdc85bc05d95119b535606bb6e6570d140e63e541c25d27f9c323a7302bc6f9'
            'SKIP')
b2sums=('fd0bf31975f28777346ab4c9416c492987a6acb3b6b564a7181065a944479b25cc821ac07401f51d541728b603b8991a4742b031a706ece039157b260470d9aa'
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
