# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-google-auth
pkgver=2.22.0
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
sha512sums=('9a88c89e876a7d186cc609282bb4c68e59bb4222b0d7e007f5b386aebf78e6a7760b4e076394af4647d3efc3da8a1f834594cc8664763fc880899f98736ca744')

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
