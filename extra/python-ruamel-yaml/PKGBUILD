# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

_pkg=ruamel.yaml
pkgname=python-${_pkg/./-}
pkgver=0.18.6
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('any')
url="https://sourceforge.net/projects/ruamel-yaml/"
license=('MIT')
depends=('python-ruamel.yaml.clib')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/r/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('47d0d19e85a9b498ebcd844f950ea8210d995b6b991d543be975b545162069b69773030df62300a11313ebc378795a23c39a983acd0b5ab4344d74e7aa7ded0a')

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkg}-${pkgver}
  # https://bitbucket.org/ruamel/yaml/issues/114/setuppy-requirement-for-pip-prevents
  RUAMEL_NO_PIP_INSTALL_CHECK=1 python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
