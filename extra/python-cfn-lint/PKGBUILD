# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-cfn-lint
# https://github.com/aws-cloudformation/cfn-lint/blob/main/CHANGELOG.md
pkgver=1.33.2
pkgrel=1
pkgdesc='CloudFormation Linter'
arch=(any)
url='https://github.com/aws-cloudformation/cfn-lint'
# https://github.com/aws-cloudformation/cfn-lint/blob/v0.84.0/setup.py#L63 uses "MIT no attribution",
# which corresponds to https://spdx.org/licenses/MIT-0.html
license=('MIT-0')
depends=(python python-yaml python-aws-sam-translator
         python-jsonpatch python-networkx
         python-sympy python-regex
         python-typing_extensions
         # Not listed in pyproject.toml, maybe upstream relies on the transitive dependency jsonpath -> jsonpointer ?
         python-jsonpointer)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-defusedxml
              python-pydot python-junit-xml python-jschema-to-python python-sarif-om)
optdepends=(
  'python-pydot: for building graphs from templates'
  'python-junit-xml: for junit formatter'
  'python-jschema-to-python: for sarif formatter'
  'python-sarif-om: for sarif formatter'
)
source=("git+https://github.com/aws-cloudformation/cfn-lint.git#tag=v$pkgver")
sha256sums=('95497b4b7c1ad8e52e15c4195b8fec26788da042b069f92f0c2732bc53a54e90')

prepare() {
  cd cfn-lint
  # The latest cfn-lint uses PEP 639, while a setuptools newer than the one in Arch Linux is needed [2][3]
  # [1] https://github.com/aws-cloudformation/cfn-lint/pull/4067
  # [2] https://github.com/pypa/setuptools/pull/4706
  # [3] https://archlinux.org/packages/extra/any/python-setuptools/
  git revert -n dc591808548fcc586668687225342bd5fb68dbd3
}

build() {
  cd cfn-lint
  python -m build --wheel --no-isolation
}

check() {
  cd cfn-lint

  # Tests in test/integration need the cfn-lint binary
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  export PYTHONPATH="$PWD/src"
  export PATH="$PATH:$PWD/tmp_install/usr/bin"
  pytest
}

package() {
  cd cfn-lint
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
