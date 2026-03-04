# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python-logbook
pkgver=1.8.2
pkgrel=1
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('valkey' 'python-pytest' 'python-sqlalchemy' 'python-redis' 'python-pyzmq'
              'python-execnet' 'python-jinja' 'python-brotli' 'pifpaf')
source=("git+https://github.com/mitsuhiko/logbook.git#tag=$pkgver")
sha512sums=('a0d457fc50b715ab1bdfb1822ab6c74bfaea33375236236a2a867f909be9c24f2008a596aaa582f4c1e6ca425794477f6ae120fab6e9aafb7e5c178fc46ae6d9')

prepare() {
  cd logbook
  python -m build --wheel --no-isolation
}

build() {
  cd logbook
}

check() {
  cd logbook
  LC_CTYPE=en_US.UTF-8 PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=src pifpaf run redis py.test tests
}

package() {
  cd logbook
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm664 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
