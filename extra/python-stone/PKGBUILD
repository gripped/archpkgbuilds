# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-stone
pkgver=3.5.4
pkgrel=1
pkgdesc='The Official API Spec Language for Dropbox API V2'
arch=(any)
url='https://github.com/dropbox/stone'
license=(MIT)
depends=(
  python
  python-packaging
  python-ply
  python-jinja
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('f27601049470765c5edb3d07e13cec1e9e7d09a9f6142c79670cc019107a02eebe0661a599c040e89500ebd765859023f4313297b99544213aca5c086c15decf')
b2sums=('5fa26092f785b3703dc0a1f8231cafcb206a5a053b6d7b58a5a262892375df0d5cf770265661a9aab93b1c7567e517848ea2e46d9683a76c744f03f79ebc014c')

build() {
  cd "$pkgname"

  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -vv
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
