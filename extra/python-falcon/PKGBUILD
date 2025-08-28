# Maintainer: David Runge <dvzrv@archlinux.org>

_name=falcon
pkgname=python-falcon
pkgver=4.1.0
pkgrel=1
pkgdesc="Web API framework for fast and reliable microservices, proxies, and app backends"
arch=(x86_64)
url="https://falconframework.org/"
_url="https://github.com/falconry/falcon"
license=(Apache-2.0)
depends=(
  glibc
  python
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
sha512sums=('847c6537d0afe8d0ed26531763fc7c09f74cd4f76c3463abac30de850015b8526e67cc57a1a81aba607cc4905309fe0f09466749d3810e0894657cf62eebbaa3')
b2sums=('383285c6fc03ad9fbb30b890535f3f98c8a9aa39977804caee4f0a4d4c4923fa2206bb9ac2a216926e81d6681f24beceeb0c7e313cadccfbf2e78fa7f2354e5b')

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
