# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apispec
pkgver=6.8.1
pkgrel=1
pkgdesc="A pluggable API specification generator. Currently supports the OpenAPI Specification."
url="https://github.com/marshmallow-code/apispec"
license=('MIT')
arch=('any')
depends=(
  'python'
  'python-packaging'
)
optdepends=(
  'python-marshmallow: for marshmallow support'
  'python-yaml: for yaml support'
)
makedepends=('python-build' 'python-flit-core' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-tornado' 'python-bottle' 'python-marshmallow'
              'python-flask' 'python-yaml'
              'python-openapi-spec-validator' 'python-pytest')
source=("git+https://github.com/marshmallow-code/apispec.git#tag=$pkgver")
sha512sums=('a8b5d11684c94774e239dc1502252fcd8e451d3cae48666423fa3f1fee8ecc49769b7e2798b7b94d9fbca7f052a8f742c24ace32d0b9726ca2f7d1e11410f0d5')

build() {
  cd apispec
  python -m build --wheel --no-isolation
}

check() {
  cd apispec
  PYTHONPATH=src pytest -k 'not test_schema_instance_with_different_modifers_custom_resolver' .
}

package() {
  cd apispec
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
