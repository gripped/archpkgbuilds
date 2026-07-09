# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: alienzj <alienchuj@gmail.com>

pkgname=python-pygraphviz
pkgver=2.0
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
sha512sums=('171a1d1491faa4f23626445e8fafbd6740233c3477b6f505fdaf5e61dbf6e877da3a914f8e05244ed7dd103a42d999dd19d6f857ee03c8fef543fb56e683110f'
            'b3bffed04197ff87a791afdc9c838baebbb8aa91aed506a1a503e92131fea4cc06933c330a56e6d07aff952abba618c9a9d664732233c10d0caaedb6d398d7d1'
            '7eff04caa9fd44981082c6fc72426e0cecfdad79a694ddee1d510817bbe0495c113ee903006e9cfc3cd66a258f04bb8ab49665021860cc9a3d740811598b2b79')
b2sums=('1b59f9ef3cb52bcfe028c58f46b1c1cb03b87dbf6c223d00316d9563d4973b4e832f02aa42b400776b91adf10c755a903982952700e26e19f89329f38668ff45'
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
