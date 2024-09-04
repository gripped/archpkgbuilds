# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname=('libvirt-python')
epoch=1
pkgver=10.7.0
pkgrel=1
pkgdesc="libvirt python binding"
arch=('x86_64')
url="https://pypi.python.org/pypi/libvirt-python"
license=('LGPL-2.1-or-later')
makedepends=('python' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'libvirt')
depends=('python' 'libvirt')
options=('emptydirs')
source=("https://libvirt.org/sources/python/libvirt-python-${pkgver}.tar.gz"{,.asc})
sha512sums=('fa89abccae1cc8441d874d4878ac5d4f0bd0a7ccc922d4ec9a97b109855c76773713f16e2d68593e0d15f6b9776386ed10106513114af974ae7113f7d89db2ab'
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
