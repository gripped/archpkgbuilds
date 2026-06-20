# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-py7zr
pkgver=1.1.3
pkgrel=1
pkgdesc='Pure Python 7-zip library'
arch=(any)
url='https://github.com/miurahr/py7zr'
license=(LGPL-2.1-or-later)
depends=(
  python
  python-brotli
  python-brotlicffi
  python-psutil
  python-multivolumefile
  python-pybcj
  python-pycryptodomex
  python-pyppmd
  python-texttable
  python-inflate64
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  p7zip
  python-requests
  python-py-cpuinfo
  python-pytest
  python-pytest-benchmark
  python-pytest-httpserver
  python-pytest-timeout
)
optdepends=()
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('c61ce14c89918a18c282005b0383ecf703aeca78c165a671579a713662b7b9f1d94fcd74af3038ee8e371c35b9f6231440697fe9ec31ca568dfd03a96b8441c4')
b2sums=('7160ad1149d1933cad397c7ae46ed82075272108b268455e72ff00ad6727ac69c679df087bbdbc40cd6245e2f5543d3c8e5c5b7ade4468d8ab138ee5e41c0fe1')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local pytest_options=(
    -vv
    -rsx
		--deselect tests/test_concurrent.py
		--deselect tests/test_extra_codecs.py
		-m 'not benchmark and not remote_data'
  )
  
  pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
