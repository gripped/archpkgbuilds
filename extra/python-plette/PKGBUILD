# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-plette
pkgver=2.2.0
pkgrel=1
pkgdesc="Structured Pipfile and Pipfile.lock models"
url="https://github.com/sarugaku/plette"
license=('ISC')
arch=('any')
depends=('python-tomlkit')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-cerberus')
source=("git+https://github.com/sarugaku/plette.git#tag=v$pkgver")
sha512sums=('b0d3763941757b7dcc7bfdc56051da0c16596834ef3ddb10c796352c128a47706f6daeb02699c3999518a394b4e0b0588bfacbb9d20e1e95eaef7c0cf3e53a9d')

build() {
  cd plette
  python -m build -nw
}

check() {
  cd plette
  python -m venv .venv --system-site-packages
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest
}

package() {
  cd plette
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
