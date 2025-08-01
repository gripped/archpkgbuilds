# Maintainer: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

pkgname='libvirt-python'
epoch=1
pkgver=11.6.0
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
sha512sums=('9cb264d3f16237abfac90d7340584b268fb73a793cb46fc000669366a33ea6fb8f89da0e2410222f727d77f73fe665e19179b1baa88ec59a83eabfac96fee0f7')

build() {
  cd ${pkgbase}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgbase}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
