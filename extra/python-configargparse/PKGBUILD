# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-configargparse
pkgver=1.7.2
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
sha512sums=('f65bf12e4db74c3928a09590d348f07ece2af194c4acae8264fba3667fd977577b0c476de97c1b3f7f37f6f29996c2b43d6aef5b3a04cc1fc08f29de61504f92')

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
