# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Alexandre Bury <alexandre.bury@gmail.com>

pkgbase=python-polars
pkgname=($pkgbase $pkgbase-runtime-{32,64,compat})
pkgver=1.38.1
pkgrel=1
pkgdesc="Blazingly fast DataFrames library using Apache Arrow Columnar Format as memory model"
arch=("x86_64")
url="https://www.pola.rs/"
license=('MIT')
options=('!lto')
makedepends=(
    # For building the native extensions
    'maturin'
    'rustup'
    'python-installer'
    # For building the python package
    'python-build'
    'python-wheel'
    'python-setuptools'
)
checkdepends=('python-pytest'
              'python-pytest-xdist'
              'python-matplotlib'
              'python-hypothesis'
              'python-pandas'
              'python-pyarrow'
              'python-pydantic'
              'python-fsspec'
              'python-sqlalchemy'
              'python-zstandard'
              'python-cloudpickle'
              'python-aiosqlite'
              'python-boto3'
              'python-orjson')
_name=${pkgname#python-}
_tag="py-$pkgver"
source=("https://github.com/pola-rs/polars/archive/refs/tags/$_tag.tar.gz")
b2sums=('82db2363cec73cb1c5992d1e8d5b335c311619bab03b1837f30850c51905b2b1a23ef8dad0c41fe5e41cd8823fdf377dc6e961ccc8d5b40c2dc2febf5d95095d')

prepare() {
    cd polars-$_tag/py-polars
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    local runtime
    cd polars-$_tag/py-polars
    python -m build --wheel --no-isolation
    for runtime in 32 64 compat; do
        maturin build -o dist --release --locked --strip --compatibility linux --manifest-path runtime/polars-runtime-$runtime/Cargo.toml
    done
}

check() {
    cd polars-$_tag/py-polars

    # Package needs to be installed to run the tests, use a venv
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/polars_runtime_32*.whl
    test-env/bin/python -m installer dist/polars-*.whl


    local _pytest_args=(
        -W ignore::DeprecationWarning
        # ResourceWarning may come from aiosqlite: https://github.com/omnilib/aiosqlite/commit/1cd60adcab12347577150a6fa6c7d92b7b86d989
        -W ignore::ResourceWarning
        -W ignore::pydantic.warnings.PydanticDeprecatedSince211
        --ignore tests/unit/io/test_delta.py
        --ignore tests/unit/operations/namespaces/test_plot.py
        --ignore tests/unit/io/cloud/test_aws.py
        --ignore tests/unit/functions/range/test_datetime_range.py
        --ignore tests/unit/io/test_spreadsheet.py
        --ignore tests/unit/io/test_iceberg.py
        --ignore tests/unit/io/database
        --deselect "tests/unit/streaming/test_streaming_categoricals.py::test_streaming_cat_14933"
        --deselect "tests/unit/dataframe/test_df.py::test_extension"
        --deselect "tests/unit/streaming/test_streaming_group_by.py::test_streaming_group_by_literal[1]"
        --deselect tests/unit/io/test_hive.py::test_hive_decode_reserved_ascii_23241
        --deselect tests/unit/io/test_hive.py::test_hive_decode_utf8_23241
        # tests failing due to changes in Python 3.14
        --deselect tests/unit/constructors/test_constructors.py::test_init_structured_objects_nested[_TestFooNT-_TestBarNT-_TestBazNT]
        --deselect tests/unit/series/test_item.py::test_series_item_out_of_range_date
        --deselect tests/unit/test_init.py::test_type_aliases_deprecated
    )

    # Ignore several test files as they either use unpackaged dependencies, or
    # contain direct errors
    test-env/bin/python -P -m pytest tests/unit "${_pytest_args[@]}"
}

package_python-polars() {
    # note: changing the arch for the main package causes pkgctl to not detect the release correctly.
    # arch=('any')
    depends=('python' 'python-numpy' 'python-polars-runtime')
    optdepends=('python-pandas: for interoperability with pandas frames'
                'python-pyarrow: for interoperability with arrow types'
                'python-pytz: to enable conversion to python datetimes with timezones'
                'python-fsspec: to transparently open files locally or remotely')

    cd polars-$_tag/py-polars
    python -m installer -d "$pkgdir" ./dist/polars-*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

_package_runtime() {
    local runtime=$1
    arch=("x86_64")
    depends=('python')
    provides=(python-polars-runtime)
    pkgdesc="$pkgdesc, runtime libraries$2"

    cd polars-$_tag/py-polars
    python -m installer -d "$pkgdir" ./dist/polars_runtime_${runtime}*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_python-polars-runtime-32() {
  _package_runtime 32 ""
}


package_python-polars-runtime-compat() {
  _package_runtime compat ", older CPU compatibility"
}

package_python-polars-runtime-64() {
    _package_runtime 64 ", large dataset support"
}
