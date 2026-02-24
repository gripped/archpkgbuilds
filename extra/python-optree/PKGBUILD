# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=optree
pkgname=python-"${_name}"
pkgver=0.19.0
pkgrel=1
pkgdesc="Optimized PyTree Utilities"
arch=(any)
url="https://github.com/metaopt/optree"
license=(Apache-2.0)
depends=(python python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel cmake gcc pybind11 python-cmake-build-extension)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('7e7a411b5bb6d1063992d6c69743c3c9344fb17d9279afe5a159015afa14d58f1994fe9d9c44cc584566faadc42b4c20bbac49e194c10aca9ca1f4e37e9e8292')
b2sums=('ffc6d8cad41b0794e7c208d2f204670f414250e2e9a87677318684c3643d4bb803ee570b53f655c936425eea74588af898a7044df5e580ffbf5abcc03b659b20')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
