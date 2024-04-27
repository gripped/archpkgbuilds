# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Clément DEMOULINS <clement@archivel.fr>

pkgname=python-networkx
pkgver=3.2.1
pkgrel=2
pkgdesc='Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.'
arch=('any')
license=('BSD-3-Clause')
url="https://networkx.org/"
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-pandas')
optdepends=('python-lxml: for GraphML XML format'
            'python-pydot: for graph drawing and graph layout algorithms via GraphViz'
            'python-yaml: for YAML format reading and writing'
            'python-sympy: for polynomial algorithms')
# python-pygraphviz: for graph drawing and graph layout algorithms via GraphViz
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-lxml' 'python-pydot' 'python-yaml')
source=("https://github.com/networkx/networkx/archive/networkx-$pkgver.tar.gz"
        "73c655270ee22ae06b60c5a6c4a03d1fdf202fc2.patch")
sha512sums=('4e64352c5b2746ba5722d9ac877ca13981cf0d109df5403d8f314ed07bb6c12cd0065217a3b13daefb62f5fc74ad2bc28db2839b0d57bca8a975a9da218fadb7'
            '85544098e9383fb6eda1f0602281b44ec3fdb0ba5ea2c475138729463bef76cf90c5a95b5e1a7a4569417edf4423d60a70e66cb057ea24b528b90ddee26af04e')

prepare() {
  cd networkx-networkx-$pkgver
  # Make tests pass with pytest 8
  # https://github.com/networkx/networkx/pull/7203 - already merged as part of version 3.3
  patch -Np1 -i ../73c655270ee22ae06b60c5a6c4a03d1fdf202fc2.patch
}

build() {
  cd networkx-networkx-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd networkx-networkx-$pkgver
  pytest -v
}

package() {
  cd networkx-networkx-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  cp -r examples "$pkgdir"/usr/share/doc/$pkgname
}
