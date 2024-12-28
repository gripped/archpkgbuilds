# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: David Verelst <david dot verelst at gmail com>
# Contributor: richli

pkgname=python-shapely
pkgver=2.0.6
pkgrel=2
pkgdesc="Manipulation and analysis of geometric objects in the Cartesian plane"
arch=(x86_64)
url="https://pypi.python.org/pypi/Shapely"
license=(BSD)
depends=(geos python)
optdepends=('python-numpy: for shapely.vectorized submodule')
makedepends=(python-build python-installer python-setuptools python-wheel python-numpy cython)
checkdepends=(python-pytest)
source=("https://pypi.io/packages/source/s/shapely/shapely-${pkgver}.tar.gz")
sha512sums=('f1a9e0a5156dc37ad894eb41fea9a1426e1fcc8cd40b2d3af94dbbe2f65c49f134fc1ad3d4a8b7bdad6a4d04af4c2a24443d37c6ed114c70ef67149ed9067e19')

build() {
  cd shapely-$pkgver
  CFLAGS+=" -Wno-incompatible-pointer-types" \
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd shapely-$pkgver/build/lib.linux-x86_64-cpython-${python_version}
  PYTHONPATH="$PWD" pytest -vv --color=yes
}

package() {
  cd shapely-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
