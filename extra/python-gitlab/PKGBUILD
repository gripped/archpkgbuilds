# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=4.2.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL3')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/python-gitlab/python-gitlab/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('01a72b36f7ef10b86035f6020177a0c04506667c4085a91dbe22ce6ce2386f56ed7df5f963ade688330f564a38111103c179eca1c2fbe81682161546be6b6120')
b2sums=('293ba93fa416828ba4f632191dda639c48fb116e7362e10e41a6557d1193764b5f3d3f596676292ee5c696891518b81658ce62f928f801939e25076182f3c669')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v --ignore tests/functional/
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-$pkgver/dist/*.whl
}
