# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: JakobDev<jakobdev at gmx dot de>

pkgname=python-sphinx-reredirects
_pkgname=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc='Handles redirects for moved pages in Sphinx documentation projects'
arch=(any)
url="https://github.com/documatt/$_pkgname"
license=("BSD")
depends=(python
         python-sphinx)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
checkdepends=(python-defusedxml
              python-pytest)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f6e1187e95fe058b863119a22172eb803b2cd490de2e126e35e3b6438e021c58')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
