# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.112.1
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/tiangolo/fastapi"
license=(MIT)
depends=(
  python
  python-anyio  # implicitly required for concurrency
  python-dirty-equals
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  # test dependencies
  python-aiosqlite
  python-anyio
  python-coverage
  python-databases
  python-flask
  python-httpx
  python-peewee
  python-pytest
  python-sqlalchemy
  python-trio

  # optdepends
  python-email-validator
  python-itsdangerous
  python-jinja
  python-orjson
  python-python-multipart
  python-pyyaml
  python-ujson
  uvicorn

  # dev depends
  python-bcrypt
  python-cryptography
  python-pyjwt
  python-passlib
)
optdepends=(
  'hypercorn: for Hypercorn as ASGI server'
  'python-email-validator: for email validation'
  'python-itsdangerous: for SessionMiddleware support'
  'python-jinja: for default starlette template configuration'
  'python-orjson: for ORJSONResponse'
  'python-python-multipart: for form parsing support'
  'python-pyyaml: for starlette SchemaGenerator support'
  'python-httpx: for TestClient support'
  'python-ujson: for faster JSON parsing and UJSONResponse'
  'uvicorn: for Uvicorn as ASGI server'
)
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('4f1b36ac366a6302f58cc209ff93d54038adfdd7234d8bb15ce1192192db6414cfab7bb31865af0c26d3c1156d1c3bf63061b39fc4c16a2228552a4cea540272')
b2sums=('70c590b0fefcb864f01be4b9e74b21379887f935e50618b213e2b6ea872faa27d8d78c1c3fd4d5f2c28a802b39fbf03dd7bda51ccb42b3beadc61ff871c2315d')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
  sed -i '/"error"/d' pyproject.toml
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local pytest_options=(
    -vv
    # These tests are failing with "DeprecationWarning: The 'app' shortcut is now deprecated. Use the explicit style 'transport=ASGITransport(app=...)'"
    # It should have been addressed by upstream by then, but for some reason it is still failing
    # Will try to reselect them at next release
    --deselect tests/test_tutorial/test_async_tests/test_main.py::test_root[asyncio]
    --deselect tests/test_tutorial/test_async_tests/test_main.py::test_async_testing[asyncio]
    --deselect tests/test_tutorial/test_async_tests/test_main.py::test_root[trio]
    --deselect tests/test_tutorial/test_async_tests/test_main.py::test_async_testing[trio]
    # This test wants to run fastapi cli from $PATH
    --deselect tests/test_fastapi_cli.py::test_fastapi_cli
  )

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
