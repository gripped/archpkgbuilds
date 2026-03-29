# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.7.4
pkgrel=1
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=('any')
url='https://github.com/bw2/ConfigArgParse'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-yaml') # HACK: run tests without python-tests as they fail
optdepends=('python-yaml: for YAML support')
source=("git+https://github.com/bw2/ConfigArgParse.git#tag=v$pkgver")
sha512sums=('e8b3d1ee80955fd7b0363f93bad8d665615ddb64d51751ea21c338c0379ede9291a081cc309d66b1879dbb8b4d98691a38e5f54d7966845908ba85fb21874fd5')

build() {
  cd ConfigArgParse
  python -m build --wheel --no-isolation
}

check() {
  cd ConfigArgParse
  # https://github.com/bw2/ConfigArgParse/issues/294
  PYTHONPATH=. pytest -v -k "not TestMisc and not testBasicCase2 and not testMutuallyExclusiveArgs"
}

package() {
  cd ConfigArgParse
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
