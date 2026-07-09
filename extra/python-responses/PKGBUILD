# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-responses
pkgver=0.26.2
pkgrel=1
pkgdesc='A utility library for mocking out the `requests` Python library'
arch=(any)
url='https://github.com/getsentry/responses'
license=(Apache-2.0)
depends=(
  python
  python-requests
  python-urllib3
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-tomli-w
)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('d387839d3450bc772940fa05d0e5212404e327e56fa7cb6d25d350d6943b13dc7e9c46ebfba49692f7dbf84f8406781b5856286ea5009370da41ccb284c53bfa')
b2sums=('e3a04d42b7cb265dd808c40962f097b106d2d5b99b471f26ca138b807b9d04ba8040f7853ebe6ccfd507a81f612329c5987bf8fa808cd5fb501be02390df2e7f')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
