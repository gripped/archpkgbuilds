# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: scj <scj archlinux us>

pkgname=python-levenshtein
pkgver=0.26.1
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
sha512sums=('1939c1a73062306eab6e25ac0096216f42891a1c1c7be90a8a862a1bd1a62f5d945c8ba39daa65a8cc834ac26169426777888b50820bc33ca282dce21c2ffd34')
b2sums=('e13810b819b875b641839e48f5db2822156f3c9a118b02dd37bdd1e780c5a841931f63aa023cde91ce5608629eef9967e2d40f0ae086c90504340a98dab5f010')

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
