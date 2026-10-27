# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-lxml-html-clean
pkgver=0.4.6
pkgrel=1
pkgdesc='HTML cleaner from lxml project'
arch=(any)
url='https://lxml-html-clean.readthedocs.io/'
license=(BSD-3-Clause)
depends=(
  python
  python-lxml
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/fedora-python/lxml_html_clean#tag=$pkgver")
sha512sums=('f22ee52d95308d11e822e55d407a88f75d80d8641fa2b40b7600652960bc681ba19ae49d82d5475ce5575f4aa13e0fd4dfcd8a67dce7acbb9837c133e1bda699')
b2sums=('25374a3d37f9a399f9ae959f05a665d174a1486868cd20778970d77fba68cf2d0ca2f5322d392f980f80e00efde69710aaf84f6396b25f074c708025902c3f95')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  export PYTHONPATH=.

  # https://github.com/fedora-python/lxml_html_clean/issues/24
  local deselected=(
    tests/test_autolink.txt::test_autolink.txt
    tests/test_clean.py::CleanerTest::test_host_whitelist_invalid
    tests/test_clean.py::CleanerTest::test_host_whitelist_sneaky_userinfo
    tests/test_clean.py::CleanerTest::test_host_whitelist_valid
    tests/test_clean.txt::test_clean.txt
    tests/test_clean_embed.txt::test_clean_embed.txt
  )

  pytest -v ${deselected[@]/#/--deselect }
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
