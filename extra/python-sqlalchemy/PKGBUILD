# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python-sqlalchemy
pkgver=1.4.52
pkgrel=3
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('python' 'python-greenlet')
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-runner' 'python-pytest-xdist')
source=("https://pypi.io/packages/source/S/SQLAlchemy/SQLAlchemy-$pkgver.tar.gz")
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('afda6a3503c9d2baba8c1dd9e7216d5ac1561f52f5f11009c41a1a98ac998643c980c60cf8ba4d84c4af8808be26ead9fd2e7a2c8bf15b2fdb521b4e5de7748e')

prepare() {
  cd SQLAlchemy-$pkgver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py
}

build() {
  cd SQLAlchemy-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd SQLAlchemy-$pkgver
  PYTHONPATH=build/lib pytest
}

package() {
  cd SQLAlchemy-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
