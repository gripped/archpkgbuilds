# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sphinxcontrib-autoprogram
pkgver=0.1.8
_commit=b6df97b08e1c28684911f7704422da074d4c4e27
pkgrel=3
pkgdesc="Documenting CLI programs"
url="https://github.com/sphinx-contrib/autoprogram"
license=('BSD-2-Clause')
arch=('any')
depends=('python-sphinx')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/sphinx-contrib/autoprogram.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd autoprogram
  # remove dependency on 'six' transitional library
  git cherry-pick -n 63e934c2a807f5a6babca50bfb487654a194392e
  # Remove imp dependency
  git cherry-pick -n 79cfb42f5dc3a57ff9cac249f98fe3577cea4d8c
}

build() {
  cd autoprogram
  python -m build --wheel --no-isolation
}

check() {
  cd autoprogram
  python -m venv --system-site-packages local-env
  local-env/bin/python -m installer dist/*.whl

  PYTHONPATH="$PWD"/doc local-env/bin/python -m unittest sphinxcontrib.autoprogram.suite -v
}

package() {
  cd autoprogram
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
