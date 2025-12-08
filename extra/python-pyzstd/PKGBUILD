# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyzstd
_pyname=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc='Python bindings to Zstandard (zstd) compression library'
arch=(x86_64)
url="https://pypi.org/project/$_pyname"
license=(BSD-3-Clause)
depends=(python
         python-backports-zstd)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('44e7b9be7b445aac742003ddee52ca31385d52dffb8c60adf633fad8e795f10d')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
