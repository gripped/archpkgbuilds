# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-ruff
pkgver=0.3
_commit=37b8e736063f61ca4b5118ac499ee63fb3943b17
pkgrel=1
pkgdesc="Pytest plugin to check ruff requirements"
url="https://github.com/businho/pytest-ruff"
license=('MIT')
arch=('any')
depends=('python' 'python-pytest' 'python-ruff')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core'
             'python-poetry-dynamic-versioning')
checkdepends=('python-pytest-mock')
source=("git+https://github.com/businho/pytest-ruff.git#commit=$_commit")
sha512sums=('SKIP')

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
