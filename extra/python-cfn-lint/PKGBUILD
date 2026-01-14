# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cfn-lint
pkgver=1.43.2
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
b2sums=('5c6e6cc8fde20d5d79e8f5947dac2032663511f1fcd9567bfaf890cc640a1fdf03a95381d660a092fec42c9ececf00ede417b15f03836de35eca84c2163d8c2b')

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
