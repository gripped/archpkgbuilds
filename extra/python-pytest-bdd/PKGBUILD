# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.2.0
pkgrel=2
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=(
  'python'
  'python-mako'
  'python-packaging'
  'python-parse'
  'python-parse-type'
  'python-pluggy'
  'python-pytest'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('python-setuptools')
source=(
  "git+$url.git#tag=$pkgver"
  # Fixes jrnl tests + pytest v8, see: https://github.com/jrnl-org/jrnl/issues/1879
  # From PR: https://github.com/pytest-dev/pytest-bdd/pull/690
  "fix-target-fixture-registration-post-pytest-8-1.patch::$url/commit/bc819bc17ed99331b7313c12f9535a23a3359ee4.patch"
)
sha512sums=('a6ed66fafc20967ae8609c95a56e98cacb6c30fcefc8b385952513f4e2f77cdc8a2ef87dc23b657fb8a8a7454ed3dee4cf0657a71e531f7f12184f6a55ccf4dc'
            'e9e1aa988c9803020ea63f731fb5469bcdbc5499ae0acefd0dfbc3fd930a9737347d3325170d0f5f2a704455a383568daac2efb2f58cf9831700292e015b3ea5')

prepare() {
  cd pytest-bdd
  patch -Np1 -i "$srcdir/fix-target-fixture-registration-post-pytest-8-1.patch"
}

build() {
  cd pytest-bdd
  python -m build -nw
}

check() {
  cd pytest-bdd
  # Hack entry points by installing it
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/$site_packages" \
    pytest --override-ini=addopts=
}

package() {
  cd pytest-bdd
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
