# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.43.0.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'sqlite')
source=("apsw-$pkgver.tar.gz::https://github.com/rogerbinns/apsw/archive/$pkgver.tar.gz")
sha512sums=('013ef8a45b556498192673c77d8de50136680d061087a80d7ce880137f1ca469812e9237b7336fbb8aacd8d3a775e819a42dc5e70e2d907cf6fea56b80534755')
b2sums=('ce74eaed990cdf4742ce39743abf0dc112ee3f588bfa0ccca102829d4e29fd38194ac42a85dee25e18f666bdbb2137c99440583996513ea27977374de945ffd7')

build() {
  cd apsw-${pkgver}

  python setup.py build --enable=load_extension
}

check() {
  cd "$srcdir"/apsw-${pkgver}

  gcc ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -fPIC -shared -o testextension.sqlext src/testextension.c
  # do glob expansion in variable assignment
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover -vs .
}

package() {
  cd "$srcdir"/apsw-${pkgver}

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
