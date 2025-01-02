# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-jellyfish
pkgver=1.1.3
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
_tag=fcc82808024a2bbd676ba604a9c0e3786bce6e9e
source=(git+https://github.com/jamesturk/jellyfish.git#tag=${_tag})
b2sums=('dae76e52fb8eb2bf4a4ce58a1f3cf8b0b92ec146f26e7f395290d164d28413552119c805d0aeb1f04e9a3d407c597ed47f070bc211b4b41cfeffb85fb83794e7')

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
