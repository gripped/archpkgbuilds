# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.8.0
pkgrel=4
pkgdesc='A modern and easy to use streamable zip file generator'
arch=(any)
url="https://github.com/pR0Ps/$_pkgname"
license=(LGPL-3.0-only)
depends=(python)
provides=("python-zipstream=$pkgver")
conflicts=(python-zipstream)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7d18e9c4f6daf7c5d4c9981972fcccc4de4e1bd34ab5f782ec649b805beaee10')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
