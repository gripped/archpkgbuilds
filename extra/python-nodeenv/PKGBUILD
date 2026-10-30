# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nodeenv
pkgver=1.11.1
pkgrel=1
pkgdesc="Node.js virtual environment builder"
url="https://github.com/ekalinin/nodeenv"
license=('BSD-3-Clause')
arch=('any')
depends=('python-setuptools' 'make')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
optdepends=('nodejs: for --node=system and --prefer-system'
            'python-certifi: certificate bundle for --with-certifi')
checkdepends=('dash' 'fish' 'nodejs' 'python-pytest' 'python-coverage' 'zsh')
source=("git+https://github.com/ekalinin/nodeenv.git#tag=$pkgver")
sha512sums=('aec23e4ce2e88c960c80d77fe427c8ff4e0d0ffdfff3ca62d3b5b65adc1ee48c3b5836f3c4ee062629305c5b6e173fd1c4414fbd3d45c66397150454959911d2')

prepare() {
  cd nodeenv
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd nodeenv
  python -m build --wheel --no-isolation
}

check() {
  cd nodeenv
  pytest
}

package() {
  cd nodeenv
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
