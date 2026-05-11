# Maintainer: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-jellyfin-apiclient
pkgver=1.12.0
pkgrel=1
pkgdesc='Python API client for Jellyfin'
arch=(any)
url=https://github.com/iwalton3/jellyfin-apiclient-python
license=(GPL-3.0-only)
depends=(python python-requests python-urllib3 python-websocket-client python-certifi)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('08a6a47887e6d1e2b014158cc6a9dd70c380747befda053994140145f5b5db6a608e76c699570b4ab58d7f5e54a52f92a36ebb8920ad3bbe0526f6984532ee35')

build() {
	cd jellyfin-apiclient-python-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd jellyfin-apiclient-python-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
