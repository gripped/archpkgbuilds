# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=pydantic
pkgname=python-$_name
# WARNING: upstream pins pydantic-core down to the patch-level and using other versions breaks tests! only update in lock-step with python-pydantic-core!
pkgver=2.6.0
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints'
arch=(any)
url="https://github.com/pydantic/pydantic"
license=(MIT)
depends=(
  python
  python-annotated-types
  python-pydantic-core
  python-typing-extensions
)
makedepends=(
  cython
  python-build
  python-installer
  python-importlib-metadata
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-wheel
)
checkdepends=(
  python-ansi2html
  python-cloudpickle
  python-devtools
  python-dirty-equals
  python-email-validator
  python-faker
  python-hypothesis
  python-pygments
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-sqlalchemy
)
optdepends=(
  'mypy: for type validation with mypy'
  'python-dotenv: for .env file support'
  'python-email-validator: for email validation'
  'python-hypothesis: for hypothesis plugin when using legacy v1'
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('d2abf34b607a6cdcdee849edcdb08c936a8fb946e3f66d090524e7e0c0706205d0b7cb9de5e0068b78820f068a5bb6b750f9569a29197c454e2d4f73110cc236')
b2sums=('eeaa4d797bcd3bcbc2c28c1aad7064742ddba80ca3f5fc70f0cb91c40d2641d0a13ce97e08358cc6970feff487deaa3362c259c1cee966c8ae7fc82fe7b73632')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    # disable broken tests: https://github.com/pydantic/pydantic/issues/8459
    --deselect tests/benchmarks/test_north_star.py::test_north_star_validate_json
    --deselect tests/benchmarks/test_north_star.py::test_north_star_validate_json_strict
    --deselect tests/benchmarks/test_north_star.py::test_north_star_dump_json
    --deselect tests/benchmarks/test_north_star.py::test_north_star_validate_python
    --deselect tests/benchmarks/test_north_star.py::test_north_star_validate_python_strict
    --deselect tests/benchmarks/test_north_star.py::test_north_star_dump_python
    --deselect tests/benchmarks/test_north_star.py::test_north_star_json_loads
    --deselect tests/benchmarks/test_north_star.py::test_north_star_json_dumps
    # disable broken doc test: https://github.com/pydantic/pydantic/issues/8460
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/serialization.md:354-391]'
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
