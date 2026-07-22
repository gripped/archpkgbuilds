# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
_name=${pkgname#python-}
pkgver=7.2.2
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=(any)
url=https://github.com/collective/icalendar
license=(BSD-2-Clause)
depends=(
  python
  python-dateutil
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
checkdepends=(
  python-hypothesis
  python-pytest
  python-pytz
)
source=(
  "git+$url.git#tag=v$pkgver"
)
b2sums=('5f3a489f05b39c5a97472e936ace0d33b5b381504ee85995a8eecdb37885e0740fa5947f0b6d65c5aa6141fc4de0d623068b6fc3208db63ef86ca8cdefbac096')

prepare() {
  sed '/tzdata/d' -i $_name/pyproject.toml
}

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # https://github.com/collective/icalendar/issues/763
  pytest -v -k 'not test_we_can_identify_dateutil_timezones and not test_can_identify_dateutil and not test_timezone_names_are_known[tzp_0-America/Coyhaique]'
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst CONTRIBUTING.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$site_packages/$_name-$pkgver.dist-info/licenses/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"

  rm -frv "$pkgdir/$site_packages/$_name/tests/"
}
