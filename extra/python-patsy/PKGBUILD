# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
# Contributor: Nick Ward <ward.nickjames@gmail.com>
# Contributor: Rich Lindsley <rich at dranek dot com>

pkgname='python-patsy'
pkgver=1.0.2
pkgrel=2
pkgdesc="A Python package for describing statistical models using symbolic formulas"
arch=('any')
url="https://github.com/pydata/patsy"
license=('BSD')
depends=('python-numpy')
makedepends=('python-build' 'python-installer' 'python-setuptools')
optdepends=('python-scipy: needed for spline-related functions')
source=("https://github.com/pydata/patsy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f5982e48dec57de958188730fafba84fd4f87e0ebf532d82d72f2fec74f21187')

build() {
  cd patsy-${pkgver}
  python -m build --wheel --no-isolation
  python setup.py build
}

package() {
  cd patsy-${pkgver}

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
