# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: Chris Baker <baker.chris.3@gmail.com>

pkgname=python-nltk
pkgver=3.9.1
pkgrel=4
pkgdesc='Natural language processing in Python'
arch=('any')
url='https://www.nltk.org/'
license=('Apache-2.0')
depends=('python-yaml' 'python-click' 'python-regex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('nltk-data' 'python-requests' 'python-regex')
optdepends=('nltk-data: test data'
	    'python-numpy: used for calculations'
	    'python-matplotlib: used for plotting')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nltk/nltk/archive/$pkgver.tar.gz")
sha256sums=('03e06c8c13e352133962c4395ebe0696905c9f1fbdead2d19deae37ba48eb47c')

build() {
  cd nltk-$pkgver
  python -m build --wheel --no-isolation
}

# Need to fix the nltk-data split
#check(){
#  cd nltk-$pkgver
#  python ./nltk/test/runtests.py
#}

package() {
  cd nltk-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
