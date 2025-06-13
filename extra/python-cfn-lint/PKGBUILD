# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cfn-lint
pkgver=1.35.4
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
sha256sums=('91686eca6114a6f03d1b7deb1990d7ad13f2a8a5611b5f3b75748153406f9ea8')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest -n auto
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
