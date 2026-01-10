# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-filter
pkgname=python-django-filter
pkgver=25.2
pkgrel=2
pkgdesc="A generic system for filtering Django QuerySets based on user selections"
arch=(any)
url="https://github.com/carltongibson/django-filter"
license=(BSD-3-Clause)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-django-crispy-forms
  python-django-rest-framework
  python-pytest
)
optdepends=(
  'python-django-crispy-forms: for enhanced filter form presentation'
  'python-django-rest-framework: for filter integration using DRF'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('9bbe21af68e94974f554d1c72053bda75ae35c069b9df7066e5c8b091f90a44244cbc5340b7a8556b6a46c25d8fc26c11f2457f815378314c4bce7e8ece3765a')
b2sums=('1d4ac9aa7023c6049d4a42cb2bc3113b7b38ac1283ad957f3b66a815a7e519fcee30ed34d69973eb329fb95d5e7ecead1505623abefab9e28b87cda7972acd8d')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python runtests.py
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,{CHANGES,README}.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
