# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.7.7
pkgrel=1
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=('any')
url='https://github.com/bw2/ConfigArgParse'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-toml' 'python-yaml') # HACK: run tests without python-tests as they fail
optdepends=('python-toml: for writing TOML configuration files'
            'python-yaml: for YAML support')
source=("git+https://github.com/bw2/ConfigArgParse.git#tag=v$pkgver")
sha512sums=('95d0aa4a1c9a40237ac690b62d95a2348a1548462b7c19b7f4a9e365b24298ffa47b5178da34f41837c8d110b1adbd40f7a2b98bdf4ebff9dd9f03f91cd38f92')

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
