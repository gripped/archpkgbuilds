# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=8.5.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL-3.0-or-later')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' )
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('8057afc29bf6c59af2b78221a3823b8f49cd5076db50022e24cd6b6679ad350726ddd257ef891e04951798546ddf097bc8c1c3d45f30c356b4a60adf615258b8')
b2sums=('4516dc1273b8df53256a397202c7bdb97ba3861963fb25166c38bbc613a0c28540d0710ea6c58e1e07000e35716f74b51eecc00a0aea67efa426819fe53769ff')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v --ignore tests/functional/ --ignore tests/unit
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-$pkgver/dist/*.whl
}
