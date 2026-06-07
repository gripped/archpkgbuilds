# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.53.2.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
depends=('python' 'sqlite')
source=("git+https://github.com/rogerbinns/apsw.git#tag=${pkgver}")
sha512sums=('d3951fa648e7df915016282f557e4db896dc43bab6d2c3d2a513841f79874b5d4c17fc707a443cc6929e93254425377537f16ea20db53e2d57e5737e78d9e8c8')
b2sums=('198a4b3746f6bcbc2bfc7392264746705674562f8518281cb3523051e8c891d25b3d0040dcf4ba24a0358d48c8a828a9320937d26bd8e445bc77e61d600ca469')

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
