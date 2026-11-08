# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ilya Elenskiy <elenskiy.ilya@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-reactivex
pkgver=6.1.0
pkgrel=1
pkgdesc='Reactive Extensions for Python'
arch=(any)
url=https://reactivex.io
license=(MIT)
depends=(
  python
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  tk
)
source=(git+https://github.com/ReactiveX/RxPY.git#tag=v${pkgver})
b2sums=('301d6a2c29c45c6c833c0e107ed8d92230ebb5d9ed68c275b4b0efb9f81cbd12337c5242bc758d43b6e415e50a3e300e2351ff6bea0be46d4b73cd419c1fcf74')

prepare() {
  cd "${srcdir}/RxPY"
}

build() {
  cd RxPY
  python -m build --wheel --no-isolation
}

check() {
  cd RxPY
  python -m pytest
}

package() {
  python -m installer --destdir="${pkgdir}" RxPY/dist/*.whl
  install -vDm 644 RxPY/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
