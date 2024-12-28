# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-pygit2
pkgver=1.16.0
pkgrel=3
pkgdesc='Python bindings for libgit2'
arch=('x86_64')
url="https://github.com/libgit2/pygit2"
license=('LicenseRef-GPL-2.0-only-with-linking-exception')
depends=('glibc' 'libgit2' 'python' 'python-cffi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "fix-libgit2-compatibility.patch::$url/commit/eba710e45bb40e18641c6531394bb46631e7f295.patch"
)
sha256sums=('72584d3bc24eb783229e5475eed41078815e90b03254451f3918bc80bba10513'
            'e6d6c2cde580c163159bba8263c0fba4bc18af79781a6834e297cc2da242cbe9')

prepare() {
	cd "pygit2-$pkgver"
  patch -Np1 -i ../fix-libgit2-compatibility.patch
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
