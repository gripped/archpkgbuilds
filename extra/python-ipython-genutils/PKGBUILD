# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=python-ipython-genutils
_name=ipython_genutils
pkgver=0.2.0
pkgrel=5
pkgdesc='Vestigial utilities from IPython'
arch=(any)
url='http://ipython.org/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-nose)
source=(git+https://github.com/ipython/ipython_genutils#tag=$pkgver)
sha256sums=('30652fe4cffe207eb85a25b45ad2ea6ce536be8e1d29d67fef2cb02af097a61b')

prepare() {
  cd $_name
  git cherry-pick -n 27279feaed2cd253b50683db9239d829de48f64a # Fix tests with python 3.11
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  nosetests
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
