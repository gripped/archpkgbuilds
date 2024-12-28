# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkg=dask
pkgname=python-${_pkg}
pkgver=2024.12.1
pkgrel=1
pkgdesc="Parallel computing with task scheduling"
arch=(any)
url="https://dask.org"
license=(BSD-3-Clause)
depends=(
    mpdecimal
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
    python-versioneer
    python-wheel
)
optdepends=(
#    'python-bokeh: visualizing dask diagnostics'
#    'python-cityhash: faster hashing of arrays'
    'python-distributed: distributed computing'
#    'python-fastparquet: storing and reading data from parquet files'
#    'python-gcsfs: file-system interface to Google Cloud Storage'
#    'python-jinja: diagnostics'
#    'python-murmurhash: faster hashing of arrays'
    'python-numpy: arrays and dataframes support'
    'python-pandas: dataframes support'
    'python-psutil: more accurate CPU count'
    'python-pyarrow: Apache Arrow, for parquet support'
#    'python-s3fs: Amazon S3 support'
    'python-sqlalchemy: writing and reading from SQL databases'
    'python-xxhash: faster hashing of arrays'
)
checkdepends=(
    ipython
    python-pytest
    python-pytest-rerunfailures
    python-aiohttp
#    python-bokeh
    python-boto3
    python-botocore
    python-cytoolz
#    python-cityhash
    python-distributed
#    python-fastparquet
#    python-gcsfs
    python-graphviz
    python-h5py
    python-httpretty
    python-jinja
    python-jsonschema
    python-lz4
    python-matplotlib
    python-moto
#    python-murmurhash
#    python-numba
    python-numexpr
    python-numpy
    python-pandas
    python-psutil
    python-pyarrow
    python-pytables
    python-requests
#    python-s3fs
    python-scikit-learn
    python-scipy
    python-snappy
#    python-sparse
    python-sqlalchemy
    python-xarray
    python-xxhash
    python-dask-expr
)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/dask/dask/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
        test-pandas-2.0)
sha256sums=('fe4dfcb46e74e7b3c3c9572b010a47323d907f66b0ed8b894cba2b0035d0de64'
            '9ddb45fefbfb1aaa3af20a6a2c6d4fcb20da5b3761e70313c92ae4f4f86634a2')

prepare() {
  cd ${_pkg}-${pkgver}
  sed -e 's|versioneer\[toml\].*\"|versioneer[toml]\"|g' -i pyproject.toml

  # patch -p1 -i ../test-pandas-2.0 # Fix test with pandas 2.0 (Fedora)
}

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --deselect dask/array/tests/test_reductions.py
    --deselect dask/dataframe/tests/test_accessors.py
    --deselect dask/dataframe/tests/test_arithmetics_reduction.py
    --deselect dask/dataframe/tests/test_categorical.py
    --deselect dask/dataframe/tests/test_dataframe.py
    --deselect dask/dataframe/tests/test_groupby.py
    --deselect dask/dataframe/tests/test_hyperloglog.py::test_larger_data
    --deselect dask/dataframe/tests/test_indexing.py
    --deselect dask/dataframe/tests/test_merge_column_and_index.py
    --deselect dask/dataframe/tests/test_multi.py
    --deselect dask/dataframe/tests/test_numeric.py
    --deselect dask/dataframe/tests/test_reshape.py
    --deselect dask/dataframe/tests/test_rolling.py
    --deselect dask/dataframe/tests/test_shuffle.py
    --deselect dask/dataframe/tests/test_ufunc.py
    --deselect dask/dataframe/tests/test_utils_dataframe.py::test_assert_eq_sorts
    --deselect dask/dataframe/io/tests/test_csv.py
    --deselect dask/dataframe/io/tests/test_demo.py
    --deselect dask/dataframe/io/tests/test_io.py
    --deselect dask/dataframe/io/tests/test_parquet.py
    --deselect dask/dataframe/io/tests/test_sql.py
    --deselect dask/dataframe/tseries/tests/test_resample.py::test_resample_agg_passes_kwargs
    --deselect dask/dataframe/tseries/tests/test_resample.py::test_resample_pads_last_division_to_avoid_off_by_one
    --deselect dask/tests/test_base.py::test_visualize_order
    --deselect dask/tests/test_tokenize.py::test_tokenize_dataclass
    -k 'not test_RandomState_only_funcs'
    -m 'not network and not slow and not gpu'
    -W ignore::DeprecationWarning
  ) # https://github.com/dask/dask/issues/10418

  cd ${_pkg}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}"
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
