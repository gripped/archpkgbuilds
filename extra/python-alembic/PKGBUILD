# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: googol <googol@posteo.de>
# Contributor: Oliver Mangold <o.mangold at gmail dot com>

pkgname=python-alembic
pkgver=1.20.1
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
sha512sums=('f7894ddd703c4839007b6a7d0c2d6622ec6e90a70b2b01b73de7d6ee9fb8912542467f60dc72174713397c28b949a4ecd17dc65b45476b947233ed21aa142bba')
b2sums=('3bbaabd2797c3a0626ec9c5b727690f88a7ecc3b50a62066170ff88925cf2ec22c201e232ff653b1f8e3221b588ca15c5cca6291238f2e072427e83bfa2c7093')

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
