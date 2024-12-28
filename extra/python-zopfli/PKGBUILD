# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-zopfli
_name="${pkgname/thon/}"
pkgver=0.2.3.post1
pkgrel=2
pkgdesc="Python bindings to zopfli"
arch=(x86_64)
url="https://github.com/fonttools/py-zopfli"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
  zopfli
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('dfea6d501bc2204e606f98485c1512838685d9b92dcc93d2f53114a8afa682728f10205b3bea16bd12ecf8f2f95893fd3f0372f49ba1855b016909b5799dfe04')
b2sums=('b39e392e3b0edfed97fcbf90bc81c119c1080cb01a6a3abb5d56fa7e4167197f2a5bbcaed89a044c65112ddb9bda6497f2a168b284095cbb787921705c618e75')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver USE_SYSTEM_ZOPFLI=true python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  depends+=(
    zopfli libzopfli.so libzopflipng.so
  )

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
