# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bruno Parmentier <dev@brunoparmentier.be>

pkgname=python-pyscard
_pyname=pyscard
pkgver=2.3.0
pkgrel=1
pkgdesc='Framework for building smart card aware applications in Python'
arch=('x86_64')
url='https://pyscard.sourceforge.io/'
license=('LGPL')
depends=('python' 'pcsclite')
makedepends=('swig' 'python-setuptools')
validpgpkeys=('535E3696356979F4932CB7443F4A8A8FE07F1CF9'  # Ludovic Rousseau <rousseau@debian.org>
              'F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <ludovic.rousseau@free.fr>
source=("https://downloads.sourceforge.net/project/pyscard/pyscard/pyscard%20${pkgver}/pyscard-${pkgver}.tar.gz"{,.asc})
sha256sums=('621928e217e3b1d3c791086bf0c9f307fc4ae004a9b1a430536acc1a6eb50003'
            'SKIP')

package() {
	cd "${srcdir}/${_pyname}-${pkgver}/"

	python setup.py build_ext install --root="${pkgdir}/" --optimize=1
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
