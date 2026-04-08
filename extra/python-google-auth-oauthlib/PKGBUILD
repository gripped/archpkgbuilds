# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_name=google-auth-oauthlib
pkgname=python-"${_name}"
pkgver=1.3.1
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
sha256sums=('b3a2d76a60a9b173fb9bc43fc51fb31204fb1b24cf1dfbbc84f62ca040d2f6d4')

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
