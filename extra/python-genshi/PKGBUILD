# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-genshi
pkgver=0.7.12
pkgrel=1
pkgdesc='Toolkit for stream-based generation of output for the web'
arch=(x86_64)
url='https://genshi.edgewall.org'
license=(BSD-3-Clause)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/edgewall/genshi#tag=$pkgver")
sha512sums=('f0a21cba857635b21a1dc6fd1c694c04fe278196e9e8fb91846a42bbf70c8ca4f2dade4355cfb7917a1a72e4ac97cba8fd77a58910ce64da43482366c75b857e')
b2sums=('de2c65d95c559d079d3a8d2e2d480195b1bad7317d6287f50605301dd875e9e811f7689a50815400531c2e716c9ddc98cd2eaf0a8e7b4f0ac7b5b1eba1fdad63')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  # skip doctests
  pytest -v --import-mode=importlib -c /dev/null
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
