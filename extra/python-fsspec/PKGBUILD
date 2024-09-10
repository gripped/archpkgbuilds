# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

_pkgname=filesystem_spec
pkgname=python-fsspec
pkgver=2024.9.0
pkgrel=2
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
sha256sums=('c02c956b0f89ff1f5dc3c78d1298d45264b3ac1a517ff92008c9e866ca34cf0f')

build() {
  cd $_pkgname-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  pytest \
    --deselect fsspec/implementations/tests/test_ftp.py \
    --deselect fsspec/implementations/tests/test_zip.py::test_find_returns_expected_result_detail_true \
    --deselect fsspec/implementations/tests/test_zip.py::test_find_returns_expected_result_detail_true_include_dirs
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
