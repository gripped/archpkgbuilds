# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>

_origname=reportlab
pkgname=python-reportlab
pkgver=5.0.0
pkgrel=1
pkgdesc="A proven industry-strength PDF generating solution"
arch=('any')
url="https://www.reportlab.com/"
depends=('python' 'python-charset-normalizer' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('BSD-3-Clause')
source=(https://files.pythonhosted.org/packages/source/${_origname::1}/${_origname}/${_origname}-${pkgver}.tar.gz)
sha256sums=('e4494a0c6623ae213bb856fba523171b2b54a7bf629fda02d5e525a7b899a784')

build() {
    cd ${_origname}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
    cd ${_origname}-${pkgver}/tests
    python runAll.py
}

package() {
    cd ${_origname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
