# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-openapi-spec-validator
# https://github.com/p1c2u/openapi-spec-validator/releases
pkgver=0.7.0
pkgrel=1
pkgdesc="OpenAPI 2.0 (aka Swagger) and OpenAPI 3 spec validator"
url="https://github.com/p1c2u/openapi-spec-validator"
license=('Apache')
arch=('any')
depends=('python' 'python-jsonschema' 'python-openapi-schema-validator'
         'python-jsonschema-spec' 'python-lazy-object-proxy')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/p1c2u/openapi-spec-validator/archive/$pkgver.tar.gz")
sha512sums=('55aae3c3493daf889d9882c50cdbc282151a2e8ada8ab079faec6836558d0f29195583f5fe5732b6bed083f15c39fe744bee1eb7c411b8a9c549b90fb6149b79')

prepare() {
  cd openapi-spec-validator-$pkgver
  sed -i '/--cov/d' pyproject.toml
}

build() {
  cd openapi-spec-validator-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd openapi-spec-validator-$pkgver
  PYTHONPATH="$PWD" pytest
}

package() {
  cd openapi-spec-validator-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
