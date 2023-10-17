# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Samuel Littley <aur@toastwaffle.com>
# Contributor: rnons <remotenonsense at gmail dot com>

_pkg=ruamel.yaml
pkgname=python-${_pkg/./-}
pkgver=0.17.33
pkgrel=1
pkgdesc="YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order"
arch=('any')
url="https://sourceforge.net/projects/ruamel-yaml/"
license=('MIT')
depends=('python-ruamel.yaml.clib')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/r/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha512sums=('47dcfa356a7cdd67d27ef51909be1021f26fa389935ec2e4b5d931a1765280d47f43803460fb2ff242aa3f21591a45d8c95339b8f4f4790c6f51273232e77abc')

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
