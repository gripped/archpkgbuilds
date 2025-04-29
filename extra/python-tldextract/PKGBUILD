# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tldextract
pkgver=5.3.0
pkgrel=1
pkgdesc="Accurately separate the TLD from the registered domain and subdomains of a URL, using the Public Suffix List"
arch=('any')
url="https://github.com/john-kurkowski/tldextract"
license=('BSD-3-Clause')
depends=('python-idna' 'python-requests' 'python-requests-file' 'python-filelock')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-responses'
              'python-isort' 'python-syrupy')
source=("git+https://github.com/john-kurkowski/tldextract.git#tag=$pkgver")
sha512sums=('7e60bbd43e9d8f5c7973dcab99676545a0a219ae58b7eb01ee6bdd739fb9b159cf2d099b834c6e06ab003dfe637ee1392e9f12ab72981f447983d77ed645ba62')

build() {
  cd tldextract
  python -m build -nw
}

check() {
  cd tldextract
  python -m pytest
}

package() {
  cd tldextract
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set sw=2 et:
