# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=iterable-io
pkgname=python-$_pyname
pkgver=1.0.1
pkgrel=2
pkgdesc='Adapt generators and other iterables to a file-like interface'
arch=(any)
url='https://github.com/pR0Ps/iterable-io'
license=(LGPL-3.0-only)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="${_pyname/-/_}-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('55db222c5914097a8508dc722f8db6112f636a04a8acb94ee6589d9b14bd4bb7')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD"
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
