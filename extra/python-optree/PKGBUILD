# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.13.1
pkgrel=2
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11 python-cmake-build-extension)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0eb36f75a865528714edfe1b77dfbd7bc3fe118f2994dd16baa86208e3c524aaa4e11880749adab3004b37fac1806484a4a23614890e0fc1394259ead0e1df6e')
b2sums=('a79c8135aefa039d2875399b5b3ccf1bdd836042adae87dbb261fd656bc2f02b115b02cec5aee3b568ffe363581ea7125d18ee3b3d4233282ec216e50a072b80')

prepare() {
	cd "$_name-$pkgver"
	sed -i 's/"cmake >= 3.18",//' pyproject.toml
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
