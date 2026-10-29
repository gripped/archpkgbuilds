# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Bruno Parmentier <dev@brunoparmentier.be>

pkgname=python-pyscard
pkgver=2.3.2
pkgrel=1
pkgdesc='Framework for building smart card aware applications in Python'
arch=('x86_64')
url='https://pyscard.sourceforge.io/'
license=('LGPL')
depends=('python' 'pcsclite')
makedepends=('git' 'swig' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
validpgpkeys=('535E3696356979F4932CB7443F4A8A8FE07F1CF9'  # Ludovic Rousseau <rousseau@debian.org>
              'F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <ludovic.rousseau@free.fr>
source=("git+https://github.com/LudovicRousseau/pyscard.git?signed#tag=${pkgver}")
sha256sums=('e9d66c3db70edcaa3fefd77a15669d0cf943e40c288b812c419ffea1b1e4db94')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
