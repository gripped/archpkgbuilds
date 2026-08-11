# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.27.4
pkgrel=1
pkgdesc='Python extension for computing string edit distances and similarities'
arch=(x86_64)
url='https://github.com/rapidfuzz/Levenshtein'
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
  libstdc++
  python
  python-rapidfuzz
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-scikit-build-core
  cython
  rapidfuzz-cpp
)
checkdepends=(python-pytest)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-version-constraints.patch
)
sha512sums=('1b7bc8b6d9216b589c5d959dac3efc78c254df0d48835507b18d9d812a496eb4d1fab46cb2f5441d5f7bd9cee7ec4b57e23226e25e4f7e3708c26519f2c2c2c9'
            '717cb36ec2e0b66303820dccd771b423cedfd5b30a57b52914cb5f1c2fa84cd064832cacaca5b81350eb83370f0f997e5012fa3c187f0f0b5b16b3d798e5e5b1')
b2sums=('89ee6295a927ed9291db6185fa7d2fe4ecf3fba9ff2bf51c6d3debf5265d7b73e149ec558845baec158915289d3c18bbf0b1517dec95ac6ed1c0de7118c59d23'
        '27e5d506d31becb2a1150b69e4b1fd683431f1a15ef9964cf09f4a5d4fa955202875a2a34925215b5fa595ec288b90971c01a62f4c4dacbc864b2f36beab3413')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
  sed -e 's|-m cython|-m cython --cplus|g' -i src/Levenshtein/CMakeLists.txt # Fix build with cython 3.2
}
build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
