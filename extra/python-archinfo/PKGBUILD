# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.193
pkgrel=1
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
  python-pypcode
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-pypcode
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c9db39c5a23dc030100c177f2d76eb7152fdc8cd63c0e01e315f92cd0208a900ce107c80482677b3e7f1ca137a048582752d497399996b3abcc9e34d7a37e411')
b2sums=('9a14450ffb86299cf1f896e81f54eeea87c75560d4543f6fed92ca4e0e5609f8b5a3df9cd3c23e7a822c49f2df083ae1a009da09134f6bd3272f98e3741bf87b')

build() {
  cd "${_pyname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pyname}-${pkgver}"
  python -m venv --system-site-packages .venv
  .venv/bin/python -m installer dist/*.whl
  .venv/bin/python -m pytest tests
}

package() {
  cd "${_pyname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
