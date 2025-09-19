# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pytokens
pkgver=0.1.10
pkgrel=1
pkgdesc='A fast, spec compliant Python 3.12+ tokenizer'
arch=(any)
url='https://github.com/tusharsadhwani/pytokens'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
# https://github.com/tusharsadhwani/pytokens/issues/4
source=(
  "$pkgname::git+$url#commit=71098b1756960cfac1abd987b94eec1237c92053"
  no-coverage-testing.patch
)
sha512sums=('fc7665231649ccfb95bb8dd21198356281b0478dc6b0397454df5af93666c3cdf3ee26b7d5166e19d80eafe79c933ade7333dcff9f3213ee84d3167cf0ccae51'
            '6709c47b15b64739b2b3d9cda874bd657d9a0a587b8d26f1328c4b5bf1ad69fec8a8f856bd87e001fa6a15a4a80a728fb1695271b5da38d90fe28275c645557e')
b2sums=('833c1e753362273e842f52d345c57d761ae80b0f4ce96f5350c91b9ab116b4f9a9d75dc9a0f9a72a55dbdfbd7dda959c2d80197b461570f7b03eb5d8c8344b78'
        '3f9764488acbc4bf120ffdc62a29fe8ddf5935374be8e3b0beeb1524fa8979fd6ddfda428c852140447af79135333fd6dba3ed0cf8d264f494862fcf9f2fba27')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/no-coverage-testing.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

#check() {
#  cd "$pkgname"
#
#  # temporarily install wheel
#  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  export PYTHONPATH="$(pwd)/tmp/$site_packages"
#
#  pytest -v
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
