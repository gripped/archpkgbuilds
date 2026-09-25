# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyjwt
pkgver=2.15.0
pkgrel=1
pkgdesc='JSON Web Token implementation in Python'
arch=(any)
url=https://github.com/jpadilla/pyjwt
license=(MIT)
depends=(
  python
  python-cryptography
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
  python-cryptography
  python-pytest
)
source=(git+https://github.com/jpadilla/pyjwt.git#tag=${pkgver})
b2sums=('eb0964a2a8b75dc0619c38a2ca30d49edf1665e862f65d9edb3e22eb75414a926c466a37d8e2c1af6c36bf828b6fe35ad710d92ecb583cf6dbdbeb5f24c5f002')

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
