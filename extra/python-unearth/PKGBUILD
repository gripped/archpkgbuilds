# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.17.1
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
sha512sums=('b472702a0cc9d4ad6c0f82dadd63e7cb1a127a71225eae29846f61883fa9ab8d70594edf9217359f52c380cb20662b9911a5c8fa28fc04bd8ae6ae68c9f337f6')
b2sums=('e4430825989075e67166e115e821814498e9e88f4e05be2a595ed3a43c9ec9dd4eeb1d1acc9de62a8fca51bd42dcc321f8a6929e5d00d768c602f09f2c80af63')

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
