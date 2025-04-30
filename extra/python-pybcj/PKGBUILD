# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loathingkernel <username at gmail dot com>

pkgname=python-pybcj
_pyname=${pkgname#python-}
pkgver=1.0.6
pkgrel=1
pkgdesc='BCJ (Branch-Call-Jump) filter for python'
arch=(x86_64)
url="https://codeberg.org/miurahr/$_pyname"
license=(LGPL)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(python-pytest
              python-hypothesis)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('70bbe2dc185993351955bfe8f61395038f96f5de92bb3a436acb01505781f8f2')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_pyver"
	python -m pytest -rsx
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
