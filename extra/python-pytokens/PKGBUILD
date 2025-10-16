# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pytokens
pkgver=0.2.0
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
source=(
  "$pkgname::git+$url#tag=$pkgver"
  no-coverage-testing.patch
)
sha512sums=('4994a41778e189521ecaf70c9e835044fe02f143c4fc787ec130fd02ba29591ac8052c97bacd162f014fdf1c0e5b23f999ea948667a655f19a44b9c45b1c3f9e'
            '6709c47b15b64739b2b3d9cda874bd657d9a0a587b8d26f1328c4b5bf1ad69fec8a8f856bd87e001fa6a15a4a80a728fb1695271b5da38d90fe28275c645557e')
b2sums=('a59f4b365edb2f70d91758ef6e1b8138f6f3fcf29f4b2bd0952d0a76968003d089f965a5a31bda343b4eed0a0455570e40c04b9f4376f9e62df2bf1ce23543e7'
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
