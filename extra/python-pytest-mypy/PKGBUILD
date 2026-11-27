# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-mypy
pkgver=1.1.0
pkgrel=1
pkgdesc='Mypy static type checker plugin for Pytest'
arch=('any')
license=('MIT')
url='https://github.com/dbader/pytest-mypy'
depends=('python-filelock' 'python-pytest' 'mypy')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-xdist' 'python-pexpect' 'python-packaging')
source=("git+https://github.com/dbader/pytest-mypy.git#tag=v$pkgver")
sha512sums=('00c4a3d51aa117379215850e12da268b8b0b8e227e2f6787c7d24c839f856b89e1be35ebd65aaa2bc7da393948b4f1716be8ebc7f8d2858105eade7e86893bff')

prepare() {
  cd pytest-mypy

  # Arch's pure-Python mypy 2.4 emits three EncodingWarnings instead of one.
  sed -i 's/expected_warnings -= 1/expected_warnings += 1/' tests/test_pytest_mypy.py

  # Match the summary literally so its parentheses do not become regex groups.
  sed -i 's/child.expect("Found 1 error/child.expect_exact("Found 1 error/' tests/test_pytest_mypy.py

  # Build hosts can exceed the test's 60-second loop-on-fail timeout.
  sed -i 's/expect_timeout=60\.0/expect_timeout=180.0/' tests/test_pytest_mypy.py
}

build() {
  cd pytest-mypy
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-mypy
  PYTHONPATH="$PWD"/src pytest -v
}

package() {
  cd pytest-mypy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
