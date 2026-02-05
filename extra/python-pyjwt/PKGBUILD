# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyjwt
pkgver=2.11.0
pkgrel=1
pkgdesc='JSON Web Token implementation in Python'
arch=(any)
url=https://github.com/jpadilla/pyjwt
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-cryptography
  python-pytest
)
_tag=697344d25990641b8b2aa85f0a60634b590b5702
source=(git+https://github.com/jpadilla/pyjwt.git#tag=${_tag})
b2sums=('d0b25927c600a018eaac1effb36bc74396b28387f739886c850b9611db54b68d83eb2f1ec0d06cb74b8ea3493892c047a5faa9a5210e4a4787f3004714410090')

pkgver() {
  cd pyjwt
  git describe --tags
}

build() {
  cd pyjwt
  python -m build -wn
}

check() {
  cd pyjwt

  python -m installer -d test_dir dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
  python -m installer -d "${pkgdir}" pyjwt/dist/*.whl
  install -Dm 644 pyjwt/LICENSE -t "${pkgdir}"/usr/share/licenses/python-pyjwt/
}

# vim: ts=2 sw=2 et:
