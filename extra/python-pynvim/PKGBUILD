# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=python-pynvim
pkgver=0.5.1
pkgrel=2
pkgdesc='Python client for Neovim'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python' 'python-msgpack' 'python-greenlet')
provides=('python-neovim')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
replaces=('python-neovim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/pynvim/archive/${pkgver}.tar.gz")
sha256sums=('d7ccc776f7fa73c509f7524a02692eb08753ad921c9cee8e1d671ef1701a6b16')

prepare() {
  sed -i "s/msgpack-python/msgpack/g" pynvim-${pkgver}/setup.py
}

build() {
  cd "${srcdir}/pynvim-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/pynvim-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 sts=2 et:
