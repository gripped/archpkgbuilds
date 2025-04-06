# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-jellyfish
pkgver=1.2.0
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
_tag=f8fdbf8f0399d71da5cf8d59029822611b72e8f1
source=(git+https://github.com/jamesturk/jellyfish.git#tag=${_tag})
b2sums=('0428e5a994f4db6b31a4f36666c995f4800adb9a7c85950d8bd5b6c6b19665b645e37b5267b23061225d78b27d6810c7429b47f3b9a9db592d202cd9ab89bbe4')

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
