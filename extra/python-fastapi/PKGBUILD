# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.143.0
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/fastapi/fastapi"
license=(MIT)
depends=(
  python
  python-annotated-doc
  python-anyio  # implicitly required for concurrency
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing_extensions
  python-opentelemetry-api
)
makedepends=(
  python-build
  python-dirty-equals
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  # test dependencies
  git
  python-aiosqlite
  python-a2wsgi
  python-anyio
  python-flask
  python-httpx
  python-httpx2
  python-inline-snapshot
  python-peewee
  python-pytest
  python-pytest-timeout
  python-pytest-xdist
  python-sentry_sdk
  python-sqlalchemy
  python-sqlmodel
  python-trio
  python-typer

  # optdepends
  python-email-validator
  python-itsdangerous
  python-jinja
  python-opentelemetry-sdk
  python-opentelemetry-exporter-otlp-proto-http
  python-orjson
  python-python-multipart
  python-pyyaml
  python-strawberry-graphql
  python-ujson
  uvicorn

  # dev depends
  python-argon2-cffi
  python-cryptography
  python-pyjwt
  python-pwdlib
)
optdepends=(
  'hypercorn: for Hypercorn as ASGI server'
  'python-email-validator: for email validation'
  'python-itsdangerous: for SessionMiddleware support'
  'python-jinja: for default starlette template configuration'
  'python-opentelemetry-sdk: OpenTelemetry instrumentation and telemetry processing'
  'python-opentelemetry-exporter-otlp-proto-http: export telemetry over OTLP/HTTP'
  'python-orjson: for ORJSONResponse'
  'python-python-multipart: for form parsing support'
  'python-pyyaml: for starlette SchemaGenerator support'
  'python-httpx: for TestClient support'
  'python-strawberry-graphql: for GraphQL support'
  'python-ujson: for faster JSON parsing and UJSONResponse'
  'uvicorn: for Uvicorn as ASGI server'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('96091936fc0b98d94dfead9ef3108dab01c4b5eda1195829351a74582c08b80658b571560a66adf5628e12aa46742f44fe39efd3eb4ca796233a098a13b6e640')
b2sums=('8acf66b2a3ef07b677756f1d16cbf63cf2c22a00434143cf79273a91052bca111c17b7d6df204e2c09f932ddace4b487b7803b2645785034529252686f24f260')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
  sed -i '/"error"/d' pyproject.toml
  # pytest 9 expects pytest-timeout's TOML option to be numeric
  sed -i 's/^timeout = "20"$/timeout = 20/' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # This test wants to run fastapi cli from $PATH
    --deselect tests/test_fastapi_cli.py::test_fastapi_cli
  )

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  # Ignore tests requiring dependencies we don't have in our repo
  # See https://gitlab.archlinux.org/archlinux/packaging/packages/python-fastapi/-/work_items/61#note_572829 for details
  pytest "${pytest_options[@]}" \
    --deselect tests/test_telemetry/test_integrations.py::test_current_contrib[global] \
    --deselect tests/test_telemetry/test_runtime.py::test_registration_provider_prefers_public_metric_reader \
    --deselect tests/test_telemetry/test_runtime.py::test_concurrent_provider_owner_wins[True] \
    --deselect tests/test_telemetry/test_background.py::test_background_task_integrations[contrib] \
    --deselect tests/test_telemetry/test_background.py::test_background_task_integrations[logfire] \
    --deselect tests/test_telemetry/test_background.py::test_background_task_integrations[native_logfire] \
    --deselect tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations[logfire] \
    --deselect tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations[logfire-opt-out] \
    --deselect tests/test_telemetry/test_integrations.py::test_current_contrib[app] \
    --deselect tests/test_telemetry/test_integrations.py::test_current_contrib[late] \
    --deselect tests/test_telemetry/test_integrations.py::test_current_contrib[uninstrument] \
    --deselect tests/test_telemetry/test_integrations.py::test_current_logfire[before] \
    --deselect tests/test_telemetry/test_integrations.py::test_current_logfire[after] \
    --deselect tests/test_telemetry/test_integrations.py::test_logfire_global_provider_without_fastapi_instrumentor \
    --deselect tests/test_telemetry/test_native_integrations.py::test_logfire_native_spans_and_exception_logs
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
