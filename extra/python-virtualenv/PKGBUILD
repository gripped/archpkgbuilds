# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Daniele Paolella <dp@mcrservice.it>

pkgname=python-virtualenv
pkgver=21.14.6
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
sha512sums=('de5c3b493bec2b168c8742c0229473808ab9fb76ae30bcaedb2b72c3460a839ad791b139abf11a46504c8fa1e8cc63d5c24dc0114599a6c7d5a8ece5df733c98'
            '095790a6b2ae899cf0ec04dc5cab807320d3f66c34077ded273a284880e9e50032d62c3944712fe8ae5a67a7d62920490663b632edbb9aec5eb53d61b609ccd3')
b2sums=('6b6cbbbc191808676d1c13e71714e08eabb8e3f58082fabda59d96bdea4e41bd1fdd6ab3655b9fb910c5612c59ea294c41000ade4cb49a48ad935f99378f8d70'
        'b44b271bf9dc341624ba5cfae16d01fd4ed3893e0003cb85e477d43fc0f4ee11214bf2c9d5147391d14febf7328e1811883cc9eb398517a43cd604fb96e2c2eb')

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
