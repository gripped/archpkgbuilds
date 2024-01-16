# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-maxminddb
pkgver=2.4.0
_testdatacommit=e3764a229ff98541884a3cd4bd7dc95f4ae5d466
pkgrel=1
pkgdesc="Reader for the MaxMind DB format"
url="https://github.com/maxmind/MaxMind-DB-Reader-python"
license=('Apache')
arch=('x86_64')
depends=('python' 'libmaxminddb')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/maxmind/MaxMind-DB-Reader-python/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        https://github.com/maxmind/MaxMind-DB/archive/$_testdatacommit.tar.gz)
sha512sums=('7176b861df489e78cfb48acd943070c3aa4f54a072c4ff446f8b1197b9156d82064d198753273e7c4dc24a05855eac5bad345e59d5bb78c31c42c7c40cebafc7'
            '618bef60b69492aecd06467428e36d7a10f2aa846e7afd507b6eac1f3a6ceceeb14ed95654b629c9d2638634a5184658236b644edccc99ae2d24e35d9d1f6db9')

prepare() {
  cd MaxMind-DB-Reader-python-$pkgver
  rmdir tests/data
  ln -s "$srcdir"/MaxMind-DB-$_testdatacommit tests/data
}

build() {
  cd MaxMind-DB-Reader-python-$pkgver
  python setup.py build
}

check() {
  cd MaxMind-DB-Reader-python-$pkgver
  PYTHONPATH="build/lib.linux-$CARCH-cpython-311" pytest
}

package() {
  cd MaxMind-DB-Reader-python-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
