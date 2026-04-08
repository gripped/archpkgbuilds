# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xattr
pkgver=1.1.2
pkgrel=1
pkgdesc='Python wrapper for extended filesystem attributes'
arch=('x86_64')
license=('MIT')
url='https://github.com/xattr/xattr'
depends=('python-cffi')
makedepends=('git' 'python-build' 'python-cffi' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/xattr/xattr.git#tag=v$pkgver")
sha512sums=('6c605ee5ae728aabb36aecb4e702a7ad3c52c46e013d66846ad9370bde8d7ec60e3828a8b25b77f1bb7ca318df841dbd0b16ce9f9c36801d807e42296dfdf414')

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
