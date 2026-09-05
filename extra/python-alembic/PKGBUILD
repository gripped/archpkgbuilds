# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: googol <googol@posteo.de>
# Contributor: Oliver Mangold <o.mangold at gmail dot com>

pkgname=python-alembic
pkgver=1.19.2
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
sha512sums=('09871d36b914cbc7e4a07ec79236b97f6df33377edf14ca14cea31f2616f7bc2c7bf84c4ac2ca366eef1e4f0f55761676a2c57611eb639f9e2372ceb4365f91f')
b2sums=('9641ff73bcae9aefdaeec037f0dc7918f79ebf5d43cd1e0adba961f60955bdaa4c599f237080f1592c360e48b3846e6397df0f29cc1508434f885bde2d4c4d36')

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
