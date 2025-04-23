# Maintainer: David Runge <dvzrv@archlinux.org>

_name=imagick
pkgbase=php-imagick
pkgname=(
  php-imagick
  php-legacy-imagick
)
pkgver=3.8.0
pkgrel=1
pkgdesc="PHP extension to create and modify images using the ImageMagick library"
arch=(x86_64)
url="https://github.com/imagick/imagick"
license=(PHP-3.01)
depends=(
  gcc-libs
  glibc
  imagemagick
  ttf-font
)
makedepends=(
  librsvg
  php
  php-legacy
)
checkdepends=(ttf-dejavu)
optdepends=(
  'librsvg: for SVG support'
)
source=(
  $pkgbase-$pkgver.tar.gz::https://github.com/$_name/$_name/archive/refs/tags/$pkgver.tar.gz
  $_name.ini
  $pkgbase-3.7.0-skip_version_check_by_default.patch
)
sha512sums=('a3ad7ce4bdb5d47c91e67a94d035cd56221c4acee05a8b28de50ab49f2927f5236e11a4a7dd874d2c6fc7b1471ecf37eda92ab785396d7072bcb7262a0c5fc84'
            '720e050c7db81069b9f27624dd9430dd4952cfbc7f2374a58a6ce1eabd95bf936f3f9f9c53d44ff402acd38e869c2b9ec190b9d8a1e2aa204ecf9719e2708a42'
            'd4bd791fcc06cdf23d68d62c982c316df0fc2dca73f85815dd1c512af6416e19eb37947ca85bfe7e3cea96a8c1718b9400b5e6c5ac120e19b24879e020b30c1d')
b2sums=('332c89a78ac914b5960a9251088855b19c91125b1ee5a537554226db6a2358560d7ec95bf218931d3d3dd496e7131a77a3ab44b23e1d94861eedb05ad448cc0c'
        '79f08a42378d0589f162cc091e7f5e216ded51063a9b0230b933c3eddf8427ebbe44095cbe1a26e2eb8cb12540edfae14b10298a2daef1ae73cb3133cd18e01b'
        '0241772fd6cc5f5bfed5c190dbc86ea4e7af69a309541e1be202b2d09d73ca4f5137bba34b2dc13a921d82e94e431e972b9a17a9d2da17ae9e1b024f92cf86ca')

prepare() {
  # disable the broken version check, which consistently provides false positives and leads to users flagging the package ood
  # we rely on imagemagick to communicate breaking changes with soname changes
  patch -Np1 -d $_name-$pkgver -i ../$pkgbase-3.7.0-skip_version_check_by_default.patch

  # setting package version: https://bugs.archlinux.org/task/64185
  sed -e "s/@PACKAGE_VERSION@/$pkgver/" -i $_name-$pkgver/php_imagick.h $_name-$pkgver/package.xml

  # remove broken test
  rm "$_name-$pkgver/tests/316_Imagick_getImageKurtosis.phpt"

  cp -av $_name-$pkgver "${pkgname[1]}-$pkgver"
  (
    cd $_name-$pkgver
    phpize
  )
  (
    cd "${pkgname[1]}-$pkgver"
    phpize-legacy
  )
}

build() {
  (
    cd $_name-$pkgver
    ./configure --prefix=/usr
    make
  )
  (
    cd "${pkgname[1]}-$pkgver"
    ./configure --prefix=/usr
    make
  )
}

check() {
  export NO_INTERACTION=true
  make -k test -C $_name-$pkgver
  make -k test -C "${pkgname[1]}-$pkgver"
}

package_php-imagick() {
  depends+=(php)
  backup=(etc/php/conf.d/$_name.ini)

  cd $_name-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 ../$_name.ini -t "$pkgdir/etc/php/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.php -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}

package_php-legacy-imagick() {
  depends+=(php-legacy)
  backup=(etc/php-legacy/conf.d/$_name.ini)

  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
  install -vDm 644 ../$_name.ini -t "$pkgdir/etc/php-legacy/conf.d/"
  install -vDm 644 {ChangeLog,CREDITS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 examples/*.php -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
