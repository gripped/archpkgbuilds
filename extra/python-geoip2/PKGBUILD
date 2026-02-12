# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-geoip2
pkgver=5.2.0
pkgrel=1
pkgdesc="MaxMind GeoIP2 API"
url="https://github.com/maxmind/GeoIP2-python"
license=('Apache')
arch=('any')
depends=(
  python
  python-aiohttp
  python-maxminddb
  python-requests
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-uv-build
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-httpserver
)
source=(
  git+https://github.com/maxmind/GeoIP2-python.git#tag=v$pkgver
  unpin-uv-build-dependency.patch
  git+https://github.com/maxmind/MaxMind-DB.git
)
sha512sums=('fd6eee433ab03e64e4441418605dade9167e29f6221d91f5c8b16f7b2ba97e8b40f3090a2cf6893f5ca057dd1abec3d774ca5b37dab44fd4971bdd585d48bc2c'
            'e2cf1eb29cfed5f279c0bc6d031e73e4dab2a2fb48dc57295f068bdf472036c7d50373332a0c5d6c9a2331faf77ea6f984159da287d62ff51184e358ccd9db2b'
            'SKIP')

prepare() {
  cd GeoIP2-python
  git submodule init
  git config submodule.tests/data.url "$srcdir/MaxMind-DB"
  git -c protocol.file.allow=always submodule update
  patch -Np1 -i ../unpin-uv-build-dependency.patch
}

build() {
  cd GeoIP2-python
  python -m build --wheel --no-isolation
}

check() {
  cd GeoIP2-python

  python -m installer -d test_dir dist/*.whl

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest
}

package() {
  cd GeoIP2-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
