# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.10.2
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
sha512sums=('6abcb270973d4b80b1a02a031f049a4c4626102f25f16de9c853dcc91496454e967e2f5b9d4c3bfb497783ccb22497b19ddfb0e82d14169db0673497130708e0')

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
