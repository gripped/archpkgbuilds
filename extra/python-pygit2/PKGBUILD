# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-pygit2
pkgver=1.21.0
pkgrel=1
pkgdesc='Python bindings for libgit2'
arch=('x86_64')
url="https://github.com/libgit2/pygit2"
license=('LicenseRef-GPL-2.0-only-with-linking-exception')
depends=('glibc' 'libgit2' 'python' 'python-cffi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$url"/commit/1c788f345ef4e525d6a6a1a7d0d4da7dbbe8ec6f.patch)
sha256sums=('d2e82fc3dfd50ade667728bac34618e70e7d66b49d573b32a67f50a15f05b44f'
            '0678e49b37e891e2511fd35ed5622b62c554df09d51cfc6d81345c864bbe0f83')

prepare() {
	cd "pygit2-$pkgver"

	# Disable tests that do stuff online
	sed -e '/has_network/s/True/False/' -i test/utils.py

	# Fix build with setuptools 84.2.1
	patch -p1 -i ../1c788f345ef4e525d6a6a1a7d0d4da7dbbe8ec6f.patch
}

build() {
	cd "pygit2-$pkgver"
	python -m build -wn
}

check() {
	cd "pygit2-$pkgver"
	local _pyver=cpython-$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	PYTHONSAFEPATH=1 PYTHONPATH="$PWD/build/lib.linux-$CARCH-$_pyver" pytest
}

package() {
	depends+=(
		'libgit2.so'
	)

	cd "pygit2-$pkgver"
	LANG=en_US.UTF8 python -m installer -d "${pkgdir}" dist/*.whl
	install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
