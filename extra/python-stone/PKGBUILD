# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-stone
pkgver=3.5.2
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
sha512sums=('103990aacc52cb3f7845cac5c29aad6ba554d17877ffb2f814a99be5e8c78e0cd3dd85b6db6bdaecab66a0cce4976c8a5fef57a89b9f8c0907191eee74cd6be7'
            '384f753bed33a3bf7938cdab58af7be91db28a98d2db373e755cbc81415fa504b6ed53324a165be2648f8c8f41c3ed8c4edc24a83b27d3d5dae8d75cb288412b')
b2sums=('ac5084989a4578046b6ecfa5369ffc50012d3670ca75d01a5184ce04a6798de9fe917aff289b456c55bfdd6cef380c1ced69ac9c04e714de7ac5859c8c1168d4'
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
