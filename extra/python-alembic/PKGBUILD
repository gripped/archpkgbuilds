# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: googol <googol@posteo.de>
# Contributor: Oliver Mangold <o.mangold at gmail dot com>

pkgname=python-alembic
pkgver=1.19.0
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
sha512sums=('79462318546d35b4bb63231310a68dd61c95ee8e312344c47de21c349d2fecf985585dd06b3543649cf0ec1f854729154c4f9bfb2ca37fb6d2f63ec2be181050')
b2sums=('a53da2b3dc13d4e178e6f59810f2e4c3de4280bef99fac907ab04f04624a55e713e6a7aeb2d546d4ecac7d62eb3a298ceb974f3f3067c2469bd63bb7e9aa412b')

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
