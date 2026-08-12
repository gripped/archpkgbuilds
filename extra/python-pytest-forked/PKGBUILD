# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-forked
pkgver=1.7.3
pkgrel=1
pkgdesc='run tests in isolated forked subprocesses'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-forked'
depends=('python-pytest')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer')
source=("git+https://github.com/pytest-dev/pytest-forked.git#tag=v$pkgver")
sha512sums=('01d269ff71f761ae121071439665487a3ee222ea559333f88a78566897ff7c52b4cd9964aba56e43e54a5822c62c2ad5702d9e538e84d6fc31ca87e1be03dd8c')

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
