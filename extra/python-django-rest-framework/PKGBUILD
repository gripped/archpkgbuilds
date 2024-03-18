# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-rest-framework
_name="${pkgname#python-}"
pkgver=3.15.0
pkgrel=1
pkgdesc="A powerful and flexible toolkit for building Web APIs."
arch=(any)
url="https://www.django-rest-framework.org/"
_url="https://github.com/encode/django-rest-framework"
license=(BSD-3-Clause)
depends=(
  python
  python-django
  python-pytz
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-django
)
optdepends=(
  'python-django-filter: for dynamic queryset filters'
  'python-django-guardian: for a per-object permission model'
  'python-markdown: for markdown support'
  'python-psycopg2: for PostgreSQL support'
  'python-pygments: for syntax highlighting'
  'python-yaml: for YAML support'
)
source=($_name-$pkgver.tar.gz::$_url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('1b283fea0a94d64ea29bef59f18b5cb309627b7b927d80cdaad11d1fa9c4df2e2059d619ca5a73f382fa21bf847a266926542c1a1f5764bd6404d7c11861efab')
b2sums=('c6884185b8a11ca044956ec15bf3d31c3c46d8a911128f37ab305d89540a223e4b04ac4c13fc107333e9774ee048505f6cd0c66989f9f3cc9511239354572d25')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
