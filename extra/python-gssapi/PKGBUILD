# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Samuel Laurén <samuel.lauren@iki.fi>

pkgname=python-gssapi
pkgver=1.9.0
pkgrel=2
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
sha512sums=('d5917f5ff99f59778dd873623aceddd179fa0ff736fc7daea09f30e157e4a5cc23dc9fe050f410f08914f3f84e024651f829587d01ed26059763fdde04d09b5a')
b2sums=('79f03ecd992d45f508ee04e6005ab520ecd85c8b6305af74ca5c2d6ef1ba511bf2acb336a8f92e1f2ac1aab1788c5262e6b07ebef1d241999a7438b0ab3e2cb6')

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
