# Maintainer: David Runge <dvzrv@archlinux.org>

_name=rcssmin
pkgname=python-rcssmin
pkgver=1.2.1
pkgrel=1
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
sha512sums=('1fd4f28a0a371b81b0a047de227ab4d7a45803dbc1daa4ae8ba07477d8fbfebe2b313e17f14437ec4e64ab87aa4b3637e99e176974425f829937cc9c49cd228a')
b2sums=('b07f41d60b553fbf1fcdf43c4557feadb4e4eb4a6d7a1c8c1b376ab7e7ae23bea3f9a6836c9a75c0be632449f48d98950d9139beac9a7374e284d41b64813488')

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
