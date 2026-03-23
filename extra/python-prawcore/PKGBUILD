# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=3.0.0
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-betamax' 'python-pytest' 'python-urllib3')
source=("git+https://github.com/praw-dev/prawcore.git#tag=v$pkgver")
sha512sums=('4bd9838718c3cbed857fb32782439242050d4dd2c6d068f6620ac7e60493818ddc852fc9635c6f03363552cd35527db055763df0dfd8e0ccb1067d4a7bc4955e')

build() {
  cd prawcore
  python -m build -nw
}

check() {
  cd prawcore
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
  cd prawcore
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
