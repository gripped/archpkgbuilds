# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=4.0.0
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
sha512sums=('14c23fdde625c6d75f161f347fa5ff8be26c626530defc914179b1d9a4f66380cb4341b4e2d1b319a0a63dbb0969f441f905dd90762b8af885ad5d4ab67e8bd9')
b2sums=('4aa84d2150ad3f5dd4b8e50c9f6e0a55d8d51fbff419bf1a74ff5bd8cb7da1251150cc0e7a655c74995cba4a8faf8aa337823cc29ed99b4549b08b9db0b8837d')

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
