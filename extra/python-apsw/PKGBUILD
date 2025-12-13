# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.51.1.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
depends=('python' 'sqlite')
source=("git+https://github.com/rogerbinns/apsw.git#tag=${pkgver}")
sha512sums=('bf7abcae3810c82355ffa8e0915bbf098ffa0bd2565c2907c2c2e5a570993af3242b99dd75b1e4a9258e83d23322a998282995c0a08cf6b70feae63dbbf6445e')
b2sums=('364109b33882d02b187b51ab31305fd200ffbc4aa3df8573f66f4af7eda2a58a9c74d2f0849dcede2c0ec4b54c2fbbfa619addce292657516d72c7796aff474f')

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
