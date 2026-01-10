# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=2.4.0
pkgrel=6
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-betamax' 'python-pytest' 'python-urllib3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/praw-dev/prawcore/archive/v$pkgver.tar.gz")
sha512sums=('6b7464e80d612de9e9cf118fa21abcca61d160150a422175353895efe89757a3e4d417122af2956c0b5aebc59de855866ea4db6af5162c8ad9ec66971edab80c')

build() {
  cd prawcore-$pkgver
  python -m build -nw
}

check() {
  cd prawcore-$pkgver
  # Deselect tests failing with urllib3 >= 2, throwing the following
  # exception:
  #   requests.exceptions.ChunkedEncodingError: (
  #     'Connection broken: IncompleteRead(86 bytes read, 30 more expected)',
  #     IncompleteRead(86 bytes read, 30 more expected)
  #   )
  # I think these tests calls the real Reddit API with bogus credentials and
  # they now fail because urllib3 >= 2 handles chunked responses differently.
  pytest \
    --deselect tests/integration/test_sessions.py::TestSession::test_request__patch \
    --deselect tests/integration/test_authorizer.py::TestAuthorizer::test_revoke__access_token_with_refresh_set \
    --deselect tests/integration/test_authorizer.py::TestAuthorizer::test_revoke__access_token_without_refresh_set \
    --deselect tests/integration/test_authorizer.py::TestAuthorizer::test_revoke__refresh_token_with_access_set \
    --deselect tests/integration/test_authorizer.py::TestScriptAuthorizer::test_refresh__with_scopes
}

package() {
  cd prawcore-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
