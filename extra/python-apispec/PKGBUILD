# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apispec
pkgver=6.10.1
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
makedepends=('python-build' 'python-flit-core' 'python-installer' 'git')
checkdepends=('python-tornado' 'python-bottle' 'python-marshmallow'
              'python-flask' 'python-yaml'
              'python-openapi-spec-validator' 'python-pytest')
source=("git+https://github.com/marshmallow-code/apispec.git#tag=$pkgver")
sha512sums=('405383a70b4628031c07c35e5c645eec59ce6b422cc9a44a88f7d00870c0c96bbb3fb1220c4ac8cd4145861a9040b5c7799c7b5887e5a38eb4b5e823da086d31')

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
