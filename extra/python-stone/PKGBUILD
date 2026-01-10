# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-stone
pkgver=3.3.9
pkgrel=4
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
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-six.patch
)
sha512sums=('ed3b4d442f04935849aff44360a8c4d62934f7ecb0833ea0e3b7575d6f6fb712a9cce3a98009b85967729004c3ce7c33d2eadd5453693a2fa48f1b6a7dd48205'
            '701543d14e59c6ba1e0cb02e61bb41bc686b6d653f4ff0e8a1738912ecee27a51bfde9906cba3f00425caab793397f4b3ea32b030bb2271ab2e5fd5ba66bb216')
b2sums=('499ba79dde93ef42825dcd848802a202ad59e1601d2db55c91a29b7b5b85704d7c60236a91eef4b812bd79bb319127768adc25d6722cedf7a61c410ff6c6db53'
        '7e9c846c467263bb21fca75f97cc6ff83eee80a213db165284e2a84b3c6b27bfbda19960a501cd1ca23006898d344d87e69345a466bdb845b5e6ee385f9f25a1')

prepare() {
  cd "$pkgname"

  # remove pytest-runner
  git cherry-pick --no-commit 7d47f04f335868ad723f2d935cb2ee74eee9142a

  # remove six
  # modified version of https://github.com/dropbox/stone/pull/318
  patch -p1 -i "$srcdir/remove-six.patch"
}

build() {
  cd "$pkgname"

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
