# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-eth-hash
pkgver=0.7.1
pkgrel=1
pkgdesc="The Ethereum hashing function, keccak256"
arch=('any')
url="https://github.com/ethereum/eth-hash"
license=('MIT')
depends=('python' 'python-pycryptodome')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest')
source=("git+https://github.com/ethereum/eth-hash.git#tag=v$pkgver")
sha512sums=('da408aae72f29d1c069e564ab65802f89ffa33751adce4e1492e0965638a0b5b4db8505bca27f154ad9b826a5f23afc92e3c0c88f4dc1ac8e53a5569a839c1a4')

build() {
  cd eth-hash
  python -m build --wheel --no-isolation
  make -C docs man
}

check() {
  cd eth-hash
  PYTHONPATH="$PWD" pytest tests/backends/pycryptodome
}

package() {
  cd eth-hash
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 docs/_build/man/eth_hash.1 -t "$pkgdir"/usr/share/man/man1/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
