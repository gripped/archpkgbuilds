# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Aleksandr Beliaev <trap000d@gmail.com>

_pkgname=zipstream-ng
pkgname=python-$_pkgname
pkgver=1.9.2
pkgrel=1
pkgdesc='A modern and easy to use streamable zip file generator'
arch=(any)
url="https://github.com/pR0Ps/$_pkgname"
license=(LGPL-3.0-only)
depends=(python)
provides=("python-zipstream=$pkgver")
conflicts=(python-zipstream)
makedepends=(python-{build,installer,wheel}
             python-hatchling)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9a91a4c046f4955f1c4fdb141e7de59bc290e679b75ff04b91fb787f749989f5')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
