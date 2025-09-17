# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-sugar
pkgver=1.1.0
pkgrel=1
pkgdesc='A plugin for py.test that changes the default look and feel of py.test'
arch=('any')
license=('BSD-3-Clause')
url='https://github.com/Teemu/pytest-sugar'
depends=('python' 'python-pytest' 'python-termcolor')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/Teemu/pytest-sugar.git#tag=v$pkgver")
sha512sums=('f502e5a7a82227fa96d001131b4d9869c63aed0cd4dd8a236c22ffebce421339f3d7f571a93bf0c87c3636ab86a83a0df247152ebbc96d2627a826e15d4e7f48')

build() {
  cd pytest-sugar
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-sugar
  pytest -v
}

package() {
  cd pytest-sugar
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
