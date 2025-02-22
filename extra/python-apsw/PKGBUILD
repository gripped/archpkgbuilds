# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.49.1.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
depends=('python' 'sqlite')
source=("git+https://github.com/rogerbinns/apsw.git#tag=${pkgver}")
sha512sums=('b44b242658323c0926f7d53aca89e6e60d44a802efc13d3058071ab94bba0ac87117d1faf6b6e670ebba5ea22553f8dec6ed7bba98c201afae0647227fa5c3f9')
b2sums=('9cda75195060595039719a35f101dd9e7186be40e67e143a7941d5ea9ea617c48ab954d8ed03ada60f1c95eb983714633310cca64b4b1eb36403b64c521d5a55')

build() {
  cd apsw

  python -m build --wheel --no-isolation
}

check() {
  cd apsw

  gcc ${CFLAGS} ${CPPFLAGS} ${LDFLAGS} -fPIC -shared -o testextension.sqlext src/testextension.c
  # do glob expansion in variable assignment
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" python -m unittest discover -vs apsw
}

package() {
  cd apsw

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
