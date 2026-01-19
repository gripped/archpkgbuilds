# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-pytokens
pkgver=0.4.0
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
  mypy
)
checkdepends=(python-pytest)
source=(
  "$pkgname::git+$url#tag=$pkgver"
  no-coverage-testing.patch
)
sha512sums=('3b805739e91d4a6e10c7b2dd5d1c228e9cda225ff30e3d905b45212373213482130e38bed17be37058215064e7e4f3aa7e56cc19b8b68957a0b9e38e23ae03a7'
            '6a0640f25be3bcf175a824702c926463a3be3cf5548b2e031fca0752763979242583ddf67d1f8cba60aa3867384ae8a661f50f8bb1123de4940113d9d34006b1')
b2sums=('6791a928d333f572f4e0075046313056a3c0d470867baba9670f68ecc0b5c6ba959ea35286e5be1bf840568bf6700762b85f8c318fa7568ec81108600d38e31f'
        '30475636dcc667338995990446e965edd1cce9124bb00d9cca1a3dd32b49b858895a2001e1b0d16e8ed5c496cb5c11053766f130883ab6bc1e79890ed8e00097')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/no-coverage-testing.patch"
}

build() {
  cd "$pkgname"

  # skip compilation, seems that there are 4 .so files generated
  PYTOKENS_USE_MYPYC=0 python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporarily install wheel
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
