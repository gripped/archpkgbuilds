# Maintainer: Jelle van der Waa <jelle@archlinux.org
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Husam Bilal <husam212 AT gmail DOT com>

_name=sqlalchemy-utils
pkgname=python-sqlalchemy-utils
pkgver=0.42.1
pkgrel=1
epoch=1
pkgdesc='Various utility functions, new data types and helpers for SQLAlchemy'
url='https://github.com/kvesteri/sqlalchemy-utils'
depends=('python' 'python-sqlalchemy' 'python-babel' 'python-arrow'
         'python-intervals' 'python-phonenumbers' 'python-passlib' 'python-colour'
         'python-dateutil' 'python-furl' 'python-cryptography' 'python-pendulum')
checkdepends=('python-pytest' 'python-flexmock' 'python-jinja')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
license=('BSD')
arch=('any')
source=(https://github.com/kvesteri/sqlalchemy-utils/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('26c7e0287c5dd3d7c74fd764caa9d7e2afed2f03f2efec7cc22bed34997b764fbd03c92a82d14e627593eaf5457a8849f5f2e0e7df59a84d40f20e7597f182f5')
b2sums=('6c589f64a3ab61dd02a823baf55e497455128b21725631586699a0284b6e9b0735986b9cfac3282c53de14242a214489d48c589fd47d3d35c865bd9309d1fd20')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_name}-${pkgver}
  # Tests require a postgres and MySQL db
  export PYTHONWARNINGS="ignore"
  pytest -Wignore --disable-pytest-warnings tests/test_models.py
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
