# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=python-sqlalchemy
_name="${pkgname#python-}"
pkgver=2.0.35
_ver="rel_${pkgver//./_}"
pkgrel=1
arch=('x86_64')
url="https://www.sqlalchemy.org/"
license=('MIT')
pkgdesc='Python SQL toolkit and Object Relational Mapper'
depends=('glibc' 'python' 'python-greenlet' 'python-typing_extensions')  # HACK: typing_extensions is not required but upstream unconditionally imports it
optdepends=('python-psycopg2: connect to PostgreSQL database')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'cython')
checkdepends=('python-pytest' 'python-pytest-xdist' 'mypy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sqlalchemy/sqlalchemy/archive/refs/tags/${_ver}.tar.gz")
# https://github.com/sqlalchemy/sqlalchemy/discussions/11138
#validpgpkeys=('83AF7ACE251C13E6BB7DEFBD330239C1C4DAFEE1')
sha512sums=('dc60beb7789f69487647f138aa48e625f0167a2daf00078289365fc402d38587728bb282c63e60cebacb1960c85cd9d97406551ab108c6d45e1c541529607663')

prepare() {
  cd $_name-$_ver
  sed -i '/warnings.filterwarnings("error", category=DeprecationWarning)/a \    warnings.filterwarnings("ignore", category=DeprecationWarning, message="Creating a LegacyVersion has been deprecated and will be removed in the next major release")' \
      lib/sqlalchemy/testing/warnings.py
}

build() {
  cd $_name-$_ver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$_ver
  PYTHONPATH=build/lib pytest
}

package() {
  cd $_name-$_ver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 ft=sh et:
