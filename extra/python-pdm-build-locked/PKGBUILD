# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pdm-build-locked
_name=${pkgname#python-}
pkgver=0.3.7
pkgrel=1
pkgdesc="A pdm plugin to publish locked dependencies as optional-dependencies"
arch=(any)
url="https://github.com/pdm-project/pdm-build-locked"
license=(MIT)
depends=(
  python
  python-pdm
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
checkdepends=(
  python-hatchling
  python-pkginfo
  python-pytest
  python-pytest-mock
)
optdepends=(
  'python-hatchling: for python-hatch integration'
  'python-pdm-backend: for python-pdm-backend hook'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b71b7a77fcffcefb75489749f718d7b2d215b6b8463759f0c5c226dfb924dc756e06ffcf2ccf49a0b8dfd8ad50db8deac8bb5592d1297aa7e4b2c0ee17876697')
b2sums=('877a2f2652d111ee38ae5f2d13734c0262a292b052c84aa57024ef13a0109de5f52b4f55d55290b3f3e819f8bc4545e3a645449c1dc2a683b5392d0002eaeac1')

build() {
  cd $_name-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=""  # we are not interested in coverage tests
    # some issue with dependency count (not really relevant for functionality)
    --deselect 'tests/unit/test_build_command.py::test_build_locked_pyproject[large]'
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
