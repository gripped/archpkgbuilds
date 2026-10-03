# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: alienzj <alienchuj@gmail.com>

pkgname=python-pygraphviz
pkgver=2.0.3
pkgrel=1
pkgdesc='Python interface to Graphviz'
arch=(x86_64)
url=https://pygraphviz.github.io
license=(BSD-3-Clause)
depends=(
  graphviz
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  swig
)
checkdepends=(python-pytest)
source=(
  "$pkgname::git+https://github.com/pygraphviz/pygraphviz#tag=pygraphviz-$pkgver"
  use-system-swig.patch
  remove-spurious-rpaths.patch
)
sha512sums=('4196da97d59d78362d7879e13083f19c91e875c35bbae43cde0511610ff05f7232a4ddbd520637a65bef5502aa4af9167a1341b7c611ab169d7b9a0b27d21156'
            'b3bffed04197ff87a791afdc9c838baebbb8aa91aed506a1a503e92131fea4cc06933c330a56e6d07aff952abba618c9a9d664732233c10d0caaedb6d398d7d1'
            '7eff04caa9fd44981082c6fc72426e0cecfdad79a694ddee1d510817bbe0495c113ee903006e9cfc3cd66a258f04bb8ab49665021860cc9a3d740811598b2b79')
b2sums=('989906399f83ca3a612b730529d138c807ae1f902cb91977d6c9a18c778a68bceda6270b3e87470ba07b36d4ee5a5bcbcb4e8fdf7cfceefa13f1373c71c8e9e9'
        'a1129a32ba16c0dd33de9f2661d780e75ba010eb5f644cdf676932a0469ecd4e980f5defce8a87ab7dbf9397c7d870aaee8f01c976b13d9ebcbfbcbe7414110e'
        '9560a46a7f0f1e0109e3d24fba5296ade67079227c3fc1478b08bf369cff683122806b872637dc80a3a76bb38b5243b4040444b8a171a548123dfd713e3f4648')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/use-system-swig.patch"

  patch -p1 -i "$srcdir/remove-spurious-rpaths.patch"
}

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

  pytest --doctest-modules --durations=10 --pyargs pygraphviz
}

package() {
  depends+=(glibc)

  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
