# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_name=google-auth-oauthlib
pkgname=python-"${_name}"
pkgver=1.4.0
pkgrel=1
pkgdesc="oauthlib integration for Google auth."
url="http://google-auth-oauthlib.readthedocs.io/en/latest/"
checkdepends=('python-click' 'python-cryptography' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-google-auth' 'python-requests-oauthlib')
optdepends=('python-click')
license=('Apache-2.0')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-python/archive/refs/tags/${_name}-v${pkgver}.tar.gz")
sha256sums=('2cc838fb4b6c9f084aa116fb1da9a9cef57004e820e6e61139144212ca16f4cc')

build() {
    cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
    python -m build --wheel --no-isolation
}

check() {
    cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"
    PYTHONPATH=. pytest
}

package() {
    cd "google-cloud-python-${_name}-v${pkgver}/packages/${_name}"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    # Remove conflicting files
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
}
