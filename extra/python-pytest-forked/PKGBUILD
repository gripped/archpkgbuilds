# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-forked
pkgver=1.7.2
pkgrel=1
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer')
source=("git+https://github.com/pytest-dev/pytest-forked.git#tag=v$pkgver")
sha512sums=('6a471e6ce8c25d2434363e67e911776030d7f92cd42002e2b00c6ff717672b229d710bbd5dc0669dcf849165d6617bb0774161f2bb3c8037ca7cd0bcc5e6f33d')

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
