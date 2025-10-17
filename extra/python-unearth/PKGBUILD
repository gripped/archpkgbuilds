# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.18.1
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
sha512sums=('3a81c8f2f4bd192f0e4c8800944be0645bf173cfc0aebe48690b3b6319b3d95aaece8a3adba01c4cfbb9a2c9729d316b2f70cb2b527ee91046b111dd19d7fed8')
b2sums=('056403f9c9e2d19010497e92ba2ea61cbe60d856c3a893c64a2efa3c2aae9d8a47501019d075edfa3253af1b263a22c63a47f47dca51b16420a9e83a66e31833')

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
