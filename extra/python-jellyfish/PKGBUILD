# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-jellyfish
pkgver=1.2.1
pkgrel=2
pkgdesc='A python library for doing approximate and phonetic matching of strings'
arch=(x86_64)
url='https://github.com/jamesturk/jellyfish'
license=(BSD)
depends=(python)
makedepends=(
  git
  python-maturin
  python-build
  python-installer
)
_tag=7d50927c7d63cf4ed8bb16286dd21e34f4bb5641
source=(git+https://github.com/jamesturk/jellyfish.git#tag=${_tag})
b2sums=('265c2d7bf4560ecfac4a9fc7dc91a8543ceb1e06a05e08da65c8b476dfaaf3e9cbbd75c07e37209dffe511d5892468f250880e41e469fdd68181be0f07d98c64')

pkgver() {
  cd jellyfish
  git describe --tags | sed 's/^v//'
}

build() {
  cd jellyfish
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" jellyfish/dist/*.whl
  install -Dm 644 jellyfish/LICENSE -t "${pkgdir}"/usr/share/licenses/python-jellyfish/
}

# vim: ts=2 sw=2 et:
