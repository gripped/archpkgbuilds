# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-apispec
pkgver=6.9.0
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
sha512sums=('261bbab019c5a9cf3ee0bdef9463af8e88ab5bd8ee944a2fac69f0b1468b5675a666c464b9d7741915690e2dd9db68b469bd9f33f40ae3407c935a230daa79a9')

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
