# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Samuel Laurén <samuel.lauren@iki.fi>

pkgname=python-gssapi
pkgver=1.8.3
pkgrel=3
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
sha512sums=('63e6981977cb3f90c734a0f2089fc0628a86709f120814629b85576abe326f2602cfe4c351d7b3fc08cf3999e2b2f0091f829b1f1f9f1a784496bf39a781ddde')
b2sums=('a3238112f66b7cce61ec95e5da9fb65e2983b334111a398b1ac52d6c56141d2ed548be82242e4c3f83f562476b5193585842638041c08f720b0faabd9f9b0ca9')

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
  install -Dm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${pkgname#python-}-${pkgver}.dist-info/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: ts=2 sw=2 et:
