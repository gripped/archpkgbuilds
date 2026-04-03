# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: RocketDev <ma2014119@outlook.com>

_pyname=archinfo
pkgname=python-${_pyname}
pkgver=9.2.194
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
sha512sums=('40a97a2f5063d31196a0e7d792311e9a63f5ef5af70d721bdbfe46643f5b500927d4d1af4bc8ee2bc19f9c8c1c742a00901f5421cf678dbca58b084b79023506')
b2sums=('3ee0f468474874ac34f41dc6a91a4c62006a7dddb95598c75c862699ed4b522fbc204496507726cfd01bbdc0c575dc76650051008f87d58b6da94c6154123442')

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
