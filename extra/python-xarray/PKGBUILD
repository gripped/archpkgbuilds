# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=xarray
pkgname=python-${_pkg}
pkgver=2025.01.1
pkgrel=2
pkgdesc="N-D labeled arrays and datasets in Python"
arch=(any)
url="https://xarray.pydata.org/"
license=(Apache-2.0)
depends=(
  python
  python-numpy
  python-packaging
  python-pandas
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-aiobotocore
  python-bottleneck
  python-cftime
  python-dask
  python-distributed
  python-fsspec
  python-h5py
  python-hypothesis
  python-matplotlib
  python-netcdf4
  python-numexpr
  python-pint
  python-pyarrow
  python-pytest
  python-scipy
  python-seaborn
)
optdepends=(
  'python-netcdf4: netCDF4 support'
  'python-scipy: interpolation features & fallback for netCDF3 support'
#  'python-pydap: fallback for accessing OPeNDAP'
#  'python-h5netcdf: alternative for netCDF4 support'
#  'python-zarr: chunked, compressed N-dimensional arrays'
  'python-cftime: datetimes support for non-standard calendars or distant dates'
#  'python-pseudonetcdf: atmospheric science specific file formats support'
#  'python-rasterio: GeoTiffs and other gridded raster datasets support'
#  'python-iris: conversion to and from iris’ Cube objects'
#  'python-cfgrib: mapping GRIB files to CDF4'
  'python-bottleneck: faster NaN-skipping and rolling window aggregations'
#  'python-numbagg: faster exponential rolling window operations'
#  'python-flox: faster GroupBy reductions'
  'python-dask: parallel computation'
  'python-distributed: parallel computation'
  'python-matplotlib: plotting support'
#  'python-cartopy: plotting of cartographic data'
  'python-seaborn: better color palettes for plots'
#  'python-nc-time-axis: plotting of cftime.datetime objects'
#  'python-sparse: sparse arrays support'
  'python-pint: units of measure support'
)
source=("https://github.com/pydata/xarray/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eb2874604883f3eca5122a59975a9bbdb4529594440a504e8dc6191f3075eef6')

build() {
  cd ${_pkg}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_pkg}-${pkgver}
  local pytest_args=(
    -W ignore::pytest.PytestDeprecationWarning
    # Segfaults with python-h5py installed
    --deselect=xarray/tests/test_backends.py::TestDask::test_save_mfdataset_compute_false_roundtrip
    # Fails with:
    # E   RuntimeError: NetCDF: Filter error: undefined filter encountered: (variable 'var2', group '/')
    --deselect=xarray/tests/test_backends.py::TestNetCDF4Data::test_compression_encoding
    --deselect=xarray/tests/test_backends.py::TestNetCDF4ViaDaskData::test_compression_encoding
    # Fails with:
    # E       Failed: DID NOT RAISE <class 'ValueError'>
    --deselect=xarray/tests/test_groupby.py::test_dask_da_groupby_quantile
  )
  pytest "${pytest_args[@]}"
}

package() {
  cd ${_pkg}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Remove tests
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "${pkgdir}/${site_packages}/xarray/tests"
}
