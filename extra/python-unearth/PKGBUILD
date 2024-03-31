# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.15.1
pkgrel=1
pkgdesc="A utility to fetch and download python packages"
arch=(any)
url="https://github.com/frostming/unearth"
license=(MIT)
depends=(
  python
  python-packaging
  python-httpx
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
  python-pytest-mock
  python-pytest-httpserver
  python-requests-wsgi-adapter
  python-trustme
)
optdepends=(
  'python-keyring: use keyring for authentication'
  'python-requests: use legacy facilities for download'
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('d4c4bd15c29ab7a172ded4db04dbc56187b5f3d5cf9c47433958240b5c475ee6708c16f7c606ae9998e0fe10e6570e02a57238d38a7cd83e6fc8e24b1aaa8180')
b2sums=('342fed4c89c157562b77078ca1e6ab0adf1785185ce5ba81c8e619724e8a2f36642c1f87a09b9b0967aca22ac3cd86708d141a7e9601c27f3ec7d912cc62f9aa')

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
