# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=lupa
pkgname=python-lupa
pkgver=2.3
pkgrel=1
pkgdesc='Python wrapper around Lua and LuaJIT'
arch=(x86_64)
url="https://github.com/scoder/$_pkgname"
license=(MIT)
depends=(gcc-libs # libgcc_s.so
         glibc # libc.so
         python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools)
_archive="$_pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_archive.tar.gz")
sha256sums=('e72c098a8e054fe2964de515688e60c61964c87c00d53e1cf49fcada13922860')

build() {
	cd "$_archive"
	python -m build -wn
	# https://gitlab.archlinux.org/archlinux/packaging/packages/python-lupa/-/issues/1
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	cp -r lupa/tests "build/lib.linux-$CARCH-cpython-$_pyver/lupa"
}

check() {
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/$_archive/build/lib.linux-$CARCH-cpython-$_pyver"
	python -m unittest discover "$_archive/$_pkgname/tests"
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
