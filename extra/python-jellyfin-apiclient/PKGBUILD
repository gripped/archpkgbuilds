# Maintainer: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.19.0
pkgrel=1
pkgdesc='Python API client for Jellyfin'
arch=(any)
url=https://github.com/iwalton3/jellyfin-apiclient-python
license=(GPL-3.0-only)
depends=(python python-requests python-urllib3 python-websocket-client python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d7c029295da0f80aa1556e865235cfd6363a15e462cc726dbc868cb909c71e78c896ec5e9b787bbe1557508d1fd2c4273c89682d4bc2fdb0166fdf64308ce0a4')

build() {
	cd jellyfin-apiclient-python-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd jellyfin-apiclient-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
