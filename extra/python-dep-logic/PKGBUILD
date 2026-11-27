# Maintainer: David Runge <dvzrv@archlinux.org>

_name=dep-logic
pkgname=python-dep-logic
pkgver=0.8.0
pkgrel=1
pkgdesc="Python dependency specifications supporting logical operations"
arch=(any)
url="https://github.com/pdm-project/dep-logic"
license=(Apache-2.0)
depends=(
  python
  python-packaging
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('79cb3ec77ee25ab265ed793e62cb8b2b27238d29d5c35d26b66a49e71d0cdd9c5e297c7806270919c77aa08226ac69404ecd977b3f5505c8d54af9bfc2fd9fff')
b2sums=('2850727049c9b993b0614de3e88eaccf951051ca70e7833efded9890ee26f62d85d1bb5df8478f410b9c48334712c17902c03351324a04fa0e0eddc6ef425428')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
