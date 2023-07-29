# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Lukas Sabota <punkrockguy318@comcast.net>
# Contributor: Brice Carpentier <brice@dlfp.org>

_name=SCons
pkgname=scons
pkgver=4.4.0
pkgrel=4
pkgdesc="Extensible Python-based build utility"
arch=(any)
url="https://scons.org"
license=(MIT)
depends=(
  python
)
makedepends=(
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
  https://github.com/$pkgname/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz
  https://downloads.sourceforge.net/project/scons/scons/$pkgver/$_name-$pkgver.tar.gz
  $pkgname-4.4.0-dont_install_manpages.patch
)
sha512sums=('01fcd40bf818ca22a278973af1cda3024efb74cf877f15d46607fda860448fbd577fc96ba33fef2bed3d145e662a0371f55e8c927e7ac44feea7f3081791ce11'
            'd4e630214a9221f00d668b6524803efa83b41534fa6e0acca689d926cbc8546e5cf79c1c7a4b5627afbcd5033564343b408790bf4c29067d053cfbb39408a8ed'
            '97fb0e54274753b8c94a184a8b811371d314a371abb933b0380b2f990962c341d4d896050501c6889f0568b6d45867dc854ce16d23e9a8540cf4957df7af15a1')
b2sums=('f6ce757f2edc40551b05285098626bb62def6abda2380d4885ee4443868e715e53aaa34f26c09dc689bb6ade26d1b0e276046fe3b1d2ddf8eb40400bca9ea164'
        '60f125c077dd8f50a7150db6dc1234eac988cf7ee7495036d73c46e8ae445b87c88dde23a537d6647709778a33e6f1ac529f7ac7f862648e3019bbe437bb451c'
        'b7b611138f0c672d29f9f56a46802289fed7daac25b12822e60c3d8e076aae3b1b88f144e7b9b1fea3a5092ca80f75ed02480250de65e664e18ec9b8ab5f120e')

prepare() {
  # don't try to install the (non-existent) man pages
  # we'll use them from prebuilt sources, because building them drags in a lot of dependencies, is very brittle and painful
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-4.4.0-dont_install_manpages.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python runtest.py --all --unit-only
}

package() {
  # install man pages from prebuilt sources
  install -vDm 644 $_name-$pkgver/*.1 -t "$pkgdir/usr/share/man/man1/"

  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {{CHANGES,RELEASE}.txt,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"

  # remove docbook dirs
  find "$pkgdir" -name 'docbook' -type d -exec rm -frv {} +
}
