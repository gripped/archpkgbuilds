# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_pkgname=dkimpy
pkgname=python-dkim
pkgver=1.1.7
pkgrel=1
pkgdesc='Python library that implements DKIM and ARC email signing and verification'
arch=(any)
url=https://launchpad.net/dkimpy
license=(ZLIB)
depends=(python-dnspython)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-authres
  python-pynacl
)
optdepends=(
  'python-aiodns: for asycnio'
  'python-authres: for ARC'
  'python-pynacl: for use of ed25519 capability'
)
source=("git+https://git.launchpad.net/$_pkgname#tag=$pkgver")
b2sums=('ffcd7e439adcca4c7a8d73455264b83b3077c6010b6c76762647f36ca2c340ec7a13c83b1b953a86481a39ab0f1d574a143cca4030229a23eea1fe68a64dfcf5')

build() {
  cd $_pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_pkgname
  python -m unittest dkim.tests.test_suite
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
