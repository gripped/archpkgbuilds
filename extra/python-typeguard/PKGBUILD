# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-typeguard
pkgver=4.2.0
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('mypy' 'python-pytest')
source=("git+https://github.com/agronholm/typeguard.git#tag=$pkgver")
b2sums=('4f8f57e2ad4e397f5316ec53c21d764b316ce964dfd0872a8be0f27c4edc7c764e23d066a7fa59859c51b3619d0d777be5571d46a56fc897dc6f86075fbceffc')

prepare() {
  cd typeguard
  # Utilize venv for mypy
  # sed -i 's|\["mypy"|["python", "-m", "mypy"|' tests/mypy/test_type_annotations.py
  # disabled, because mypy tests are still failing
}

build() {
  cd typeguard
  python -m build -nw
}

check() {
  cd typeguard
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest --deselect tests/mypy/test_type_annotations.py
}

package() {
  cd typeguard
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
