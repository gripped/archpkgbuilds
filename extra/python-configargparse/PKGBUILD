# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.9.0
pkgrel=1
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=('any')
url='https://github.com/bw2/ConfigArgParse'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-tests' 'python-toml' 'python-yaml')
optdepends=('python-toml: for writing TOML configuration files'
            'python-yaml: for YAML support')
source=("git+https://github.com/bw2/ConfigArgParse.git#tag=v$pkgver")
sha512sums=('fd337bc114abcaec336ee8be9f351a73d91720e86718db86b56508718fa0cd54db431aaa473692b812b039aa86660c6269a4e63035727ac9cdfefd161197eaaa')

build() {
  cd ConfigArgParse
  python -m build --wheel --no-isolation
}

check() {
  cd ConfigArgParse
  PYTHONPATH=. pytest -v
}

package() {
  cd ConfigArgParse
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
