# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=python-pynvim
pkgver=0.5.2
pkgrel=1
pkgdesc='Python client for Neovim'
url='https://github.com/neovim/pynvim'
arch=('any')
license=('Apache')
depends=('python' 'python-msgpack' 'python-greenlet')
provides=('python-neovim')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
replaces=('python-neovim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/pynvim/archive/${pkgver}.tar.gz")
sha256sums=('c86e304d55fc8996296554b959cad483aeaafb47e425ebe3a7d0f96e3222f035')

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
