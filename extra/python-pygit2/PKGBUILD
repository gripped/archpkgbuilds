# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-pygit2
pkgver=1.18.1
pkgrel=1
pkgdesc='Python bindings for libgit2'
arch=('x86_64')
url="https://github.com/libgit2/pygit2"
license=('LicenseRef-GPL-2.0-only-with-linking-exception')
depends=('glibc' 'libgit2' 'python' 'python-cffi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('90cb79402ab403b71c3773f7d02663919fdde4d0c01f202c67f2335e29dca3df')

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
	depends+=(
		'libgit2.so'
	)

	cd "pygit2-$pkgver"
	LANG=en_US.UTF8 python -m installer -d "${pkgdir}" dist/*.whl
	install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
