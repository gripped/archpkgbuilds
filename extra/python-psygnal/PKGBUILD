# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=psygnal
pkgname=python-$_name
pkgver=0.15.1
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
b2sums=('62e732f40a58acb8816e5642462f285808b6831cad94197902f05fbd1fb5c416f02b742c0de262e19c80aaabbc2a1146d65535a6020c0d170dc70d4be53252bf')

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
