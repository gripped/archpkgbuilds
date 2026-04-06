# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python-logbook
pkgver=1.9.2
pkgrel=1
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD-3-Clause')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-setuptools' 'python-setuptools-rust' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('valkey' 'python-pytest' 'python-sqlalchemy' 'python-redis' 'python-pyzmq'
              'python-execnet' 'python-jinja' 'python-brotli' 'pifpaf')
source=("git+https://github.com/mitsuhiko/logbook.git#tag=$pkgver")
sha512sums=('5755d241805216f1490863e4c618bbede7b4ffab837b6c0676b57134d4253417c34f2261d7d66847389eb8c4016c42d14f2e4ae469e8c41c74c05c71adc0bf34')

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
