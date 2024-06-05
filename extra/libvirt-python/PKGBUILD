# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=('libvirt-python')
epoch=1
pkgver=10.4.0
pkgrel=1
pkgdesc="libvirt python binding"
arch=('x86_64')
url="https://pypi.python.org/pypi/libvirt-python"
license=('LGPL-2.1-or-later')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libvirt')
depends=('python' 'libvirt')
options=('emptydirs')
source=("https://libvirt.org/sources/python/libvirt-python-${pkgver}.tar.gz"{,.asc})
sha512sums=('2dfd6fad726414751f884a8330d13749aef5f305b48b9658d7120538c8f74f09c14750e195d6343dce9afca837ac2f7d2e830564c04a5a79eb52bad83cf44b71'
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
