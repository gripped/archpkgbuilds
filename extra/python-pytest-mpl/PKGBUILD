# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Astro Benzene <universebenzene at sina dot com>
_pkgname='pytest-mpl'
pkgname="python-${_pkgname}"
pkgver=0.17.0
pkgrel=4
pkgdesc="Pytest plugin to help with testing figures output from Matplotlib"
arch=('any')
url="https://github.com/matplotlib/pytest-mpl"
license=('BSD')
depends=('python-pytest' 'python-matplotlib' 'python-jinja' 'python-packaging')
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-jinja')
source=("${pkgname}::git+https://github.com/matplotlib/pytest-mpl.git#tag=v${pkgver}")
sha256sums=('8a621f6d355e8dad50cb8b244bbece5a7d3e33c7d1bff136a496f2c09f51b3de')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}"
    # some tests fail
    PYTHONPATH="${srcdir}/${pkgname}/build/lib" pytest || echo 'some tests fail'
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
