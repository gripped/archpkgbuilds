# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.46.4
pkgrel=1
epoch=3
pkgdesc="Core validation logic for pydantic written in rust "
arch=(x86_64)
url="https://github.com/pydantic/pydantic-core"
license=(MIT)
depends=(
  glibc
  libgcc
  python
  python-typing-inspection
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
)
checkdepends=(
  python-dirty-equals
  python-hypothesis
  python-inline-snapshot
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-run-parallel
  python-pytest-timeout
)
options=(!lto)
source=(
    "pydantic::git+https://github.com/pydantic/pydantic.git#tag=core-v${pkgver}"
)

sha512sums=('521d1e547c0b59d4b2f409c6ad611e5fb6359b8b941144292c3463106657be689282a84a376d18a1caac9660f5454bb3595cb9eb5d309383a0ec4bc152a1a2a7')
b2sums=('ab408b0b2e8115bc743355204609c3680321f939b2de883cc0fd04e346ed574bfdd5aaf2aaa7309ed523f164137178873d15b294093937b04dc4883473dcd9af')

build() {
  cd "pydantic/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "pydantic/$_name"
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  HYPOTHESIS_PROFILE=slow pytest "${pytest_options[@]}"
}

package() {
  cd "pydantic/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
