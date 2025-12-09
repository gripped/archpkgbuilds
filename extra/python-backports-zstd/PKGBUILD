# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=backports_zstd
pkgname=python-${_pyname//_/-}
pkgver=1.2.0
pkgrel=3
pkgdesc="Backport of compression.zstd"
arch=(x86_64 armv7h aarch64 i686)
url="https://github.com/rogdham/${_pyname//_/.}"
license=(PSF-2.0)
depends=(python
         zstd libzstd.so)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('6c3fc19342db750b52fde793e4440a93575761b1493bb4a1d3b26033d2bd3452')

build() {
	cd "$_archive"
	python -m build -wn --config-setting=--build-option=--system-zstd
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
