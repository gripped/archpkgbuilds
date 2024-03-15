# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyaml
pkgver=23.9.0
pkgrel=2
pkgdesc="PyYAML-based module to produce pretty and readable YAML-serialized data"
url="https://pypi.python.org/pypi/pyaml"
license=('WTFPL')
arch=('any')
depends=('python-yaml')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-unidecode')
optdepends=('python-unidecode: Needed if same-id objects or recursion is used within serialized data')
source=("https://pypi.io/packages/source/p/pyaml/pyaml-$pkgver.tar.gz")
sha512sums=('1ff23e07e45d6530b6666a26947362a6bb2125b731dd03501aafe9096766a38fec7906a36666c7974e49cedf9a91f5af0973827151c746933e7b969aeec56ab8')

build() {
  cd pyaml-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pyaml-$pkgver
  python -m unittest -v
}

package() {
  cd pyaml-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
