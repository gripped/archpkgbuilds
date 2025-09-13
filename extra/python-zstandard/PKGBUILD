# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-zstandard')
_pkgname='zstandard'
pkgver=0.24.0
pkgrel=1
pkgdesc="Python bindings to the Zstandard (zstd) compression library"
url="https://github.com/indygreg/python-zstandard"
depends=(
  'glibc'
  'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-hypothesis'
)
optdepends=(
    'python-cffi'
)
license=('BSD-3-Clause')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/indygreg/python-zstandard/archive/$pkgver.tar.gz")
sha256sums=('cc63af195abef8c57e8eba154e2d3c642d41da50063c3e83080b64798b7f25f5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # pyproject.toml currently requires `setuptools<69.0.0` for CI reasons
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    python -m unittest discover -vs .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
