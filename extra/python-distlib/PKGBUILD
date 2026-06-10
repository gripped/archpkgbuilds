# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-distlib
pkgver=0.4.2
pkgrel=1
pkgdesc='Low-level functions that relate to packaging and distribution of Python software'
arch=(any)
url='https://distlib.readthedocs.io'
license=(PSF-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-tests)
source=("$pkgname::git+https://github.com/pypa/distlib.git#tag=$pkgver")
sha512sums=('a0e65d959094a71f14b2ef3976462f9e490cc8cde8dd8d8655671e1a1de301febd548ea73f9685b3a70c5d8dc636289f8d1fa2e9be34a2730a969c2346f30885')
b2sums=('4b317f8b98b60f6242db358af77e496b1b6e0cfe6d3792f04dc36b76f4ab0ed259d7d0b7e68969ea5020114e6574e0badabcf36b27948c5182c8735e66b5a751')

prepare() {
  cd "$pkgname"

  # do not bundle executables of unknown provenance
  rm distlib/*.exe
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  # if it's not relevant, why does it exist?
  # https://github.com/pypa/distlib/commit/93baffeaa1773796d802bb761607a6466790dcba
  export SKIP_EXT_PACKAGE_DATA=1

  python tests/test_all.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
