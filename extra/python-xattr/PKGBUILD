# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xattr
pkgver=1.3.1
pkgrel=1
pkgdesc='Python wrapper for extended filesystem attributes'
arch=('x86_64')
license=('MIT')
url='https://github.com/xattr/xattr'
depends=('python-cffi')
makedepends=('git' 'python-build' 'python-cffi' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/xattr/xattr.git#tag=v$pkgver")
sha512sums=('fd0ffe8809cc6ce41046b8f554aa1e8077243e4cb073f59fc697ef82ca9f04c9222de2a9483885a5e490043d21942a3b5c3021e6ba5d4ca4e8d2a8124f231799')

build() {
  cd xattr
  python -m build --wheel --no-isolation
}

check() {
  # Build env doesn't have permission for those xattrs
  cd xattr
  python -m venv --system-site-packages "$srcdir/pyvenv"
  "$srcdir/pyvenv/bin/python" -m installer dist/*.whl
  mkdir -p "$srcdir/testdir"
  cd "$srcdir/testdir"
  "$srcdir/pyvenv/bin/python" -m pytest "$srcdir/xattr/tests"
}

package() {
  cd xattr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
