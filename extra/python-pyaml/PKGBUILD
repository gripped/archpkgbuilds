# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyaml
pkgver=25.1.0
pkgrel=1
pkgdesc="PyYAML-based module to produce pretty and readable YAML-serialized data"
url="https://github.com/mk-fg/pretty-yaml"
license=('WTFPL')
arch=('any')
depends=('python-yaml')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-unidecode')
optdepends=('python-unidecode: Needed if same-id objects or recursion is used within serialized data')
source=("git+https://github.com/mk-fg/pretty-yaml.git#tag=$pkgver")
sha512sums=('63d8eb435c69ada81f408b3ec8eafab197c6e4e17ca1ea33376e51262fae2ff4f4860a1a941a42f7c2bf0cb4114fce25ed379e9d327ed2f51c7ae5cc77afbb74')

build() {
  cd pretty-yaml
  python -m build --wheel --no-isolation
}

check() {
  cd pretty-yaml
  python -m unittest -v
}

package() {
  cd pretty-yaml
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/

  # Remove tests
  python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -r "$pkgdir"/usr/lib/python"$python_version"/site-packages/pyaml/tests
}
