# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Brendan MacDonell <macdonellba at gmail dot com>
# Contributor: Linmiao Xu <linmiao.xu@gmail.com>
# Contributor: Juan Miguel Cejuela <juanmi@jmcejuela.net>

pkgname=python-apsw
pkgver=3.51.0.0
pkgrel=1
pkgdesc="Python wrapper for SQLite"
arch=('x86_64')
url="https://github.com/rogerbinns/apsw"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
depends=('python' 'sqlite')
source=("git+https://github.com/rogerbinns/apsw.git#tag=${pkgver}")
sha512sums=('beff94be9bad3091340c5d26eb3676291c5826e157712d4ae763e266e57c4a6b918617f4f4558ec8f482bea2ca4b1bda19d9ad24033703604aee5cc1deec99f0')
b2sums=('1008b7525478d4b4b51be530adb5cf600216e50e0d011435db298241a9d3350341c78aa17e7e14a407350ceabbb74e4b6095331bb16190b11122e4953a6bd3d2')

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
