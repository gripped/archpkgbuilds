# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=21.4.3
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
source=("$pkgname::git+https://github.com/pypa/virtualenv#tag=$pkgver")
sha512sums=('aa53ae13e8b2d61acb48e0882be3902c37a4c1498db28d351baf98c833a9bf281217dbed9aaa75d9fd14aa845bd4f83bfcf3ac3d15f50d7bef6c90a6b4797472')
b2sums=('27ff3db3c9f714a790db38868d473a50024ce9ac7d604b2ae90e599805f10643f325a6995f496cbf906b0d754c351dd7506f3b740bffd1868e6c63d850134fe7')

build() {
  cd "$pkgname"

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
