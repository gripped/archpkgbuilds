# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-rcssmin
_name="${pkgname#python-}"
pkgver=1.2.2
pkgrel=2
pkgdesc="Fast CSS minifier for Python"
arch=(x86_64)
url="https://github.com/ndparker/rcssmin"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('ff76b866cc0a8e2cbbb03f2bc78177ff20d80e27cf5848b89fb5d927d6222525ac11bf000c0a8795da014e8b7a2d94aa41aa1b04fa0148d9c886eaaa2bcfe9a3')
b2sums=('5f45db463dc29b008a196b4c3f8d59910fbd90d5da52f5aa4d055a4540e484a37aede62e25b430be36db9c34ebce9c004fe0af8a5fd3d0fb22b8229458bb5c9d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
