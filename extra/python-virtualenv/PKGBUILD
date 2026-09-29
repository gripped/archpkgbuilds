# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=21.13.0
pkgrel=1
pkgdesc='Virtual Python Environment builder'
arch=(any)
url='https://virtualenv.pypa.io'
license=(MIT)
depends=(
  python
  python-distlib
  python-filelock
  python-platformdirs
  python-python-discovery
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-wheel
  python-sphinx
  python-sphinx-argparse
  python-sphinx-autodoc-typehints
  python-sphinx-copybutton
  python-sphinx-inline-tabs
  python-sphinxcontrib-towncrier
  python-sphinxcontrib-mermaid
  towncrier
)
checkdepends=(
  fish
  python-flaky
  python-pip
  python-pytest
  python-pytest-freezer
  python-pytest-mock
  python-pytest-env
  python-pytest-timeout
  python-time-machine
  python-setuptools
  tcsh
  xonsh
)
replaces=(virtualenv)
conflicts=(virtualenv)
options=(!makeflags)
source=(
  "$pkgname::git+https://github.com/pypa/virtualenv#tag=$pkgver"
  no-llm-crap.patch
)
sha512sums=('a53ab90d65aa7303722db65257834d387f1433fc57c8b45b52974e324242473eb1e2e70f819181f287785dc6c84ad52614e067ceaf2fc6ad8aa9f50851ed8b3b'
            '243e7a6b08616b9bd30bd32295fe52b32ce3902f462dcd21f7f5ba3979577ad79fdf571965dbb6ff8d85ddd3ac8aa52f6937bfd2c995e518c6729c84033fe8e5')
b2sums=('566df715afe4fa76bae869db333a8a5f3bfe21effa25ed2fb7878d7317614b7788cbc6e3482a11da8be8c306597719dfc5473ed1c6cfaa57bed0600633b8b5ad'
        'f8291a2cfce1adcd1ca4d4b861967d7c6d22b7a5828978d91bc26c4d0a53268bcebb93601b23e550339a8a05dbc3cc4943fab5e8d138e268a078fb691e92f895')

prepare() {
  cd "$pkgname"

  # this really is completely unnecessary
  patch -p1 -i "$srcdir/no-llm-crap.patch"
}

build() {
  cd "$pkgname"

  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

  python -m build --wheel --no-isolation

  # NOTE: install to tmp dir for documentation and tests
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$(pwd)/test_dir/$site_packages:$PYTHONPATH" \
    sphinx-build -b man docs docs/_build/man
}

check() {
  local pytest_options=(
    -vv
    # tests try to find python2
    --deselect tests/unit/create/test_creator.py::test_py_pyc_missing[True-False]
    --deselect tests/unit/create/test_creator.py::test_py_pyc_missing[False-False]
    --deselect tests/unit/discovery/py_info/test_py_info.py::test_fallback_existent_system_executable
    --deselect tests/unit/test_util.py::test_reentrant_file_lock_is_thread_safe
    ## https://github.com/pypa/setuptools_scm/issues/1036
    --deselect tests/unit/create/via_global_ref/test_build_c_ext.py::test_can_build_c_extensions
    ## https://github.com/pypa/virtualenv/issues/2814
    --deselect tests/unit/activation/test_csh.py::test_csh[with_prompt]
    --deselect tests/unit/activation/test_csh.py::test_csh[no_prompt]
    # failures with 21.0.0
    --ignore tests/unit/create/test_creator.py
    #--deselect tests/unit/create/test_creator.py::test_create_no_seed[root-venv-copies-isolated]
    #--deselect tests/unit/create/test_creator.py::test_create_no_seed[root-venv-copies-global]
    # failures with 21.10.0
    --deselect tests/unit/test_wheel_age.py::test_generator_converges
    --deselect tests/unit/test_wheel_age.py::test_generator_updates_license
    # failures with 21.12.1
    --deselect tests/unit/test_sbom.py::test_sbom_spdx_declared_license[expression]
    --deselect tests/unit/test_sbom.py::test_sbom_spdx_declared_license[names]
    --deselect tests/unit/test_sbom.py::test_sbom_spdx_declared_license[undeclared]
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$pkgname"

  PYTHONPATH="$(pwd)/test_dir/$site_packages:$PYTHONPATH" \
    pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/virtualenv.1

  # sort out files with suffix of 3
  ln -s virtualenv.1.gz "${pkgdir}/usr/share/man/man1/virtualenv3.1.gz"
  ln "$pkgdir/usr/bin/virtualenv" "$pkgdir/usr/bin/virtualenv3"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
