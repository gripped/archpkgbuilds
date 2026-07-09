# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.53.3.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
depends=('python' 'sqlite')
source=("git+https://github.com/rogerbinns/apsw.git#tag=${pkgver}")
sha512sums=('974156e3b23407bba7176aa9779d7e007c3ab47e97d03a2e554508f1729c57f9263c38aef30f3de8f6fa87b1ebf54d7fd50eefbc4f10216033d26febc56afbb2')
b2sums=('08097cb36b7bc2afae65bee685f08859bd568aa9b252cd936a876b302959585b13f39b4606284d7b7d371735d6b3f233af1703ed89b08b22629fe55458ebb616')

build() {
  cd apsw

  python -m build --wheel --no-isolation
}

check() {
  cd apsw

  gcc ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -fPIC -shared -o testextension.sqlext src/testextension.c
  # do glob expansion in variable assignment
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "build/lib.linux-$CARCH-cpython-${python_version}"
  python -m apsw.tests -v
}

package() {
  cd apsw

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
