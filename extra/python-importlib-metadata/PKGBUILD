# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-importlib-metadata
pkgver=10.0.0
pkgrel=1
pkgdesc="Read metadata from Python packages"
url="https://importlib-metadata.readthedocs.io"
license=(Apache-2.0)
arch=(any)
depends=(
  python
  python-zipp
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-jaraco.test
  python-pytest
  python-pyfakefs
  python-pip
  python-tests
)
source=(
  "$pkgname::git+https://github.com/python/importlib_metadata.git#tag=v$pkgver?signed"
  remove-useless-dep.patch
)
sha512sums=('a3307b44931b61a1f14f54ed4099d5c8d77d7286fec66d024b97ca58ff948ca1477cc232c0a1c1d956f85977fd00d4e99b355354c7332fbc8bb3273efd1df4e4'
            'e5165e1b212f10d56724dc552e2cd75411bbe8c3b0d6b2d930f73e85e22596fade1cd3e84f8c93b4cd73bbf5cce8d3cf22ed489e4fdfe46c73a65d97f76e57b8')
validpgpkeys=('CE380CF3044959B8F377DA03708E6CB181B4C47E') # Jason R. Coombs <jaraco@jaraco.com>

prepare() {
  cd "$pkgname"

  # what is the point of this crud?
  patch -p1 -i "$srcdir/remove-useless-dep.patch"
}

build() {
  cd "$pkgname"

  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m pytest --ignore exercises.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
