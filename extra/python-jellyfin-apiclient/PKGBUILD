# Maintainer: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.21.0
pkgrel=2
pkgdesc='Python API client for Jellyfin'
arch=(any)
url=https://github.com/jellyfin/jellyfin-apiclient-python
license=(GPL-3.0-only)
depends=(python python-requests python-urllib3 python-websocket-client python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('2a727a70ff081949608414851d9440dd07008038f9d72ae5f00e2f25dfba4cb2da6164701b69faaec19d76fd258d0113541a2433c74a8f347ee0305788cec78f')

build() {
	cd jellyfin-apiclient-python-$pkgver
	python -m build --wheel --no-isolation
}

check() {
	cd jellyfin-apiclient-python-$pkgver
	pytest
}

package() {
	cd jellyfin-apiclient-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
