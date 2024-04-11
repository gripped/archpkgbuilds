# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=hotdoc
pkgver=0.16
pkgrel=1
pkgdesc="the tastiest API documentation system"
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('LGPL')
_py_deps=('appdirs' 'dbus-deviation' 'faust-cchardet' 'lxml' 'networkx'
          'pkgconfig' 'schema' 'toposort' 'wheezy-template' 'yaml' 'feedgen')
depends=("${_py_deps[@]/#/python-}" 'json-glib')
makedepends=('python-setuptools' 'python-build' 'python-installer'
             'python-wheel' 'cmake')
optdepends=('clang: for the C extension'
            'llvm: for the C extension')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('af1856d54f9dd23e0538a7dc4423b69d29dd7f54a4fe6e34844606ab51a3eab3')
b2sums=('c6c068c88bb14a2a326242a3505dce8f601b36407bb71bc26c5d57035203661b5929fbffca6996dd3e45707503dc33819bae929c6b01f13ddc57e61d75a6bfdf')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}/build/lib.linux-${CARCH}-cpython-"*
    python -m unittest
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
