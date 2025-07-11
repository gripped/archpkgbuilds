# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname=python-certifi
pkgver=2025.07.09
pkgrel=1
pkgdesc="Python package for providing Mozilla's CA Bundle (using system CA store)"
arch=(any)
url="https://github.com/certifi/python-certifi"
license=(MPL-2.0)
depends=(
  ca-certificates
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2b5af0084cd73cc773e6465f5dfe294ed8fb4f6dbe2e7d0a5eb0374b04b693eb976a6178b8c00d3155190c4319471756a160cd047729a363f1d0008f9ff1da9a')
b2sums=('e980cf86db1edd51bf7548a56a00c6280d2bbb96bc3288c428b550f8900aa6db476934260d3f6867e77816b818afc46fc2ef021e63aff1d82f263bb27f92f1ae')

prepare() {
  cd $pkgname-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test
  # suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt certifi/cacert.pem
  # Our CA store has non-ASCII comments, but we are not packaging for JVM
  # https://github.com/certifi/python-certifi/issues/50
  sed -i 's/encoding="ascii"/encoding="utf-8"/' certifi/core.py
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir/$site_packages/certifi/cacert.pem"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
