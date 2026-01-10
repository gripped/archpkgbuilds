# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python-logbook
pkgver=1.8.1
pkgrel=2
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('valkey' 'python-pytest' 'python-sqlalchemy' 'python-redis' 'python-pyzmq'
              'python-execnet' 'python-jinja' 'python-brotli' 'pifpaf')
source=("git+https://github.com/mitsuhiko/logbook.git#tag=$pkgver")
sha512sums=('a3f45347d4f228d019f7bc8077524e1ab20eb83165be5ee4ce655e2ccfbe50331fad235175124d1993212e00c6f8620cb8d8dba9adac6d5b2e25fa27e0f183b8')

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
