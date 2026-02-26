# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-plumbum
_name=plumbum
pkgver=1.10.0
pkgrel=1
pkgdesc='A small yet feature-rich Python library for shell script-like programs, and more'
url='https://github.com/tomerfiliba/plumbum'
arch=('any')
license=('MIT')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('c290ae9bb4475380ae6cc32d801050642d1ef2806df6b1be9e45ed61f511ac5e3a4da2f45104d55b0eb34b6a73c649bab05b8ea9bb84d666adf8d921f8c503e2')
b2sums=('6fa83c89d1585219a0a333929aefb52747d5f0bcd3eb3e890a8581607dda702ad71207226ce5007f7341b8d2105970d4aa237b0d7f59649bff8e991a9cecb150')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  PYTHONPATH=. python -c 'import plumbum'
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
