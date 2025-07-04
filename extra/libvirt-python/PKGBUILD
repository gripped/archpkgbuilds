# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname='libvirt-python'
epoch=1
pkgver=11.5.0
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
sha512sums=('15064d31479ae9b282808e67499487a1bef6b75c2a91ba6fb0fb48aff9346c19e97055f5c29f250fd7ecd06ed190b3694cc3a94940dae07b6713b1eb0c21a5a8')

build() {
  cd ${pkgbase}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgbase}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
