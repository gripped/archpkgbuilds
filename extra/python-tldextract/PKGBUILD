# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tldextract
pkgver=5.2.0
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
sha512sums=('62593d423a321944c0db064b3d589bdab92d10d9cfdb767bdc94656890d2bbf57ff26ca06d0b742f7f27c9c80152a0e7ec76e169ec8d13d5ec6bf8662cb4445a')

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
