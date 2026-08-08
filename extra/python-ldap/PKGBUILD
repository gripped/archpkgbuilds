# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=python-ldap
pkgver=3.4.7
pkgrel=1
pkgdesc="LDAP client API for Python"
url="https://python-ldap.readthedocs.io/"
arch=('x86_64')
license=('MIT')
depends=('python-pyasn1' 'python-pyasn1-modules' 'libldap')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('openldap' 'python-pyasn1' 'python-pyasn1-modules' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/python-ldap/python-ldap/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7eac2514a54a88420bc968e333e76a5df8c29eb4f666cea0047da1b88faaebec')

prepare() {
  cd "$pkgbase-$pkgbase-$pkgver"

  # slapd fails to start because -F points to a non-empty directory.
  # Simply don't pass both -f and -F to slapd, it is only done when
  # converting slapd.conf to LDIF and pointless here.
  sed -i "/'-F', self.testrundir,/d" Lib/slapdtest/_slapdtest.py
}

build(){
  cd "$pkgbase-$pkgbase-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$pkgbase-$pkgbase-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest . -W ignore::ResourceWarning
}

package() {
  cd "$pkgbase-$pkgbase-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
