# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-autobuild
pkgname=python-$_pkgname
pkgver=2024.02.04 
pkgrel=2
pkgdesc='Rebuild Sphinx documentation on changes, with live-reload in the browser'
arch=('any')
url='https://github.com/executablebooks/sphinx-autobuild'
license=('BSD')
depends=('python' 'python-sphinx' 'python-livereload')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4f778f82b1c6635856f97ff742cf9595a4251734164f479943bd6282b94d61dc47fb6d48ab9a106c574213452f0edeac1ec87bf52cdf035c114b74fa604b48a2')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  PYTHONPATH="$PWD" pytest
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
