# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ilya Elenskiy <elenskiy.ilya@gmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=python-reactivex
pkgver=4.1.0
pkgrel=2
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
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
_tag=7747af34f3e1fbac2496231e3c2edf56ff704051
source=(git+https://github.com/ReactiveX/RxPY.git#tag=${_tag})
b2sums=('57c85f61138790a7a2614d7e9520dc7ea3891a39c0f548fe3141fe4bce57c1a6e45cb62808b1723c904a68e4d5adb2b7131cc78576558775c98cff89f6f6884a')

prepare() {
  cd "${srcdir}/RxPY"
  # Python 3.14 support
  git cherry-pick -n 78f4a594ca2b0e27ad93ec0e1b1c0d56d5d6540d
}

pkgver() {
  cd RxPY
  _version=$(git describe --tags | sed 's/^v//')
  sed "s/0.0.0/${_version}/" -i pyproject.toml
  echo "__version__ = \"${_version}\"" > reactivex/_version.py
  echo ${_version}
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
