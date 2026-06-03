# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-distlib
pkgver=0.4.1
pkgrel=1
pkgdesc='Low-level functions that relate to packaging and distribution of Python software'
arch=(any)
url='https://distlib.readthedocs.io'
license=(PSF-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-tests)
source=(
  "$pkgname::git+https://github.com/pypa/distlib.git#tag=$pkgver"
  remove-version-constraint.patch
)
sha512sums=('a54072326ec132ffce85434f784567a387069ccf9e26b01a4f277f406998f603aed07e14107c4510aae2468bdff5dc1854d75f31a3bb7323d9aa3519a29cd55a'
            '3d73106d55fbb8ad200f183decd5eb817e0f67c422ce41759ecc0e55d1387e2dae405a9872781215e965c5f87957111d6dd84dff9f36056d2b4c812b78b2d0cd')
b2sums=('4c21a63fcb02ff9ab12b76da4d168bb5cd38e7887e24cecd5d61f81bd7c34942828dc518664e13f12263e98a42eb4947ee46faef9ee8d0838ab36d357f5c62f1'
        '39032bd60d316254ead198f33c0295bd61c661dc6cc7fe4610f84063d182fbf3b6ccb019e8ffcdec89ea395c47fed36dc78dc7a646dd0f36b0b8fd4ad3e3cbfc')

prepare() {
  cd "$pkgname"

  # do not bundle executables of unknown provenance
  rm distlib/*.exe

  patch -p1 -i "$srcdir/remove-version-constraint.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install$site_packages"

  # if it's not relevant, why does it exist?
  # https://github.com/pypa/distlib/commit/93baffeaa1773796d802bb761607a6466790dcba
  export SKIP_EXT_PACKAGE_DATA=1

  python tests/test_all.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
