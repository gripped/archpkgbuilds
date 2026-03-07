# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.1.1
pkgrel=1
pkgdesc='Python interpreter discovery'
arch=(any)
url='https://python-discovery.readthedocs.io'
license=(MIT)
depends=(
  python
  python-filelock
  python-platformdirs
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-setuptools
)
source=("$pkgname::git+https://github.com/tox-dev/python-discovery#tag=$pkgver")
sha512sums=('0278032eb7e0177860af5cb6ed286b917edc17f39492fdc5808bc04ce65e6b1d5381ec2bd3d958d1ea9067e178e39adb0b05450ecc3c2e1cdd8a7bd905a1cdce')
b2sums=('19be925c086b5108b0bf346165fd38129aecd990c2f9a96e79473cd801ba53a8f149118fa07d58252b452362adbeb91330db66e417c2e5176309d160c3e256cc')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
