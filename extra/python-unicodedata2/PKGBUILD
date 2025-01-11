# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=python-unicodedata2
_pyname=${pkgname#python-}
pkgver=16.0.0
pkgrel=1
pkgdesc="unicodedata backport/updates to Python 3"
arch=('x86_64')
url="https://github.com/fonttools/$_pyname"
license=('Apache')
depends=('python')
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest
              python-pytest-xdist
              python-pytest-randomly)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('34aeb8a21bd6fdf4060b3458a17488eddeec8964662a8090f5b9ae708e7d6a7d')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
