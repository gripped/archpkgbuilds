# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

_name=tzdata
pkgname=python-tzdata
pkgver=2026.2
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
sha512sums=('0de81bf34e1a638d7c814634867c2696e0555de39ef05bb1fbb6b567d162a9a3a522b40cbd211de92c7b99beeafd4652801e923fe362caa4c0d32fa8621b8467')
b2sums=('a4338a3384bb17904f34a9fa5f2767cba53c42aaef9a5ef61abf3024d657f96dcbe2f4fc4bd5f6ff1e7ecbf99f349dd3bb53a8e1cc18baf5af6577621af523cc')

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
