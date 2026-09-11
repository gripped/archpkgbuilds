# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=psygnal
pkgname=python-$_name
pkgver=0.16.0
pkgrel=1
pkgdesc="Python observer pattern (callback/event system) modeled after Qt Signals & Slots (but independent of Qt)"
arch=(any)
url="https://github.com/pyapp-kit/psygnal"
license=(BSD-3-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-anyio
  python-attrs
  python-dask
  python-numpy
  python-pydantic
  python-toolz
  python-wrapt
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('7623690bfce4834ac0cfc2c6dd263ed9d5945f99223e4728b01d38da60187097794d72dc908d0ae8c71630c3e4cecd7e62d97847f2937a94eeed3077cc24b20f')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
  )

  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
}
