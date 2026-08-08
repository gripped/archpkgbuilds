# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-forked
pkgver=1.7.1
pkgrel=1
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer')
source=("git+https://github.com/pytest-dev/pytest-forked.git#tag=v$pkgver")
sha512sums=('e20bd1c6864715558080804f10e939d3a202722b6c8f9894a59d2531c2097f0f7cf09b496cced5373ba2a0e9f055efdb3301fc8157019a7b83227cb56697bfe7')

build() {
  cd pytest-forked
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-forked
  PYTHONPATH="$PWD"/src pytest -v
}

package() {
  cd pytest-forked
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
