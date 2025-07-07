# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
_name=${pkgname#python-}
pkgver=0.23.2
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=(x86_64)
url=https://www.dulwich.io
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(python-urllib3)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-rust
  python-wheel
)
checkdepends=(
  python-fastimport
  python-gevent
  python-gpgme
  python-merge3
  python-paramiko
  python-pytest
)
optdepends=(
  'python-fastimport: for fast-import support'
  'python-gpgme: for PGP signature support'
  'python-idna: for HTTPS support via urllib3'
  'python-merge3: for merge support'
  'python-paramiko: for use as the SSH implementation'
  'python-pyopenssl: for HTTPS support via urllib3'
  'python-pyinotify: to watch for changes to refs'
)
source=("git+https://github.com/jelmer/dulwich.git#tag=dulwich-$pkgver")
b2sums=('6e2927bd558e9a573c158d2db24cb2b200373f4f115609aa141014165d9b0b15de29f02bfff2347fff6e41b89063b5a6e1d3d2efb63db1e2312daf9cc0839dfa')
validpgpkeys=(DC837EE14A7E37347E87061700806F2BD729A457) # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local pytest_options=(
    -v
    --ignore tests/contrib/test_swift_smoke.py
    --deselect tests/test_porcelain.py::AddTests::test_add_symlink_absolute_to_system
  )

  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
