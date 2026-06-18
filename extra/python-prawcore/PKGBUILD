# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-prawcore
pkgver=3.1.0
pkgrel=1
pkgdesc="Low-level communication layer for PRAW 4+."
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/praw-dev/prawcore"
depends=('python' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest' 'python-vcrpy')
source=("git+https://github.com/praw-dev/prawcore.git#tag=v$pkgver")
sha512sums=('b222e79618d81adf50de2dae7fdaf2e781eeded224e173eaf84710b85f043278c2df71b9d72ed2c25312a1fabe106733f412542806bc540c8cd49a17061e2b61')

prepare() {
  cd prawcore
  sed -i 's/flit_core >=3.4,<4/flit_core/' pyproject.toml
  # Fix timeout test with annotated requests signatures: https://github.com/praw-dev/prawcore/commit/cada84aee662fd40b4aa9e5f2a54de871dd74591
  git cherry-pick -n cada84aee662fd40b4aa9e5f2a54de871dd74591
}

build() {
  cd prawcore
  python -m build -nw
}

check() {
  cd prawcore
  pytest
}

package() {
  cd prawcore
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
