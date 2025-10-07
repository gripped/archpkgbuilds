# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-pyzstd
_pyname=${pkgname#python-}
pkgver=0.18.0
pkgrel=1
pkgdesc='Python bindings to Zstandard (zstd) compression library'
arch=(x86_64)
url="https://pypi.org/project/$_pyname"
license=(BSD-3-Clause)
depends=(python
         zstd)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('81b6851ab1ca2e5f2c709e896a1362e3065a64f271f43db77fb7d5e4a78e9861')

prepare() {
	cd "$_archive"
	# HACK: workaround upstream setuptools version check specifically for Windows.
	sed -i 's/setuptools>=64,<74/setuptools/' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn -C=--build-option=--dynamic-link-zstd
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	python -m unittest discover tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
