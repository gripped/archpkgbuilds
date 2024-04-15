# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=pydantic
pkgname=python-$_name
# WARNING: upstream pins pydantic-core down to the patch-level and using other versions breaks tests! only update in lock-step with python-pydantic-core!
pkgver=2.7.0
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
sha512sums=('14fe4e55bbfaade52b5176207b3a0101980316b8c35d1fc22e05448106776deee01b31cdd61c03742afc26bd45a5dfca8feb4f67bee75bf7f3c17c028c6088c8')
b2sums=('8a82fe997f7e70b049e29069bc130fd825485e65ff9bcdb1e3b27c0898dbc662dc4631655940b2326a2314e84520908d3d0955c6b3299d402671de6cef1b30d5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/test_config.py::TestsBaseConfig::test_config_class_is_deprecated
    --deselect tests/test_config.py::TestsBaseConfig::test_config_class_attributes_are_deprecated
    --deselect tests/test_deprecated.py::test_parse_raw_pass
    --deselect tests/test_deprecated.py::test_parse_raw_pass_fail
    --deselect tests/test_deprecated.py::test_field_include_deprecation
    --deselect tests/test_deprecated.py::test_parse_file
    --deselect tests/test_deprecated.py::test_deprecated_module
    --deselect tests/test_docs.py  # we are not interested in code formatting
    --deselect 'tests/test_json_schema.py::test_callable_fallback_with_non_serializable_default[Cannot generate a JsonSchema for core_schema.CallableSchema \\[skipped-choice\\]]'
    --deselect 'tests/test_json_schema.py::test_callable_fallback_with_non_serializable_default[Default value .* is not JSON serializable; excluding default from JSON schema \\[non-serializable-default\\]]'
    --deselect tests/test_validators.py::test_use_bare
    --deselect tests/test_validators.py::test_use_no_fields
    --deselect tests/test_validators.py::test_validator_bad_fields_throws_configerror
    --deselect tests/test_validators.py::test_assert_raises_validation_error
    --deselect tests/test_validators.py::test_root_validator_allow_reuse_same_field
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
