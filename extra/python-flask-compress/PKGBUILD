# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=python-flask-compress
pkgver=1.18
pkgrel=1
pkgdesc='Compress responses in your Flask app'
url='https://github.com/colour-science/flask-compress'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-brotli'
  'python-flask'
  'python-pyzstd'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'python-flask-caching'
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b37ff382043da7cdfb64cbf3b0c2de8652e5dce2245a3283d0bb0b9368dd2002')
sha512sums=('290426bf94c24963d7022191f35486fbe43dcc5550585b75e624019141ae0e5944fb9928315ede3ae1843c0beeef917f982c53f75e73f40046a24df0bcf691a8')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

# vim: ts=2 sw=2 et:
