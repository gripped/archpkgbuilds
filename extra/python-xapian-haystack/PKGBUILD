# Maintainer: David Runge <dvzrv@archlinux.org>

_haystack_name=django-haystack
_django_haystack_pkgver=3.3.0
pkgname=python-xapian-haystack
_name="${pkgname#python-}"
pkgver=3.1.0
pkgrel=4
pkgdesc="Xapian backend for Django-Haystack"
arch=(any)
url="https://github.com/notanumber/xapian-haystack"
license=(GPL-2.0-only)
depends=(
  python
  python-django
  python-django-haystack
  python-filelock
  python-xapian
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  python-$_haystack_name-$_django_haystack_pkgver.tar.gz::https://github.com/django-haystack/django-haystack/archive/refs/tags/v$_django_haystack_pkgver.tar.gz
)
sha512sums=('dec3855ff28548dafd1f09ff7bd42f61b2392ff2eedac1d44090e186745c063991a8d2bd699778dde4ef1f21ccebcffab9aba0ac9197342048da3a20539cc467'
            'f8fb6fe11957391d4dc48f279c07e29b2063c7268a4585c4d2d0462f9b17d3563997a29bed4da5577b4125e70668aa79ce86a553cda71cb94c1af19b9bd808fe')
b2sums=('7a67058a8fa15222f5a9d3a251db3ea8f3866d0a4d6632382e1eef077a7105761d526d9035334d02c80557c8595ed60605d9b7c529726369150a7c79b36e519b'
        'd6193172f5baae90792a636f925f5d9eb6f886f362fcb36f4551dcf0e097fbb2ef58bd7a7bb8dc8401846df3eea4601566e58495f6ab8ce99b4498b8d9b55196')

prepare() {
  # disable tests broken with django 5
  sed -e 's/test_date_facets_month/off1/;s/test_date_facets_seconds/off2/' -i $_name-$pkgver/tests/xapian_tests/tests/test_backend.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # inserting xapian-haystack tests into django-haystack (because... pain)
  ln -sv "$PWD/build/lib/xapian_backend.py" ../$_haystack_name-$_django_haystack_pkgver/haystack/backends/
  cp -rv "$PWD/tests/"* ../$_haystack_name-$_django_haystack_pkgver/test_haystack/
  ln -svf "$PWD/tests/xapian_tests/__init__.py" ../$_haystack_name-$_django_haystack_pkgver/test_haystack/

  cd ../$_haystack_name-$_django_haystack_pkgver
  PYTHONPATH="$PWD:$PYTHONPATH" django-admin test test_haystack.xapian_tests --settings=test_haystack.xapian_settings
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
