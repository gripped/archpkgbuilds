# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tldextract
pkgver=5.1.3
pkgrel=2
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
sha512sums=('f4e2fcdff1707d645d8ace07d739dc441807f238c815459172b09189e00ae892b56576e3117ef46422d5e5d3e5fdd68e604454ae6905cf89378246a0c0769696')

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
