# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=7.0.0
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
sha512sums=('cd6654d0618b6f33efef2fa7a260a39c164ced46d97875024a37bfbfa48d8f118e31495f45f5cb0d896a9a88b4aa24bb28ba91c46884470d0f13208abb396170')
b2sums=('54fd6e33c2281466fe8f45dfa67149e1ba13b177602b26544da9f8b75b6f055dbd93ee633befb7c806fcde9998004b09702a4daf16268c66141c455a97eec8cb')

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
