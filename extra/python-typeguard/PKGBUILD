# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-typeguard
pkgver=4.5.0
pkgrel=1
pkgdesc="Run-time type checker for Python"
url="https://github.com/agronholm/typeguard"
license=('MIT')
arch=('any')
depends=('python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=("git+$url.git#tag=$pkgver")
b2sums=('afcc7f4a96e5c30272adfc3850f71bb09e8413c959f895805e95850185d4840efa705c984a00c700e9183ae3aade01183ed32c930d3c6e3524ce19f44bf78568')

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
