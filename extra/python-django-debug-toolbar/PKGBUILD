# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Anthony25 <Anthony Ruhier>
# Contributor Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>

_name=django-debug-toolbar
pkgname=python-django-debug-toolbar
pkgver=5.0.1
pkgrel=1
pkgdesc='A configurable set of panels that display various debug information about the current request/response.'
arch=(any)
url='https://github.com/jazzband/django-debug-toolbar'
license=(BSD)
makedepends=(python-build python-installer python-wheel python-hatchling)
checkdepends=(python-jinja python-html5lib)
depends=(python-django python-sqlparse)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/jazzband/${_name}/archive/${pkgver}.tar.gz)
sha256sums=('f8085c5f8cb13bed714de538f3126b312ea57f14398ada6fcdf3f012dd4e777d')

prepare() {
  cd "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  # Doesn't work due to warnings
  #PYTHONPATH=. DB_BACKEND=sqlite3 DB_NAME=":memory:" DJANGO_SETTINGS_MODULE=tests.settings python -m django test tests
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
