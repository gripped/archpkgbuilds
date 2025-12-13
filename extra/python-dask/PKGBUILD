# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=dask
pkgname=python-$_name
pkgver=2025.12.0
pkgrel=1
pkgdesc="Parallel computing with task scheduling"
arch=(any)
url="https://dask.org"
license=(BSD-3-Clause)
depends=(
  python
  python-click
  python-cloudpickle
  python-fsspec
  python-importlib-metadata
  python-packaging
  python-partd
  python-yaml
  python-toolz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
optdepends=(
#  'python-bokeh: visualizing dask diagnostics'
#  'python-cityhash: faster hashing of arrays'
  'python-distributed: distributed computing'
#  'python-fastparquet: storing and reading data from parquet files'
#  'python-gcsfs: file-system interface to Google Cloud Storage'
#  'python-jinja: diagnostics'
#  'python-murmurhash: faster hashing of arrays'
  'python-numpy: arrays and dataframes support'
  'python-pandas: dataframes support'
  'python-psutil: more accurate CPU count'
  'python-pyarrow: Apache Arrow, for parquet support'
#  'python-s3fs: Amazon S3 support'
  'python-sqlalchemy: writing and reading from SQL databases'
  'python-xxhash: faster hashing of arrays'
)
checkdepends=(
  ipython
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-xdist
  python-aiohttp
#  python-bokeh
  python-boto3
  python-botocore
  python-cytoolz
#  python-cityhash
  python-distributed
#  python-fastparquet
#  python-gcsfs
  python-graphviz
  python-h5py
  python-httpretty
  python-jinja
  python-jsonschema
  python-lz4
  python-matplotlib
  python-moto
#  python-murmurhash
#  python-numba
  python-numexpr
  python-numpy
  python-pandas
  python-psutil
  python-pyarrow
  python-pytables
  python-requests
#  python-s3fs
  python-scikit-learn
  python-scipy
  python-snappy
#  python-sparse
  python-sqlalchemy
  python-xarray
  python-xxhash
)
source=(
  https://github.com/dask/dask/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
b2sums=('f6c31a4bdb8ba0d820e5b1efc91424086730d9fcdb83f682122ca3ed82e420d201185b4362629be82dc37aedbb08e7496073db9ad091f22fea156c467b4a5374')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver \
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    -k 'not test_RandomState_only_funcs'
    -m 'not network and not slow and not gpu'
    -W ignore::DeprecationWarning
    # distribute tests across multiple CPUs
    -n auto
    --deselect dask/dataframe/dask_expr/tests/test_shuffle.py::test_set_index_head_nlargest_string
    # skip tests that require zarr (not packaged)
    --deselect dask/array/tests/test_xarray.py::test_xarray_blockwise_fusion_store
    # skip failing test (assert 16 >= 32)
    --deselect dask/tests/test_tokenize.py::test_tokenize_range_index
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
