# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: googol <googol@posteo.de>
# Contributor: Oliver Mangold <o.mangold at gmail dot com>

pkgname=python-alembic
pkgver=1.19.1
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
sha512sums=('3b314e315cecccd26d460f9251fb77132faa95eb1b5659709371e8b95e4cef4c5b0f00b93c222cc68b2dffabf3b26980b9f68d06a20c64e6d2e0fb86929331e5')
b2sums=('a83a0e965a55dea8449d1d3d00e92552317544c24d788732042d2d9abf7b05153416f341e38eb0a02d5336344213c04ca876400520d60f5d040cc9ecda18093d')

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
