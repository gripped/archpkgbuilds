# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=memray
pkgver=1.18.0
pkgrel=1
pkgdesc="A memory profiler for Python"
arch=('x86_64')
url="https://github.com/bloomberg/memray"
license=('Apache-2.0')
depends=('python' 'libunwind' 'python-rich' 'python-jinja' 'lz4' 'ipython' 'python-textual')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython' 'npm' 'python-pkgconfig')
checkdepends=('npm' 'python-pytest' 'python-pytest-textual-snapshot')
source=("git+$url.git#tag=v${pkgver}?signed")
sha512sums=('3552ee6ad9f5e2a45c3cfa5da0ce7b1ec4ce9073038cc5573452e910740243013f61efa135736363850ea58213ba21f86e63403385c39f88c8e3673ffeedcd47')
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
  export PYTEST_ARGS="--ignore=tests/test_tui_reporter.py --ignore=tests/integration/test_attach.py"
  cd ${pkgname}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vvv \
    --log-cli-level=info -s \
    --ignore=tests/integration/test_greenlet.py \
    tests
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
