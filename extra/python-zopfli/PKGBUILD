# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-zopfli
_name="${pkgname/thon/}"
pkgver=0.4.0
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
sha512sums=('7684116203abde52293ef174ebb61b1326f3030ee1044f8a71f2ac4f0659e305274678987609e5e03eab2ac9860f39f319e7f188b36bd27bd92dce7affdcd4cd')
b2sums=('2e26ddf74723d4ab05343ba0e5c4074c1286f17d42c46ca36c8917089d26c1f6e28c0f2eb5c2fa2c9af2ec1cbe12980360285acf16dde6e1dcb91e7917e3d6eb')

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
