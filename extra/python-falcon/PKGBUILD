# Maintainer: David Runge <dvzrv@archlinux.org>

_name=falcon
pkgname=python-falcon
pkgver=4.0.2
pkgrel=1
pkgdesc="Web API framework for fast and reliable microservices, proxies, and app backends"
arch=(x86_64)
url="https://falconframework.org/"
_url="https://github.com/falconry/falcon"
license=(Apache-2.0)
depends=(
  glibc
  python
  # TODO: remove when bumping to 4.x
  python-cgi
)
makedepends=(
  cython
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# TODO: add python-daphne
checkdepends=(
  gunicorn
  hypercorn
  python-aiofiles
  python-cbor2
  python-httpx
  python-jsonschema
  python-mimeparse
  python-msgpack
  python-mujson
  python-orjson
  python-pecan
  python-pytest
  python-pytest-asyncio
  python-pyyaml
  python-rapidjson
  python-requests
  python-testtools
  python-ujson
  python-websockets
  uvicorn
)
optdepends=(
  'python-bottle: for falcon-bench'
  'python-django: for falcon-bench'
  'python-flask: for falcon-bench'
  'python-jsonschema: for JSON schema validation'
  'python-msgpack: for MessagePackHandler'
  'python-pecan: for falcon-bench'
  'python-pprofile: for falcon-bench'
)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('48f13834f9ba5829aa7050a6c86839533332c47282f12dc96d3d2f82a67f7a53878bf5f96b249bd79f5985eb1e2bde94ad246c2d0f3e1deebb4c04f364a23ac4')
b2sums=('d4e8c353a340508404117a5ba18bb3ddbf383eadfd22bafbdd82b6515521103c4c33abe65a4c1f6c6eb9b506473ba238ff0526f91c825737b61b0d43fd672d35')

prepare() {
  cd $_name-$pkgver
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv tests/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
