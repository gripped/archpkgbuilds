# Maintainer: Bruno Pagani <archange@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=toolz
pkgname=python-toolz
pkgver=1.0.0
pkgrel=2
pkgdesc="A functional standard library for Python"
arch=(any)
url="https://github.com/pytoolz/toolz/"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "$url/archive/$pkgver/$_name-$pkgver.tar.gz"
  "$pkgname-$pkgver-shakespeare.txt::http://www.gutenberg.org/files/100/100-0.txt"
)
sha512sums=('750e153fe3dc072b9ab6e541660c4a8ba8b51b2ef0ebd78cb2adf75fa915ac80f82fe3fa973aa8873df7b37ff1147594253dea9d19b012f807f18e9038f76f05'
            '32db437f8646b5bc23247aa44057f2b57540f13ac8f0cdc3a32a491cb65dafdcbeb19651c1de716c4398c3431fe24f0f15fa588fbf129d6535a8dc98d729158d')
b2sums=('29a8870c8f9b1a3bbdaecd2db14f3cdaeaed04c5385deef57c259bd0c6641f8647be0dd2b73711c829fe62dc0aa2ab6b1f683f040d01ee0aed100eb0f20a3416'
        '7733541d93da653b98028844618924e4041066c10c3c6f56db02eafdecec2e34f7d23ce8cc659b76bfb4e5bbdadd48ed69fdff7a40be1de619680fdd542760c4')

prepare() {
  cp "$pkgname-$pkgver-shakespeare.txt" "$_name-$pkgver/bench/shakespeare.txt"
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.rst
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
