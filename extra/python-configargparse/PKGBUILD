# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.7.3
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
sha512sums=('7b83ef4f5497b5931bcd17b9022e7c45383d74efdcb29daaad58aa27ffe18c4d7179684f0255f58bc9ad5e66710b7555703ea38b4a80623af47abe1b1a8e1144')

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
