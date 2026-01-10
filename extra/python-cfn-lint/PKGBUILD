# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cfn-lint
pkgver=1.43.1
pkgrel=1
pkgdesc='CloudFormation Linter'
arch=(any)
url='https://github.com/aws-cloudformation/cfn-lint'
license=('MIT-0')
depends=(
  python
  python-aws-sam-translator
  python-jsonpatch
  python-jsonpointer
  python-networkx
  python-regex
  python-sympy
  python-typing_extensions
  python-yaml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-defusedxml
  python-jschema-to-python
  python-junit-xml
  python-pydot
  python-pytest
  python-pytest-xdist
  python-sarif-om
)
optdepends=(
  'python-pydot: for building graphs from templates'
  'python-junit-xml: for junit formatter'
  'python-jschema-to-python: for sarif formatter'
  'python-sarif-om: for sarif formatter'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('de0f0a75589f44213986113da9f924343b0400578ff22faccaac1588ca874f25a9a86732d3b64b0ddc560829ca5fd62480080057393a9ad21fb0c0ab95421217')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected tests fails for version 1.40.0
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest -n auto \
    --deselect=test/integration/test_quickstart_templates.py::TestQuickStartTemplates::test_templates \
    --deselect=test/integration/test_quickstart_templates_non_strict.py::TestQuickStartTemplates::test_module_integration \
    --deselect=test/integration/test_quickstart_templates_non_strict.py::TestQuickStartTemplates::test_templates
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
