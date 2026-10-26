# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ilya Elenskiy <elenskiy.ilya@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-reactivex
pkgver=6.0.0
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
b2sums=('f45df0f8a1ad172d5e7230c2a27d946da3cee5dec8b8df54f1c6c0c3f09c4615042a69ffbb7e96297051b8f248ea0fec0e492c2b081f9213a841d02805782392')

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
