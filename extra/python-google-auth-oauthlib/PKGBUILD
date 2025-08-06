# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-google-auth-oauthlib
pkgver=1.2.2
pkgrel=1
pkgdesc="oauthlib integration for Google auth."
url="http://google-auth-oauthlib.readthedocs.io/en/latest/"
checkdepends=('python-click' 'python-pytest')
makedepends=('python-setuptools')
depends=('python' 'python-google-auth' 'python-requests-oauthlib')
optdepends=('python-click')
license=('Apache')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-auth-library-python-oauthlib/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea495bc6d97714353ff53258ee3c497a4bc1c2f4c3c63eefb7f6ace30aa06851')

# check() {
#     cd "google-auth-library-python-oauthlib-${pkgver}"
#     pytest
# }

package() {
    cd "google-auth-library-python-oauthlib-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    # Remove conflicting files
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
}
