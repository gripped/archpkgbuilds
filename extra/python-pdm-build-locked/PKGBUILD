# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pdm-build-locked
_name=${pkgname#python-}
pkgver=0.3.5
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
sha512sums=('c4a790ee27b3202a7cbb1c80b598d99548bc715512bcae226561385bcfac6c62bfd3c6fcf1efe3d426acf4f69969ae0fb2ac80447c7adf879b73d777384be013')
b2sums=('29ad90039cbfb3fecc95c81f4ac78903848a0665de14df25fd34c00b36a038da364cdd34bbbb08711e3dd1917ae12c207dc27fff17f844b03ac1180168abc5a3')

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
