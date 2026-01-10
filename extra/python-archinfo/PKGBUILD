# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.148
pkgrel=2
pkgdesc='Classes with architecture-specific information useful to other projects'
url='https://github.com/angr/archinfo'
arch=('any')
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
optdepends=(
  python-capstone
  python-unicorn
  python-keystone
  python-pyvex
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a3c92f0ec1284a937a7ba274cf00a859bc915964797a8d97a09130109972bcf031bb0164fede624ce22d11b428405a5518e02376e413a96a80eda20157200d77')
b2sums=('75b3d42dfd027ef0077cbca86c7597832b8ac20a806dcf8520be04626cc060307021213fc01d625554f61a74d4f0559a32f76b144040722cccd2dcb5f2340614')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
