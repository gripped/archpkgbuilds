# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyaml
pkgver=25.5.0
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
sha512sums=('2032ac37771a57c1b8dcd12d5908679e599586dabba58267bbbf24ebb5aca8c2a1d25c8374d21c964253cca10f1b50e1a6b609d6d2d83a0c7bccdcab39f7dd74')

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
