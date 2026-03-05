# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.7.1
pkgrel=2
pkgdesc='A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables'
arch=('any')
url='https://github.com/bw2/ConfigArgParse'
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-yaml') # HACK: run tests without python-tests as they fail
optdepends=('python-yaml: for YAML support')
source=("git+https://github.com/bw2/ConfigArgParse.git#tag=$pkgver")
sha512sums=('f49c4f9d039dd7a7c44863ba13e1b9bd8a2e5fb0f04af43577e1c3351d3091ef6b0f300e9df55e2fc177f02080b256b5bec68f8631456202900e3a78c718b5f4')

build() {
  cd ConfigArgParse
  python -m build --wheel --no-isolation
}

check() {
  cd ConfigArgParse
  # https://github.com/bw2/ConfigArgParse/issues/294
  PYTHONPATH=. pytest -v -k "not TestMisc and not testBasicCase2 and not testMutuallyExclusiveArgs and not test_unrecognized_args"
}

package() {
  cd ConfigArgParse
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
