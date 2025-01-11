# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.47.1.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'sqlite')
source=("apsw-$pkgver.tar.gz::https://github.com/rogerbinns/apsw/archive/$pkgver.tar.gz")
sha512sums=('520434f89cf3ea317ed2cb9d1746f358d9da4cf136ffe3c8fbf19e27698f8a01ad3d56a90c758c5d7d77e7662fe44898d63f6b2f1c438861054d141dff12128f')
b2sums=('b40fe83b86ce618234876eb5fad4ae7558d9d360913b7eada60e7ddb2057882cca1c491d8f5893727186b9efe27217f160d0ddf49cda7e547f223fbe63092720')

build() {
  cd apsw-${pkgver}

  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/apsw-${pkgver}

  gcc ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -fPIC -shared -o testextension.sqlext src/testextension.c
  # do glob expansion in variable assignment
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover -vs apsw
}

package() {
  cd "$srcdir"/apsw-${pkgver}

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
