# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>

_name=jq.py
pkgname=python-jq
pkgver=1.12.0
pkgrel=1
pkgdesc='Python bindings for jq'
arch=(x86_64)
url=https://github.com/mwilliamson/jq.py
license=(BSD-2-Clause)
depends=(
  jq
  python
)
makedepends=(
  cython
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url.git#tag=$pkgver")
b2sums=('ea6f336539ebda1971eb85f0b87c161401430a7c5611b390c9185ae5dfe1d4f09877446f623d64b1d10e590304b7be81c3c383709dbb5d039ceb329cd944ff91')

build() {
  cd $_name
  cython -3 jq.pyx
  JQPY_USE_SYSTEM_LIBS=1 python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd $_name
  PYTHONPATH=build/lib.linux-$CARCH-cpython-$python_version pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/jq-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
