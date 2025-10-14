# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=20.35.3
pkgrel=1
pkgdesc='Virtual Python Environment builder'
arch=('any')
url='https://virtualenv.pypa.io'
license=('MIT')
depends=(
  'python'
  'python-distlib'
  'python-filelock'
  'python-platformdirs'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-hatch-vcs'
  'python-sphinx'
  'python-sphinx-argparse'
  'python-sphinxcontrib-towncrier'
  'python-wheel'
  'towncrier'
)
checkdepends=(
  'fish'
  'python-flaky'
  'python-pip'
  'python-pytest'
  'python-pytest-freezer'
  'python-pytest-mock'
  'python-time-machine'
  'python-setuptools'
  'tcsh'
  'xonsh'
)
replaces=('virtualenv')
conflicts=('virtualenv')
options=('!makeflags')
source=("$pkgname::git+https://github.com/pypa/virtualenv#tag=$pkgver")
sha512sums=('5a97c41fe00f2b85bfa550829279929701a9ab6b2897b7a3203261beb7854fd6d00303aadcda418502046f80e10998eef2f4aa318e9d73fabf5f8264a91d806f')
b2sums=('1fc4a02dee1456cdbe446c3273ca127df9f265ccb7b05ea2ea987fcf7924006caf9e2d32b653e9d8ab08bd7b4e970e22c962a464029331e545181af330ff9106')

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

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
