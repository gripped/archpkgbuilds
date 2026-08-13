# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

_name=SCons
pkgname=scons
pkgver=4.11.0
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
sha512sums=('a204f489eadbbac1f2a15c4fa3ee2b06b40f57b7a3166593f28565e07d7af1529db64a33354b8ba88a67078e48e081f0b1f9043d5b136d5832befb2ffd0f1471'
            '82871f2e8b0e8fac34c9c60ef6367aa5a646cce402272b8d1bf8e966631ef61ba66a3ce7dd02e499686540bce8f1315d8a6e9092dabab9e76fb6c8d8649d8324')
b2sums=('ab60311cf8191a551d4ff57a70e51faddf7144eb97de8ea27b0710668f54a0bad165b293cc5f5f58bb81a1a396f42fdd6414bc9e9c3c67a8ce0a84b15c2f5875'
        '62fc9e79322fb7cf333596833c70bed229d96a68aafaabfe1866d5f1d0750ef77953847887eda9a167ff40ae6c54720086c890176e4d3bb2e1791e01c999cf22')

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
