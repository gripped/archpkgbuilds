# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpointer
pkgver=3.2.0
pkgrel=1
pkgdesc='Identify specific nodes in a JSON document (RFC 6901)'
arch=(any)
url='https://python-json-pointer.readthedocs.org/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("$pkgname::git+https://github.com/stefankoegl/python-json-pointer#tag=v$pkgver")
sha512sums=('dba238f966e4e1f54789197865515398b91afba1b570eaf5699a155f2549767578482e627563c0b464a0c9abcaeda59ffd33c18731ad2085b1f4d2ddf9c93152')
b2sums=('e53a1d53cdabf5384fe6f479ef6a988df85cfde5c297e2f53d6a880ac7bb6a3b0f64c7436f38f7af3b428fae80b43eb41909374d9486721c8b85a6c277962bbf')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
