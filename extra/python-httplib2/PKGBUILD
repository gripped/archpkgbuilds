# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Nicolas Quienot <niQo@aur>
# Contributor: Jesse Young <jesse.young@gmail.com>
# Contributor: Anton Eliasson <devel@antoneliasson.se>

pkgname=python-httplib2
pkgver=0.31.1
pkgrel=1
pkgdesc='Comprehensive HTTP client library, supporting many features'
arch=(any)
url='https://github.com/httplib2/httplib2'
license=(MIT)
depends=(
  ca-certificates
  python
  python-pyparsing
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  flake8
  python-pytest-forked
  python-pytest-timeout
  python-pytest-xdist
  python-pytest-randomly
  python-cryptography
  python-pysocks
)
optdepends=(
  'python-pysocks: SOCKS proxy client support'
)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  use-system-certificates.patch
  remove-cov.patch
)
sha512sums=('ebad0739be040bfbf55c7ed407ca4eb70a9da4037ee804343db77d55ad174fd796c3d608646d57ff75582903aaf855b64b75154de365f799fa3817af2507ecf9'
            '99b4d3ad273f531a0ddf429015a59263e7e79754cd404580427cd7a0d8ad6455096ff49a3fbf60009448d066925b9a10255d0d4b3e75d2a9b6c88cbd6da5bb34'
            '19dbeba0a1c86a6ec63780a5d302a68c972cbf9cdbabbfb7ced0a534bcea10bfebfbdd35aad49d9786d695246e3cc6261df7986abf5cddb4d861fbbb1a1e1d3e')
b2sums=('4b09459394b21c8de3acbc51f543d15f45039dcba623d7b7a4205ca141aaa88a6f303578a17c808ada950d3330002fa7f0485a6669eea617eb2231418c4b2e1e'
        '532f8208a57a2903d804ecda0e7f5076d300a3e1029c4effc29c6bb93683aaa283ae2f658c4be455d001e94afdcfbf331e06f19ac3a4c96db14210d185f5e904'
        '0886d5bc2d150b391333a4555f7a90b33a55f101c8f2568eedda61872f81a5c02748fd19184c05f2f6dc60889b5c84222a7f79b90b9ab14fb68de3eb8ce3cd49')

prepare() {
  cd "$pkgname"

  # use system ca certificates
  patch -p1 -i "$srcdir/use-system-certificates.patch"
  rm -vf httplib2/cacerts.txt

  # do not use python-pytest-cov
  patch -p1 -i "$srcdir/remove-cov.patch"

  # patch requirements to allow newer versions of checkdepends
  sed -e 's/==/>=/' -i requirements-test.txt
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  # test_client_cert_password_verified fails with cryptography 36 https://github.com/httplib2/httplib2/issues/221
  PYTHONPATH=build/lib pytest -k 'not test_client_cert_password_verified'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
