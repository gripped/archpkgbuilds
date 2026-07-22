# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-stone
pkgver=3.5.3
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-version-constraints.patch
)
sha512sums=('525335fd9ecfe4b5e194ca2de0d64b25e5090ad1f62e4cdbf1e22f6519aa46ad00def0872c67f5c31cfc2cf8e96d30f01296e9741e67f3a3d80243b563293a7a'
            '384f753bed33a3bf7938cdab58af7be91db28a98d2db373e755cbc81415fa504b6ed53324a165be2648f8c8f41c3ed8c4edc24a83b27d3d5dae8d75cb288412b')
b2sums=('8d81d7fc0b3244b24d7d4a4137de55087daebcd2c0efac2317b03ebcb9976ae4936dbb6f8636572928782262150dc861a37c772851d407ff914074d9f0c6d8e0'
        '61579af01f8465e07b926b318fe49b16ddfb7840b9dd1705e21dce9b02d0908872441ea85a024636b49eab442535abd838776bff660efbbd278cf3060198b00c')

prepare() {
  cd "$pkgname"

  # remove unnecessary version constraints
  patch -p1 -i "$srcdir/remove-version-constraints.patch"
}

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
