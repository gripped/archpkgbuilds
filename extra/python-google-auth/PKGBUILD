# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth
pkgver=2.20.0
pkgrel=1
pkgdesc="Google Authentication Library"
url="https://github.com/GoogleCloudPlatform/google-auth-library-python"
license=('Apache')
arch=('any')
depends=('python-cachetools' 'python-pyasn1-modules' 'python-rsa' 'python-six' 'python-urllib3'
         'python-certifi')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-mock' 'python-requests' 'python-flask'
              'python-oauth2client' 'python-pytest-localserver' 'python-cryptography'
              'python-freezegun' 'python-responses' 'python-pyopenssl' 'python-pyu2f')
source=("https://github.com/GoogleCloudPlatform/google-auth-library-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('08fcfad112a149732966c669379ba3ef37ae580412eec062b5a5c5ab5bd9e5c4360b7db515846b24bfaec349f46cc118cc003252ae14428368af86c3e4f0c128')

prepare() {
  cd google-auth-library-python-$pkgver
  sed -i 's/from requests.packages.urllib3.util.ssl_ import/from urllib3.util.ssl_ import/' google/auth/transport/requests.py
}

build() {
  cd google-auth-library-python-$pkgver
  python setup.py build
}

check() {
  cd google-auth-library-python-$pkgver
  python -m pytest tests
}

package() {
  cd google-auth-library-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
