# Maintainer: David Runge <dvzrv@archlinux.org>

_name=unearth
pkgname=python-unearth
pkgver=0.17.2
pkgrel=4
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
sha512sums=('21c252898fc14dcdf6c7c18591116edec09c25b9e379999b4914af3f2b1474fd35b113afce5ce8fa16cd82abe192d0d2d2c6c8a84888814a74bb170a4e27dc5a')
b2sums=('b33d1555e83474b42aa463d085dc480f15b2855ba1cb98d8acd62d5ed0cd00a2a3deba056711d0cdc67013e8d67ce8d0c2245435d7b80d14d6c4250c905317c6')

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
