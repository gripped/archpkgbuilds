# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>

pkgname=memray
pkgver=1.19.3
pkgrel=1
pkgdesc="A memory profiler for Python"
arch=('x86_64')
url="https://github.com/bloomberg/memray"
license=('Apache-2.0')
depends=('python' 'libunwind' 'python-rich' 'python-jinja' 'lz4' 'ipython' 'python-textual')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'cython' 'npm' 'python-pkgconfig')
checkdepends=('npm' 'python-pytest' 'python-pytest-textual-snapshot')
source=("git+$url.git#tag=v${pkgver}?signed")
sha512sums=('819fde4aa94b1dcf0c48fc804042a83695834423d37d3219306d5d9b1f49c956d68f1a6ee945d134af7f17fd6103485934c7ba018b2ec055ab09976fa7ae3c11')
validpgpkeys=('A035C8C19219BA821ECEA86B64E628F8D684696D'   # Pablo Galindo Salgado <pablogsal@gmail.com>
              'F8C887A85001AA63AAE944BC8AB9921EA97C9108')  # Matt Wozniski <godlygeek@gmail.com>

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
    tests
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
