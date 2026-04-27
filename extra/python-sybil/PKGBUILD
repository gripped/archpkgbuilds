# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sybil
pkgver=10.0.0
pkgrel=1
pkgdesc='Automated testing for the examples in your documentation.'
arch=('any')
license=('MIT')
url='https://github.com/simplistix/sybil'
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-pytest' 'python-seedir' 'python-testfixtures' 'python-yaml')
source=("git+https://github.com/simplistix/sybil.git#tag=$pkgver")
sha512sums=('ed9c0fd6508a61c0aa073f17ccb65a0d1cf267af07d5481c7a80d56d953c04ca2463d248b2ba8d26d17320ceb04ae985f2ebddd690e8737dcdbbf3dbc028ca5e')

build() {
  cd sybil
  python -m build --wheel --no-isolation
}

check() {
  cd sybil
  PYTHONPATH=src python -m pytest
}

package() {
  cd sybil
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
