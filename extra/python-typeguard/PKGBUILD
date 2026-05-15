# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-typeguard
pkgver=4.5.2
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver")
b2sums=('37c2026f877a62a20962a3ee915f6c0d3a458ddb7b24937c6b1e619c506212b5871e5068cdc1094d1b956b6521dc0a87725baa79fa5caeb07dc10de5733cfe94')

# Utilize venv for mypy
# disabled, because mypy tests are still failing
#prepare() {
#  cd typeguard
#  sed -i 's|\["mypy"|["python", "-m", "mypy"|' tests/mypy/test_type_annotations.py
#}

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
