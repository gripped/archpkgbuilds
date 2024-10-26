# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

_pkgname=filesystem_spec
pkgname=python-fsspec
pkgver=2024.10.0
pkgrel=1
pkgdesc="Specification that python filesystems should adhere to"
arch=(any)
url="https://github.com/intake/filesystem_spec"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  git
  jupyter-notebook
  python-aiohttp
  python-cloudpickle
  python-dask
  python-distributed
  python-fastparquet
  # python-fusepy
  python-jinja
  python-libarchive-c
  python-lz4
  python-msgpack
  python-numpy
  python-pandas
  python-paramiko
  python-pyarrow
  python-pyftpdlib
  python-pygit2
  python-pytest
  python-pytest-asyncio
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-vcr
  python-requests
  python-smbprotocol
  python-snappy
  python-tqdm
  python-zstandard
)
optdepends=(
  'python-aiohttp: HTTP support'
  'python-distributed: Dask support'
  'python-libarchive-c: archives support'
  'python-lz4: LZ4 compression support'
  'python-paramiko: SFTP support'
  'python-pyarrow: Arrow/Parquet support'
  'python-pygit2: git support'
  'python-requests: web protocols support'
  'python-smbprotocol: SMB support'
  'python-snappy: snappy compression support'
  'python-zstandard: zstandard (zstd) compression support'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c63053dbc872b07effaf02f2e59d1314f1c5a5deaa95cc36149895c151fa7eb3')

build() {
  cd $_pkgname-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest \
    --deselect fsspec/implementations/tests/test_ftp.py \
    --deselect fsspec/implementations/tests/test_http.py \
    --deselect fsspec/implementations/tests/test_reference.py::test_defaults \
    --deselect fsspec/implementations/tests/test_reference.py::test_info \
    --deselect fsspec/implementations/tests/test_reference.py::test_simple \
    --deselect fsspec/implementations/tests/test_reference.py::test_simple_ver1 \
    --deselect fsspec/tests/test_caches.py::test_background \
    --deselect fsspec/tests/test_generic.py::test_cat_async \
    --deselect fsspec/tests/test_generic.py::test_cp_async_to_sync \
    --deselect fsspec/tests/test_generic.py::test_remote_async_ops
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
