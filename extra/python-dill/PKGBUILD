# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-dill
pkgver=0.4.0
pkgrel=2
pkgdesc='serialize all of Python'
arch=(any)
url='https://github.com/uqfoundation/dill'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=('python-objgraph: graph support')
source=("$pkgname::git+$url#tag=$pkgver" "fix-tests-3.14.patch")
sha512sums=('4e39a28c9d3ebcffffb8ccdb75fb3183fe9fc33c06105698d674a0245806b0aa82a2aeffcadf713defc6a32f71176c88876f542134f3715a8bbdcfb057b28444'
            'a8a6bd893ee141cb966ee710317589fb4c13b890b40346399f19b6b3839c54314079591e5166e4d338090a73eaa2685fa06697949780e4e359dca9e70f77f992')
b2sums=('faf256e2fcc5588a85aa15b05bcbb4438ac3f3da85681664746f49b67e7130f59f9bb954743e8290ba0fd200b8cbca4ac3d33b0c5c139fe8a5de0e8be07e79a9'
        '03c403c260a400dd94c05607fe32bdaa1e91945626347fb887259500e3f8544167d2d8c827385573566be0345d59626cff86e26a6e2411206c8b92d1778f4a01')

prepare() {
  # https://github.com/uqfoundation/dill/pull/717
  cd "$pkgname"
  patch -Np1 -i "${srcdir}/fix-tests-3.14.patch"  
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporarily install wheel
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  python dill/tests/__main__.py
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
