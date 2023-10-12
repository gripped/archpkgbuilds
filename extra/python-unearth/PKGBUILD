# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.11.1
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
sha256sums=('8ef2a7e809588ab4e7511fb6f24c7349380459d9dfa6dd4315455756ba8481ed')
b2sums=('a1f322438c45186ef00e72b7d08119d274e1231ce029465b3339daf26ad3ebae9e11b741590fc5e762a1f155df01cf6d47bcd940c5271e91c4672de3da1cb918')

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
