# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=python-graphene
pkgver=3.4.3
pkgrel=3
pkgdesc='GraphQL framework for Python'
arch=(any)
url=https://graphene-python.org/
license=(MIT)
depends=(
  python-aniso8601
  python-graphql-core
  python-graphql-relay
)
makedepends=(
  git
  python-setuptools
)
_tag=82903263080b3b7f22c2ad84319584d7a3b1a1f6
source=(python-graphene::git+https://github.com/graphql-python/graphene.git#tag=${_tag})
sha512sums=('6aca82c74222f0c70f1bbecb6781405e756456a6a1dbf63b21adebdafef2db93f3774662339b66d5cbe41d0f394b5d4289f5436a14bd75ee4fbc4bc997d195bf')

pkgver() {
  cd python-graphene
  git describe --tags | sed 's/^v//'
}

build() {
  cd python-graphene
  python setup.py build
}

package() {
  cd python-graphene
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-graphene
}

# vim: ts=2 sw=2 et:
