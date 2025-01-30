# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

_name=fastapi
pkgname=python-$_name
pkgver=0.115.8
pkgrel=1
pkgdesc='FastAPI framework, high performance, easy to learn, fast to code, ready for production'
arch=(any)
url="https://github.com/fastapi/fastapi"
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
source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        0001-Allow-httpx-0.28.x-relax-pins.patch)
sha512sums=('1973997cbcd494c3ce58f740f11022c63f968f861e27ff076983dd3c307ece94b3eb1e62f5aa291462cd3250a0dfad8238722d39926ca392316678634a75987f'
            '2f0ef2997233f5524ef342261f9f3c8da394dd1b0664a45d7b777391387328636d7b527a4cd98db2182c4e10c57caf13e1a66e60404d2b796e5ec5d93efcdd8e')
b2sums=('4bde901ea268bde82560a5673be898295a80eb72d69a3781247a802a94c80990af265d679ee9aebdd4f60b1f9327576f83f9e69f2972d37e160ffc331810bd70'
        'f929b6de37bdf34549b55ad1c8bc36a04de1fa44fe231b7e4dc9beb24c06d74ee0dc115d5e1b29339be41ecbdb2601e1ce050aafb1c41ba5f6f0c5f542b8e859')

prepare() {
  cd $_name-$pkgver
  # do not pin starlette dependency
  sed -i 's|starlette.*"|starlette"|' pyproject.toml
  sed -i '/"error"/d' pyproject.toml

  patch -Np1 -i ../0001-Allow-httpx-0.28.x-relax-pins.patch
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
