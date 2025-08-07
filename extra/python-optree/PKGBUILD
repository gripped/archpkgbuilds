# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.17.0
pkgrel=1
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11 python-cmake-build-extension)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('796ba67f636711af91cf11840e60b5b388aaa2fa517e8c5c34b40597a72b66185e3f34cee4996eed176d7bd8496108adce08446ada5981a0525fc9c294b8cd33')
b2sums=('b5f0d8a32c8338e54730bdb3769932c0a62c4242789110886011caab1d40e247aa30764eafd898a2408d849496eba442d89645a3e210bb4ac7c99dd2a8924a99')

prepare() {
	cd "$_name-$pkgver"
	# Remove cmake version check, which is broken due to our current version string
	# "4.3.0-dirty" not being accepted. Our cmake version is compatible.
	sed -i '148,152d' setup.py
}

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
