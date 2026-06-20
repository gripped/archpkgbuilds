# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-praw
pkgver=7.8.2
pkgrel=1
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
sha512sums=('5beca411ce1cbc2a18f8371932ae31ab40bac0f8a2c813ab753cf1f8974d335940bfb57897fb6687e5f9240d73a11eb33b98196666bd3459d406b5850051ce4f'
            'a2316c9f6e41b888ad41b02b951d895e7d4ddc8c27d6dbf081e3a505803a36c168d882ef3c6571b6e88e6aa7a443c927cb30db50de1ceba9ac03fb4fc8c4a77a')

prepare() {
  cd praw-$pkgver
  patch -Np1 < ../$pkgname-python-3.14.patch

  # prawcore 3 removed reset_timestamp from RateLimiter; PRAW 8 drops it from Auth.limits.
  sed -i '/"reset_timestamp": data\.reset_timestamp,/d' praw/models/auth.py
  sed -i 's/{"remaining": None, "reset_timestamp": None, "used": None}/{"remaining": None, "used": None}/' \
    tests/unit/models/test_auth.py
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
