# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.19.1
pkgrel=1
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11 python-cmake-build-extension)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('60f8b9b053fe0692b44ec7ca0661cc32f9998c1da1ec4dc9d6345907f65a63d0902f08bb70f1266dd567ba049c29f2fe62719939adb49ad5d18f4792cdb2e2d0')
b2sums=('648eaa29ac0b0890748da452527b6ab5b9bfcf953facf575577a5e97c30bca45a4d689179b944398f101295cf98026655c4b39b44cdb66b324a09f43fa60e2fe')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
