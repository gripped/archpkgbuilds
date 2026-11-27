# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

# As of 2.9.0, upstream is tagging on GitHub and commits are signed with the
# generic GH key, not the project member's own keys. Commit pinning and key
# checking is disabled until there is something of substace to check.

# _commit=db9d018944c41ddc740015cf5f64717c2ba64a5c

pkgname=python-dateutil
pkgver=4.0.0
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=(any)
license=(BSD-3-Clause Apache-2.0)
url="https://github.com/dateutil/dateutil"
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
  python-hatch-fancy-pypi-readme
)
checkdepends=(
  python-freezegun
  python-hypothesis
  python-pytest
)
# source=("git+$url.git?signed#commit=${_commit:-$pkgver}")
source=("git+$url.git#commit=${_commit:-$pkgver}")
sha512sums=('4a5439c48ae0e93681dc92c808b0784328b61c1d4c838ada4cac0d6dd497f3f62be38e8f96ae3a1062b4d84a9cc4a1b8598dad5078e48d727e226df94655ba48')
b2sums=('e08033bd700d6d0e7788ce188d673b51ac3f7cfc36aeda5465bcba5b57dbf758a78111e7c8163472d67b4c7ff42180bef9e9dbc5a6b36e3047b2175ca52516b0')
# validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # Mario Corchero <mariocj89@gmail.com>

prepare() {
  cd dateutil
}

build() {
  cd dateutil
  python -m build -wn
}

check() {
  cd dateutil

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
    # https://github.com/pytest-dev/pytest/issues/5678
    -W ignore::pytest.PytestUnknownMarkWarning
    # Fails on build server
    --deselect tests/test_tz.py::test_tzlocal_local_time_trim_colon
    # ?
    --deselect tests/test_tzfile.py::test_gettz_local_abbreviation_without_time_zone_data
  )
  pytest "${pytest_options[@]}"
}

package() {
  cd dateutil
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
