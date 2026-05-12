# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>

_name=pydantic
pkgname=python-$_name
# WARNING: upstream pins pydantic-core down to the patch-level and using other versions breaks tests! only update in lock-step with python-pydantic-core!
pkgver=2.13.4
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints'
arch=(any)
url="https://github.com/pydantic/pydantic"
license=(MIT)
depends=(
  python
  python-annotated-types
  python-pydantic-core
  python-typing_extensions
  python-typing-inspection
)
makedepends=(
  cython
  python-build
  python-installer
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-wheel
)
checkdepends=(
  python-ansi2html
  python-cloudpickle
  python-dirty-equals
  python-email-validator
  python-faker
  python-greenlet
  python-hypothesis
  python-inline-snapshot
  python-jsonschema
  python-packaging
  python-pygments
  python-pytest
  python-pytest-benchmark
  python-pytest-examples
  python-pytest-mock
  python-pytest-pretty
  python-pytest-run-parallel
  python-pytest-timeout
  python-pytz
  python-sqlalchemy
)
optdepends=(
  'mypy: for type validation with mypy'
  'python-dotenv: for .env file support'
  'python-email-validator: for email validation'
  'python-hypothesis: for hypothesis plugin when using legacy v1'
)
source=(
  $url/archive/v$pkgver/$_name-v$pkgver.tar.gz
)
sha512sums=('947572f1bd15ecf96c88b0ca7e3d049fb5b855819a2d163560ed7c3789cf6a4b77c5493c663cdae9f9c198885715676c5d987de87144ce0bf1464ba5ecb68f14')
b2sums=('dccf3ab8bb306ed7973ec9637325851f7412574aed9d28d7510f0f73bad29cad157d35951261568303c601a882fbc93b82391fdcbfa338acfc5a1a2f9a38cd0f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/test_docs.py  # we are not interested in code formatting
    --deselect tests/pydantic_core/test_docstrings.py::test_readme  # we are not interested in code formatting
    --deselect tests/test_types.py::test_string_fails
    --deselect 'tests/test_networks.py::test_address_invalid[foobar-An email address must have an @-sign.]'
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
