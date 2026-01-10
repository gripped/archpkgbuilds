# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=memray
pkgver=1.19.1
pkgrel=2
pkgdesc="A memory profiler for Python"
arch=('x86_64')
url="https://github.com/bloomberg/memray"
license=('Apache-2.0')
depends=('python' 'libunwind' 'python-rich' 'python-jinja' 'lz4' 'ipython' 'python-textual')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython' 'npm' 'python-pkgconfig')
checkdepends=('npm' 'python-pytest' 'python-pytest-textual-snapshot')
source=("git+$url.git#tag=v${pkgver}?signed")
sha512sums=('09af79ec326249fa0f163d110300b08fb08d57782703ccbc570bf81d473021f8f48c32ea1cfcc39e50b20b5f3cbe3b16ea31874d77e343ba85f99bd8db44c40b')
validpgpkeys=('A035C8C19219BA821ECEA86B64E628F8D684696D') # Pablo Galindo Salgado <pablogsal@gmail.com>

build() {
  cd "${pkgname}"

  export DIST_NAME='Arch Linux'
  export DIST_PACKAGE="$pkgver-$pkgrel"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  export CFLAGS+=" -ffat-lto-objects"
  export CXXFLAGS+=" -ffat-lto-objects"

  make build
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vvv \
    --log-cli-level=info -s \
    --deselect 'tests/integration/test_greenlet.py::test_integration_with_greenlet' \
    --deselect 'tests/integration/test_greenlet.py::test_importing_greenlet_after_tracking_starts' \
    --deselect 'tests/integration/test_greenlet.py::test_uninstall_profile_in_greenlet' \
    --deselect 'tests/unit/test_tree_reporter.py::TestTUILooks::test_basic_node_selected_not_leaf' \
    --deselect 'tests/unit/test_tree_reporter.py::TestTUILooks::test_basic_node_selected_leaf' \
    --deselect 'tests/unit/test_tree_reporter.py::TestTUILooks::test_two_chains_after_expanding_second' \
    --deselect 'tests/unit/test_tree_reporter.py::TestTUILooks::test_select_screen' \
    tests
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
