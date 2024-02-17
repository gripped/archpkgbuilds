# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyu2f
pkgver=0.1.5
pkgrel=7
pkgdesc="U2F host library for interacting with a U2F device over USB"
url="https://github.com/google/pyu2f"
license=('Apache-2.0')
arch=('any')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-pyfakefs' 'python-pytest')
source=("https://github.com/google/pyu2f/archive/$pkgver/$pkgname-$pkgver.tar.gz" "pyfakefs-compat.patch" "use-unittest-mock.patch")
sha512sums=('ddb15bb1d917117a2b19ad169ac0f8b8c7667d7ef8ee4c266cc30326429bb3627d41d84dc390ce0036d0b0f110e1d2da47d06d4e4d03a8be98cedb5ea3112246'
            'ef12d29114292918d5820ff129cfcfa820637464e1945252c5fca80be40cfb8d5df5d57efc8dac748d1b952acca177c953a69a3a16d096c92bd8a61687b80fe0'
            '52d6544ba242bf762e75520b0f11656e7fb0abdbf229a7735e3621244c95a9f2926503dfee69c368dcf9464879c70079a3032cfc4fc086f6972b3b74be9007f7')

prepare() {
  cd pyu2f-$pkgver
  patch -Np1 -i ${srcdir}/pyfakefs-compat.patch
  # Use Python's builtin unittest.mock
  patch -Np1 -i ${srcdir}/use-unittest-mock.patch
}

build() {
  cd pyu2f-$pkgver
  python setup.py build
}

check() {
  cd pyu2f-$pkgver
  pytest
}

package() {
  cd pyu2f-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
