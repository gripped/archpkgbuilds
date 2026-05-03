# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname='libvirt-python'
epoch=1
pkgver=12.3.0
pkgrel=1
pkgdesc="libvirt python binding"
arch=('x86_64')
url="https://pypi.python.org/pypi/libvirt-python"
license=('LGPL-2.1-or-later')
makedepends=(
  git
  libvirt
  python
  python-setuptools
  python-build
  python-installer
  python-wheel
)
depends=(
  python
  libvirt
)
options=('emptydirs')
source=(
  "git+https://gitlab.com/libvirt/libvirt-python.git#tag=v${pkgver}"
)
sha512sums=('4a4bf4bb8b641531bbf2c7bfed762700b7a893d26e560434de57312e8a24c78911096da3f179c42df398620fd60f686535413fff3f4c90fedeaa262bac6885e1')

build() {
  cd ${pkgbase}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgbase}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
