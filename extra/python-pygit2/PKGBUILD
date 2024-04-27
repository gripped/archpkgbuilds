# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-pygit2
pkgver=1.14.1
pkgrel=3
pkgdesc='Python bindings for libgit2'
arch=('x86_64')
url="https://github.com/libgit2/pygit2"
license=('GPL2')
depends=('libgit2.so' 'python-cffi' 'python-six' 'python-cached-property')
makedepends=('cython' 'python-build' 'python-cffi' 'python-installer' 'python-setuptools' 'git' 'python-six' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2e60ee9ae0ccbf8f61d5ff29e59c8ac69a07b9be4ae44c5545f2cc35fe070b41')

prepare() {
	cd "pygit2-$pkgver"
	# Disable tests that do stuff online
	sed -e '/has_network/s/True/False/' -i test/utils.py
}

build() {
	cd "pygit2-$pkgver"
	python -m build -wn
}

check() {
	cd "pygit2-$pkgver"
	local _pyver=cpython-$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver" pytest
}

package() {
	cd "pygit2-$pkgver"
	LANG=en_US.UTF8 python -m installer -d "${pkgdir}" dist/*.whl
}
