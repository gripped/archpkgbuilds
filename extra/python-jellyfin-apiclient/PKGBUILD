# Maintainer: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.18.0
pkgrel=1
pkgdesc='Python API client for Jellyfin'
arch=(any)
url=https://github.com/iwalton3/jellyfin-apiclient-python
license=(GPL-3.0-only)
depends=(python python-requests python-urllib3 python-websocket-client python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('16c1e6f061d17c7b81c39868e297cde5542a4e8eead3b24441c6976f1b376e55b865b95c01b45b78ae24d39d47b213971a9d7e9ea60597512559e41480980fbe')

build() {
	cd jellyfin-apiclient-python-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd jellyfin-apiclient-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
