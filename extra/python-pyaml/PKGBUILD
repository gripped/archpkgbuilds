# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyaml
pkgver=24.12.1
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
sha512sums=('0f16409537589b581a2c77b509a3de06e75cd4fb75ff9a6dc475d6e5b198732159f6ae33ff9e7e434b8d986a0fd50e9a8fa9d11a4343fa326efa1a1879475ea1')

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
