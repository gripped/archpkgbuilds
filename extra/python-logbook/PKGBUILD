# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tomas Schertel<tschertel@gmail.com>

pkgname=python-logbook
pkgver=1.8.0
pkgrel=3
pkgdesc="Logging sytem for Python that replaces the standard library’s logging module"
arch=('x86_64')
url="https://logbook.readthedocs.io/en/stable/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('valkey' 'python-pytest' 'python-sqlalchemy'
              'python-redis' 'python-pyzmq'
              'python-execnet' 'python-jinja' 'python-brotli' 
              'pifpaf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mitsuhiko/logbook/archive/$pkgver.tar.gz")
sha512sums=('73e4d9170af6c4db6eadf27e84419927136658c786b173e5eae91dc9499d3c374fe5a4a7e8f7bc463194b19648aee23aceba0cce9a63fd25a6ee0a53b1dbe8f9')

prepare() {
  cd "$srcdir"/logbook-$pkgver
  python -m build --wheel --no-isolation
}

build() {
  cd "$srcdir"/logbook-$pkgver
}

check() {
  cd "$srcdir"/logbook-$pkgver
  LC_CTYPE=en_US.UTF-8 PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=src pifpaf run redis py.test tests
}

package() {
  cd logbook-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm664 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
