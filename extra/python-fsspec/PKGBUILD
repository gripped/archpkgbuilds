# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

_pkg=filesystem_spec
pkgname=python-fsspec
pkgver=2024.6.0
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
checkdepends=(git
  python-pytest
  python-pytest-asyncio
  python-pytest-mock
  python-pytest-vcr
  python-aiohttp
  python-dask
  python-distributed
  python-fastparquet
  # python-fusepy
  python-libarchive-c
  python-paramiko
  python-pyarrow
  python-pygit2
  python-requests
  python-smbprotocol
  python-cloudpickle
  python-jinja
  python-lz4
  python-msgpack
  python-numpy
  python-pandas
  python-pyftpdlib
  python-snappy
  python-tqdm
  python-zstandard
  jupyter-notebook
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
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c8b94712b235cc9f05c124e86dd291cfd0732a80c5edac83140d7ac952a5339b')

build() {
  cd "$_pkg-$pkgver"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg-$pkgver"

  pytest
}

package() {
  cd "$_pkg-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
