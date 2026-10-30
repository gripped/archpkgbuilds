# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic-core
pkgname=python-pydantic-core
# WARNING: this package is pinned down to the patch-level version in python-pydantic and should only be updated in lock-step with it
pkgver=2.50.2
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

sha512sums=('20e6c31a4f11fbbe4f39e5814acc0d1c79c71f846e8cedbab52f8cdf55a407a0d279738c2a04e19b04dc8041d4fc90f73184513ec04dcc9c562b9644a3f243df')
b2sums=('70551b316c1f2e27ba978af287c873f99c04a1817536c29a3b790dc2952c004b801d18e71f3800becb4ded8948ea0637f64a4be65d90a9d5d556a999d991eace')

build() {
  cd "pydantic/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_docstrings.py  # we are not interested in linting/ formatting with ruff
    --ignore tests/test_tzinfo.py  # requires python-pydantic
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
