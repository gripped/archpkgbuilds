# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-filter
pkgname=python-django-filter
pkgver=26.1
pkgrel=1
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
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-26.1-drop-the-upper-limit-for-flit_core.patch
)
sha512sums=('f240fcbd4ffccdb85c2db2c42ac951eced96aa62489e80c7a00156e364c1f8691205e75113d67c2c18bd6310c682a3e5a4065fffa25140369466b37931ad0e05'
            '5b6712243d4902476c11ecaa32be97088d6401203fcc6c4389eea4ad1a2449796d7b51b92747d78bd911a4e1eb948a765fd3d321c6bbfdcd878fa9839ce4e370')
b2sums=('cc96a40ec72d2c1b632ab03be5d8e952572ed0901611198f2b84b99358ddc54e747c38c56384e1349f1cc9da81cd81d2639a819487c8c4ddf4b3ad402c6cba18'
        '922508bbc52e4e5b24f53bcdaa59d7e756992232d6bf377fd4672a99feebb75f61c3201584fe078dd78ac6f891cc3eacc919cb2bc212e34930081f5456aedc73')

prepare() {
  # Remove flit_core upper version constraint: https://github.com/carltongibson/django-filter/pull/1755
  patch -Np1 -d "$_name-$pkgver" -i ../$pkgname-26.1-drop-the-upper-limit-for-flit_core.patch
}

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
