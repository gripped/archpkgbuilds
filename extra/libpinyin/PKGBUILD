# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yangtse <yangtsesu@gmail.com>
# Contributor: WU Jun <quark at lihdd dot net>

pkgname=libpinyin
pkgver=2.10.0
_modelver=20
pkgrel=1
pkgdesc="Library to deal with pinyin"
arch=('x86_64')
url="https://github.com/libpinyin/libpinyin"
license=('GPL-3.0-or-later')
depends=('kyotocabinet' 'glib2')
makedepends=('git' 'gnome-common')
source=("git+https://github.com/libpinyin/libpinyin.git#tag=$pkgver"
        "$pkgname-model$_modelver.text.tar.gz::https://downloads.sourceforge.net/libpinyin/model$_modelver.text.tar.gz")
noextract=("$pkgname-model$_modelver.text.tar.gz")
sha512sums=('b6ad5ea8119e2adab3661879f8907b4ead0dbed3c84f25d8e1362cefbeee16115243362b7bee5391cec57c5af31e4b8f8e36da3052749c631132db0373c6621f'
            'ed4d0607ad35e0e7ea424670539ddcd81a2b03c1da914b9c00cb748cf065f29471502d40b9a189852001da1fb9178c3bcc4675d7efebea5d081d78bfeee9b5d6')

prepare() {
  cd libpinyin

  ln -s "$srcdir"/$pkgname-model$_modelver.text.tar.gz data/model$_modelver.text.tar.gz
  sed -i "/wget.*model$_modelver\.text\.tar\.gz/ d" data/Makefile.am
}

build() {
  cd libpinyin
  ./autogen.sh --prefix=/usr --with-dbm=KyotoCabinet --enable-libzhuyin
  make
}

package() {
  cd libpinyin
  make DESTDIR="$pkgdir" install
}
