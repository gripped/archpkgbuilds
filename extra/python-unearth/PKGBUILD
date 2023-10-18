# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.11.2
pkgrel=1
pkgdesc="A utility to fetch and download python packages"
arch=(any)
url="https://github.com/frostming/unearth"
license=(MIT)
depends=(
  python
  python-packaging
  python-requests
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-flask
  python-pytest
  python-pytest-httpserver
  python-requests-wsgi-adapter
  python-trustme
)
optdepends=('python-keyring: use keyring for authentication')
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('27416223ba418286ae506a7ab1c53905e05766a3352f8e69363019eb44687232dd5419cda2970f0347e1613b4b7bc56dc3477761028736727ebdb38a768560f7')
b2sums=('0ac43aaf22a2a7e4425da7f8666685be76bed50d203e3da6ddc6738f29170fbc584054057fc6caef64f85d7a0344f4c5a14c38847e908fbedf944dbb9632de56')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
