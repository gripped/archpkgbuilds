# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname='libvirt-python'
epoch=1
pkgver=11.9.0
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
sha512sums=('39e126b553348d57a5e3109841bfd8ebd84db2c25fbfc91c1e227b4ab8382bfc6c97177f358c8d13406e981f09ac2464bc02d16a6f45453863bf0db03420d3f8')

build() {
  cd ${pkgbase}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgbase}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
