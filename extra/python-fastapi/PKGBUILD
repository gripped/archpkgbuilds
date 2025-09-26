# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.117.1
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/fastapi/fastapi"
license=(MIT)
depends=(
  python
  python-anyio  # implicitly required for concurrency
  python-pydantic
  python-pydantic-core
  python-pydantic-extra-types
  python-pydantic-settings
  python-starlette
  python-typing_extensions
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
  python-aiosqlite
  python-anyio
  python-databases
  python-flask
  python-httpx
  python-inline-snapshot
  python-peewee
  python-pytest
  python-sqlalchemy
  python-sqlmodel
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
sha512sums=('65bbdddd32d48e070b03e6fd7ce5212f55eab033be2e7c80810e827f780aca7a519f3fb5978e6d14eb8f78000190fab6b35bf19e7b7840ca55c5e74ddeb3edc3')
b2sums=('1efb496aac0ae6ee0cfc8e4128e71743df0771838f453b5eff074d11aadf12cd16ff5340cf20eb921e58fdd9c3d9e6f538c62b8c194cbc0d6f47fcb4f7dd6e72')

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
