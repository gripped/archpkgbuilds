# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-zopfli
_name="${pkgname/thon/}"
pkgver=0.4.1
pkgrel=1
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
sha512sums=('aa516df4a8b572d1e2c9f64319048e6e80bb3db9a1388e81183af755e44c94e3ac97c47839154645105d3e1bb4a964505f7dddc636680cfc2cc689b48c61ef09')
b2sums=('25f3d27727b8dcb042b7657707b5fc60002f78c87320c6592d7408bedfa33238d4289a39482edb7069a558a36dea73fda0903bbc8bf3cfda2918157751b50a5c')

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
