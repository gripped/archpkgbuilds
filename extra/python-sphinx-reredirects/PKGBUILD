# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: JakobDev<jakobdev at gmx dot de>

pkgname=python-sphinx-reredirects
_pkgname=${pkgname#python-}
pkgver=0.1.2
pkgrel=1
pkgdesc='Handles redirects for moved pages in Sphinx documentation projects'
arch=(any)
url="https://gitlab.com/documatt/$_pkgname"
license=("BSD")
depends=(python
         python-sphinx)
makedepends=(python-{build,installer}
             python-setuptools
             python-wheel)
checkdepends=(python-pytest)
_archive="$_pkgname-v$pkgver"
source=("$url/-/archive/v$pkgver/$_archive.tar.bz2")
sha256sums=('b6a3febe4dee4ffc477e6924efe0ffceea5ab88aba3e1f926ef29b04b00469e4')

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
