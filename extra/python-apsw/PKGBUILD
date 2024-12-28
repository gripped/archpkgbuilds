# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.46.1.0
pkgrel=2
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'sqlite')
source=("apsw-$pkgver.tar.gz::https://github.com/rogerbinns/apsw/archive/$pkgver.tar.gz")
sha512sums=('3cd81ceab03dadf10d9c10d645d33b962ba9ec55075bb193eb076f458dde11d5c5c6ec087ec31fc96d011ca1b339a9ffe07cb5d660b8205f6f156baaa0b18c81')
b2sums=('c0ad61e61a97471ef677ffe80f3f91e6520c95f8cece225a8086884f34de497714892e4ce0ca375f2ec66f48b8ecb4d38dd5ebdb57cd94050ef5eaee20d5d3ee')

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
