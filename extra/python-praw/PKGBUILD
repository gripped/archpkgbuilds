# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=8.0.2
pkgrel=1
pkgdesc="Python Reddit API Wrapper that allows for simple access to Reddit's API"
arch=('any')
license=('BSD-2-Clause')
url="https://praw.readthedocs.org"
depends=('python-defusedxml' 'python-prawcore' 'python-update-checker' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-vcrpy')
source=("https://github.com/praw-dev/praw/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6d0e8b6b35b944e2014b53d3dd0b6d45ad3daece8832351a1a0487600f879768968b0aa4c6a63a1a5cc158dbfc3e059ca7212151e2547c25b9d248d52489e680')

build() {
  cd praw-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd praw-$pkgver
  pytest
}

package() {
  cd praw-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
