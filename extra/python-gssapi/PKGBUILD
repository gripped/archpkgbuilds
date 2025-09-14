# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Samuel Laurén <samuel.lauren@iki.fi>

pkgname=python-gssapi
pkgver=1.10.0
pkgrel=1
pkgdesc='Provides both low-level and high level wrappers around the GSSAPI C libraries'
url='https://github.com/pythongssapi/python-gssapi'
arch=('x86_64')
license=('ISC')
depends=(
  'glibc'
  'krb5'
  'python'
  'python-decorator'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-k5test'
  'python-parameterized'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6d4e400c675d441c9f5f203e7883a31ecc6bdc004743eb8fb437f55e6fb93be55c197dc2af6b85b515cb8458e6ba5f7af090659a8df7e336e9256a2dc8fa0a56')
b2sums=('c5c1e6b0972e0ea92ee6a98a7f1ea5833da125117c5c4ebba7c3123623679fe391d03e54bfdda559db2bab2e551a4644eddf108d142791f6097030341ce5b165')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m unittest discover -vs "${PWD}/tmp_install/${site_packages}"
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.txt
  install -vDm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}

# vim: ts=2 sw=2 et:
