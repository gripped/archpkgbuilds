# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=python-dulwich
_name=${pkgname#python-}
pkgver=0.22.4
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
  python-gpgme
  python-paramiko
)
optdepends=(
  'python-fastimport: for fast-import support'
  'python-gpgme: for PGP signature support'
  'python-idna: for HTTPS support via urllib3'
  'python-paramiko: for use as the SSH implementation'
  'python-pyopenssl: for HTTPS support via urllib3'
  'python-pyinotify: to watch for changes to refs'
)
source=("git+https://github.com/jelmer/dulwich.git#tag=dulwich-$pkgver")
b2sums=('d32fb5007241727a55539a6a8fab705ec5ca50b8549e7800e310a7453a568e76ac703580132622efc08d40fcb787c84df6e6a24e8b69d039d3aed03974e924dc')
validpgpkeys=('DC837EE14A7E37347E87061700806F2BD729A457') # Jelmer Vernooĳ <jelmer@jelmer.uk>

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/dulwich:$PYTHONPATH" python -m unittest -v tests.test_suite
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
