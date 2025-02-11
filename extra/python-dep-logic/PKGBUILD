# Maintainer: David Runge <dvzrv@archlinux.org>

_name=dep-logic
pkgname=python-dep-logic
pkgver=0.4.10
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
sha512sums=('ca21ba217c46b055d77f6e618557f38c227e861ebb77c6f119780e71d34f5518de9745b8ca6a3cd258f14db224389dcab89e24c5c8b9deeff81be14e6f188156')
b2sums=('b994fea4ff7a41f230a29e07739f3fa5c9ca0e745aa0cc00d5bec5ee06bbb9d06d41c7b9ba9e293d8d1f462b1fa15030fa45602eccbdfe3342cd7d1322880848')

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
