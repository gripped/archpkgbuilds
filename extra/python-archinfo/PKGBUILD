# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=10.0.6
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
  python-pypcode
  python-pytest
  python-pytest-xdist
  python-pyvex
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('cf293ed11c2c1b1c4bf6e42ffbb8bf7c1c2c8f77a3a6f0b6c841497f24bc15a68fcef494fbcd73ba45dd9872cb3c06f32ef38469c642202096ea9953d384c9c7')
b2sums=('6e905295ebf312981c020e9482c625e73aa546eff6e1dfff9291937c365f5ead004faf04ec9fd751275ca0ea88f6a462e539c41eab2568b4dc904bbb7f782953')

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
