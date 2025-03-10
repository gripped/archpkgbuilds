# Maintainer: David Runge <dvzrv@archlinux.org>

_name=dep-logic
pkgname=python-dep-logic
pkgver=0.4.11
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
sha512sums=('9bc6ba54d50f244fe4c5b1ec22229dbc05cd7e234b07d3ca79dbefbdb8e2f0dfd535401873db2c84aa08d9240ecf37ce4775bd8b64de4155afb5fb8d5b7d65c0')
b2sums=('0b8528421712e3b485ce78e5739c5b8c5e1bfbb65ad63b2e4c981d2252ab8547b391ec9d0bf65e44d3b5cdf70506d77efe49b79e7cec140c47a387e30917a47b')

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
