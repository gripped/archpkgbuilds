# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xattr
pkgver=1.0.0
pkgrel=1
pkgdesc='Python wrapper for extended filesystem attributes'
arch=('x86_64')
license=('MIT')
url='https://github.com/xattr/xattr'
depends=('python-cffi')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/xattr/xattr.git#tag=v$pkgver")
sha512sums=('f24cd8ee3da665ede8481afab5f1f438e897984047157156b03822f0c886a1dcc81c515667fb0af3b2191c72e020e7a9bb0070ec3914b744afb979fddca7eb5c')

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
