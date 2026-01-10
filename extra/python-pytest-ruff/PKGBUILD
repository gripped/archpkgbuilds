# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ruff
pkgver=0.4.1
pkgrel=3
pkgdesc="Pytest plugin to check ruff requirements"
url="https://github.com/businho/pytest-ruff"
license=('MIT')
arch=('any')
depends=('python' 'python-pytest' 'python-ruff')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core'
             'python-poetry-dynamic-versioning')
checkdepends=('python-pytest-mock')
source=("git+https://github.com/businho/pytest-ruff.git#tag=v$pkgver")
sha512sums=('0e98174c7a1680330258adb42650d74cb2549685f88471178b2d98088f09e5f462cd2e3e09c4749f6e7916d828668cf4201ccf87a62875d81c5a3f516969da58')

build() {
  cd pytest-ruff
  python -m build -nw
}

check() {
  cd pytest-ruff
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/tmp_install/usr/lib/python${python_version}/site-packages" \
    pytest
}

package() {
  cd pytest-ruff
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
