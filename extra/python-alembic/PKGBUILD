# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: googol <googol@posteo.de>
# Contributor: Oliver Mangold <o.mangold at gmail dot com>

pkgname=python-alembic
pkgver=1.18.5
pkgrel=1
pkgdesc='Lightweight database migration tool for usage with SQLAlchemy'
url='https://github.com/sqlalchemy/alembic'
arch=(any)
license=(MIT)
depends=(
  python
  python-mako
  python-sqlalchemy
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-black
  python-pytest
)
source=(
  git+https://github.com/sqlalchemy/alembic.git#tag=rel_${pkgver//./_}
)
sha512sums=('3317fb7782116a4d454e25bb32dc841000614a81d59620d99000fcfce6875056fb9448c6e1b725e1b43115a3b47284d43437b4d72d9d649d1c294da325dfa5f1')
b2sums=('f52340d846ada8f9a2986bb6985ea122871d5f77d4d46cfe494a4814b5f893ef248bca8ae74976c8a2a2bdbc310af2dab6282b71e5e2e056db76ff816fdc203f')

build() {
  cd alembic
  python -m build --wheel --no-isolation
}

check() {
  cd alembic
  pytest -vv
}

package() {
  cd alembic
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst CHANGES -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
