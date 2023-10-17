# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-jellyfish
pkgver=1.0.2
pkgrel=1
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
_tag=af51f1013e0a22a7f14307d64f68690c2814d126
source=(git+https://github.com/jamesturk/jellyfish.git#tag=${_tag})
b2sums=(SKIP)

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
