# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-tldextract
pkgver=5.3.1
pkgrel=2
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=(any)
url='https://github.com/john-kurkowski/tldextract'
license=(BSD-3-Clause)
depends=(
  python
  python-idna
  python-requests
  python-requests-file
  python-filelock
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-responses
  python-isort
  python-syrupy
)
source=("$pkgname::git+https://github.com/john-kurkowski/tldextract.git#tag=$pkgver")
sha512sums=('82d54bd13ac85cdc70db01f92fec2a27991d4391250e7a570eee35642a0a8229d5cb315a9aa5a55dbeb448da283f56e915f7dd56e998c0a9433b4c437d42a6da')
b2sums=('a08e7615c207dfbace5dc307198ab52ccbcd481e01114231692c31e1ae405c1ddc1568d4501aaf49c996a5defb0c45a4ec08a9fc4ce64d6765b339b5490229a6')

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

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set sw=2 et:
