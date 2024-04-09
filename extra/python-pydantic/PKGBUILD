# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=pydantic
pkgname=python-$_name
# WARNING: upstream pins pydantic-core down to the patch-level and using other versions breaks tests! only update in lock-step with python-pydantic-core!
pkgver=2.6.4
pkgrel=2
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
sha512sums=('dd3cb35d6b062649f30ede0f32740d02e53383d231b3c92e9a6aec26d8fa07a141d22162b2e08efa49ea7321411891f9a34cb5bc2e05186c4069f57cec6e51d2')
b2sums=('e9aab3378dceb544be12d49bd6d34f83b3d9b14db2517de058ae93dccb2fc0d84bece4103b7fe9349764d16ec3fe36f4d14fa06381880ee143efa1ac0beeaecf')

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
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:478-512]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:598-617]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:621-645]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:650-663]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:672-687]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:691-707]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:746-771]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:789-826]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:835-864]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/config.py:877-897]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/functional_serializers.py:88-137]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/functional_validators.py:38-68]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/functional_validators.py:308-339]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/functional_validators.py:557-584]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/networks.py:116-145]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/networks.py:215-262]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/networks.py:505-529]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:197-223]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:237-263]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:268-294]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:299-325]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:330-356]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:361-376]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:484-510]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:515-541]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:546-572]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:577-603]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:608-623]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:1060-1088]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:1247-1284]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:1289-1326]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2163-2209]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2260-2306]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2351-2378]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2389-2416]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2528-2580]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2617-2669]'
    --deselect 'tests/test_docs.py::test_docstrings_examples[pydantic/types.py:2813-2838]'
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/models.md:1004-1034]'
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/plugins.md:28-34]'
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/plugins.md:110-116]'
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/serialization.md:313-344]'
    --deselect 'tests/test_docs.py::test_docs_examples[docs/concepts/validators.md:512-546]'
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
