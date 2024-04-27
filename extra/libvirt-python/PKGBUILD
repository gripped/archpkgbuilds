# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=('libvirt-python')
epoch=1
pkgver=10.2.0
pkgrel=2
pkgdesc="libvirt python binding"
arch=('x86_64')
url="https://pypi.python.org/pypi/libvirt-python"
license=('LGPL-2.1-or-later')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libvirt')
depends=('python' 'libvirt')
options=('emptydirs')
source=("https://libvirt.org/sources/python/libvirt-python-${pkgver}.tar.gz"{,.asc})
sha512sums=('36c79491a9be24fc118cbaddcd96c02c7df05c3808cd8f7dbc2d143330aa8f4a6cf8ea90fc1901dcb43d9c2b52edd1a013d01b88a82b1d3ec6a2ab88b671ac61'
            'SKIP')
validpgpkeys=('453B65310595562855471199CA68BE8010084C9C') # Jiří Denemark <jdenemar@redhat.com>

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
