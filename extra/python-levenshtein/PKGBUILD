# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.27.0
pkgrel=1
pkgdesc='Python extension for computing string edit distances and similarities'
arch=('x86_64')
url='https://github.com/rapidfuzz/Levenshtein'
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'python'
  'python-rapidfuzz'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-scikit-build-core'
  'cython'
  'rapidfuzz-cpp'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2b1faa4efbca28689c4e1d38b7b4f370a8236195b36b5e7ce474848ae47d6ccd44b34693ad61c68d4c44374cfb3859238a78e032fa0241ca89bf336435cc5b6a')
b2sums=('98a075bf6a85f30489104bbfc89ebadcbb977df9382299f1a30ccd45e508b204519c034e25d7d8f923ac9833eba06525238b043d69d1574e7510b0d524ac50c9')

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
