# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=6.2.0
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
sha512sums=('b3066c72a4a9593d0a2b988af1fdfb330e5de180d25eaad13a8a41dfbf53a21ae62b89ce499d2c3bb0d32fbdfc6fb3aef3c78e26a20b795ff43f156797c52b0f')
b2sums=('728811dece1d166c69f684e13fe289e2cf218baa6e0395251122dbd4f5c525e0bec69d8e94eeefc40a445084abe826a73b42094a61a4935c02e8fbfdb772fe93')

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
