# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-dogpile.cache
pkgver=1.2.1
pkgrel=1
pkgdesc="A caching front-end based on the Dogpile lock"
arch=('any')
url="https://pypi.python.org/pypi/dogpile.cache"
license=('BSD')
depends=('python-decorator' 'python-stevedore')
makedepends=('python-setuptools')
checkdepends=('memcached' 'pifpaf' 'redis' 'python-mako' 'python-redis' 'python-pytest'
              'python-pytest-cov' 'python-pylibmc')
source=("https://pypi.io/packages/source/d/dogpile.cache/dogpile.cache-$pkgver.tar.gz")
sha512sums=('407a0b5842b9ae4a8a82da933b4c7a4fec4391b877dcddb4f454c7fdf78ed0d2f6db16650c89c8047e1ec2eb6348c23bdcae99a0998aa2de58cfc00d92e2fa5a')

build() {
  cd dogpile.cache-$pkgver
  python setup.py build
}

check() {
  cd dogpile.cache-$pkgver
  python -m pytest -k 'not test_memcached_backend and not test_redis_backend'
  pifpaf --env-prefix DOGPILE run memcached --port 11234 -- python -m pytest tests/cache/test_memcached_backend.py
  pifpaf --env-prefix DOGPILE run redis --port 11234 -- python -m pytest tests/cache/test_redis_backend.py
}

package() {
  cd dogpile.cache-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
