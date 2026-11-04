# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-pam
pkgver=2.1.1
pkgrel=1
pkgdesc='Pure Python interface to the Pluggable Authentication Modules system'
arch=(any)
url='https://github.com/FirefighterBlu3/python-pam'
license=(MIT)
depends=(python pam)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('39a32fbf04b373c0d62af20a80e277ba076aee9b8d80c85ea9a90a8cdc4d03049aa08e79b760fe9c752b4284354595cbf493c590b20e232b19806d5b40ad01bf')
b2sums=('e5b834c6e2d24ec1b60a75c6a0ca43acea81f5e56cdb3cd9503230772f1c7365541736a7e5a81c77bdff077064f89ef89d5bc94521d1b4f29448242edcb1f0dc')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
