# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-frozendict
pkgver=2.4.6
pkgrel=3
epoch=1
pkgdesc='An immutable dictionary'
url='https://pypi.python.org/pypi/frozendict/'
arch=('any')
license=('LGPL-3.0-only')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.org/packages/source/f/frozendict/frozendict-$pkgver.tar.gz")
sha512sums=('3e6d1b530bbad65ea6a38645a3222d722e06e27eb65d19f903f4f434c7aa48d7522040ebc19035f73b4545761ce84a72b5d812c839ec199a5446f8c4d94354b4')
b2sums=('fafd946ccb11b0d2a8428adba2da35ba625117be351e1fc3412e904355c85f2ff320633be726d33e9246f8e194bb7656c67e08de8dd0493a80f4333ea5b1a2d2')

build() {
	cd frozendict-$pkgver
	python -m build --wheel --no-isolation
}

check(){
	cd frozendict-$pkgver
	local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest
}

package() {
	cd frozendict-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
