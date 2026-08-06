# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-forked
pkgver=1.7.0
pkgrel=1
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer')
source=("git+https://github.com/pytest-dev/pytest-forked.git#tag=v$pkgver")
sha512sums=('fca81c098aca2a8dcd59c482b2f5981b694dd24fe26acdd1663e2d6906f95ecf80735f71f62ba0d1455325673d066a5dc7996dc734f3dc61c962ca1968a2aab0')

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
