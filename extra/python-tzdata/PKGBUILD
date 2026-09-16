# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2026.4
pkgrel=1
pkgdesc='Provider of IANA time zone data'
arch=(any)
url=https://github.com/python/tzdata
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-subtests
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('916eb8dd6dd1508fcf261ebd11c1ad62a0b6f02b312f297c8fe80acfbe7776dbb50198ab9f67db9a88f1b0653e197241e43119012bbb2276f4ae489115e76660')
b2sums=('4b3aef451cbded93e1399dba0f58ea70b5e8dc0049d0be81c7e7a6ce48ef2901235fee53faa0209f7d5c04658de2d991127bbc2d576a3bf1eb2a92ef3a3476a7')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
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

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s /etc/localtime "$pkgdir/$site_packages/$_name/zoneinfo/localtime"
}
