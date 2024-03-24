# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-subtests
pkgver=0.12.0
_commit=850fc2bcae51ca66b8d980907356efa098f1645f
pkgrel=1
pkgdesc='unittest subTest() support and subtests fixture'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-subtests'
depends=('python-attrs' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
source=("git+https://github.com/pytest-dev/pytest-subtests.git#commit=$_commit")
sha512sums=('9bb6fca52640755f18231ad8bb8fec98e899289eb4fbceeeb7e83922151b41422c0ae8c8551f2761da01aaba1a338c2c4eb97d0bcfa8a1066e0b5f986d918469')

build() {
  cd pytest-subtests
  python -m build -nw
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd pytest-subtests
  python -m installer --destdir=test_dir dist/*.whl
  PYTHONPATH="$PWD/test_dir/$site_packages" pytest
}

package() {
  cd pytest-subtests
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
