# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=7.8.1
pkgrel=2
pkgdesc="Python Reddit API Wrapper that allows for simple access to Reddit's API"
arch=('any')
license=('BSD-2-Clause')
url="https://praw.readthedocs.org"
depends=('python-prawcore' 'python-update-checker' 'python-websocket-client')
makedepends=('python-build' 'python-installer' 'python-flit-core' 'python-wheel')
checkdepends=('python-betamax-serializers' 'python-betamax-matchers' 'python-pytest')
source=(
  "https://github.com/praw-dev/praw/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-python-3.14.patch"
)
sha512sums=('dcf5c7393657a954465b8bc4b9164dfe0e293bcdbb771ff1c25bb3ec806aaf8b50daaa2f0a7ddf0de5402982fa85ec2b87ad58d8d4196517148ee20aa43c7dcf'
            'a2316c9f6e41b888ad41b02b951d895e7d4ddc8c27d6dbf081e3a505803a36c168d882ef3c6571b6e88e6aa7a443c927cb30db50de1ceba9ac03fb4fc8c4a77a')

prepare() {
  cd praw-$pkgver
  patch -Np1 < ../$pkgname-python-3.14.patch
}

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
