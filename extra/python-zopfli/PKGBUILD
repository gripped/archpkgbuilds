# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-zopfli
_name="${pkgname/thon/}"
pkgver=0.4.2
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
sha512sums=('ed409c13b7c9aa5f0daf5ce3eb87d8ffdf5399dcf4c1d341d6f2b5a7f3927b6cfa41055b59f89251c03fb9e3d990ec69f80fa59d11b617433c792e0478bfa530')
b2sums=('3c6b514464d019563048923e78fb1f42a5b5133f014296288b9b4e01f103645e8d29ea0acc51d09ee42ed34f980f5273370e6c0f6242c4f0b56afe3ae8c0e885')

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
