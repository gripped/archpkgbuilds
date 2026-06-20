# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_pyname=pypdf
pkgname=python-$_pyname
pkgver=6.13.3
pkgrel=1
pkgdesc='Python library for manipulating pages of PDF files'
arch=(any)
url="https://github.com/py-pdf/$_pyname"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-flit-core)
optdepends=(python-cryptography
            python-pillow)
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('12b62c43cb4d3abc248a11d9bf433479e305831d3e26c7e8e3462e48d697158e')

prepare() {
	cd "$_archive"
	# Unpun upper bound on flit
	sed -i -e '/flit_core/s/,<4//' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package(){
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
