# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.27.1
pkgrel=1
pkgdesc='Python extension for computing string edit distances and similarities'
arch=(x86_64)
url='https://github.com/rapidfuzz/Levenshtein'
license=(GPL-2.0-or-later)
depends=(
  glibc
  gcc-libs
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
sha512sums=('28f9dd11e65c2b630c6655c6da356aaa9704be8744998e002b38b45b0634c30dc126f0241f40ec7018418083d2b62914393245f60093a31a0997376510c9284f'
            '2bad306f521bc98d68b081452525495b4636adb279a5000079087d367fc51d0338791adc22e263fe1c28409b7b71f2826999b760131904168c5466b9c73d321b')
b2sums=('a29191627d57e36bc4324fb5ed9f9cd896d3e0efb4e9283abe1919af1758c636bc758d549a8cfb7258419e0eea17708df9e5e927f91706447fc68e04bde7d075'
        '956a77dcb66a4da7ab8ed51474b989b1246ac888151cef2b14ac1a47ad743421e2d60ed5ddd8554e232ccf1e421aa51c94c4688a6289edcdf838bc4c3ae857c9')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"
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
