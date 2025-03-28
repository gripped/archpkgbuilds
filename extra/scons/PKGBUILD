# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

_name=SCons
pkgname=scons
pkgver=4.9.1
pkgrel=1
pkgdesc="Extensible Python-based build utility"
arch=(any)
url="https://scons.org"
license=(MIT)
depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-psutil
  python-pytest
)
optdepends=(
  'python-psutil: to wait for processes to exit'
)
source=(
  $pkgname::git+https://github.com/$pkgname/$pkgname.git#tag=$pkgver
  https://downloads.sourceforge.net/project/scons/scons/$pkgver/$_name-$pkgver.tar.gz
)
sha512sums=('831c0e9f03ab8b7bad09ae27e8e9553ff4da35e4d01abfb65d16140ae43a0b3a59e8af2a237bce82a6722f3d0459ec39de7636291c75f9edf92a8ef02ffac730'
            '8d881179a99a1c429ae76fbc01f0bfd606686c89b999687c0a2ec33126f7c71d1efc7c61666165981f752b8c52e40103fe08aadf07ea9337fe4fd3a8d3a94eb1')
b2sums=('311d167c4575d5212ac4334f114d8a6096141d0bd41732b8b02c9cd30cb1fef2f106d9c51b74b5c62132f60d8d36ca7470a4c72bf8165a01e1040b1ebaf53bdc'
        '5ac153cc2b6a9569765eb4f8d01e900cf6bba1be333f68358aaa1ecd395ab9b7faf6a1da7b56d5080962d5bb078c16fa362487aedbb8417792a4a12f2ac8d95b')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python runtest.py --all --unit-only
}

package() {
  # install man pages from prebuilt sources
  install -vDm 644 $pkgname-$pkgver/*.1 -t "$pkgdir/usr/share/man/man1/"

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {{CHANGES,RELEASE}.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"

  # remove docbook dirs
  find "$pkgdir" -name 'docbook' -type d -exec rm -frv {} +
}
