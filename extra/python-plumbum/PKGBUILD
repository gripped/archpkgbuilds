# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-plumbum
_name=plumbum
pkgver=1.9.0
pkgrel=3
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
sha512sums=('afa0436e19ddea192ac7d33a3cdede6a86c801288d6678c9d9daa110ea049b14bc388fe4eb27e172d66595de282648b966043bed8f4c282350753afdf38e14de')
b2sums=('eb155511c3726b7b7e564da05ab58294ffdbe9806599d8adbd0a05ffc9cf096a6c551f5d1ef0b9a781a13435e47a6598c90c04d90c852f8536c665d2bfbb58d9')

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
