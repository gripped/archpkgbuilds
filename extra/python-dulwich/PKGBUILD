# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
_name=${pkgname#python-}
pkgver=0.25.0
pkgrel=1
pkgdesc='Pure-Python implementation of the Git file formats and protocols'
arch=(x86_64)
url=https://www.dulwich.io
license=('Apache-2.0 OR GPL-2.0-or-later')
depends=(
  python
  python-urllib3
)
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
  'python-rich: for colorized diff support'
)
source=("git+https://github.com/jelmer/dulwich.git#tag=dulwich-$pkgver")
b2sums=('7f2503ef8df21326c14ecdbcc7ca3c3458d4c5c09ac47879d36e6bd337964bc6da765b0c7a979a8fdb0d16bd3314d401740abd2d2f189d9414db60aafae2d430')
validpgpkeys=(DC837EE14A7E37347E87061700806F2BD729A457) # Jelmer Vernooĳ <jelmer@jelmer.uk>

prepare() {
  cd "$_name"
  # Fixes test test_sha256_pack.py::SHA256PackTests::test_pack_index_v1_with_sha25
  git cherry-pick -n 790d9df61ad2c135ec5289d5c91ca5fd7d3b2098
  # Fixes tests failing if build in project absolute path, see:
  # https://github.com/jelmer/dulwich/pull/2055
  git cherry-pick -n e133c69c8bf203469a50cfb83b7693b50d645e81

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

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
  cargo test --frozen --all-features
  pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
