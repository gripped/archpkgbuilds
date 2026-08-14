# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-forked
pkgver=1.7.4
pkgrel=1
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer')
source=("git+https://github.com/pytest-dev/pytest-forked.git#tag=v$pkgver")
sha512sums=('ebc0c433cae30e418e73e5eb96fa03e38cd7c79ea54b4959500aacd1b46c2210490df140224a5b5979e0ef12d53cf9806138b52d53b544e2a2e6faeb7121315f')

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
