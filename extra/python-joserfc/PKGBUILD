# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-joserfc
# https://github.com/authlib/joserfc/releases
pkgver=1.0.4
pkgrel=1
pkgdesc='Implementations of JOSE RFCs in Python'
arch=(any)
url='https://github.com/authlib/joserfc'
# https://github.com/authlib/joserfc/blob/0.9.0/pyproject.toml#L8
license=('BSD-3-Clause')
depends=(python python-cryptography)
makedepends=(git python-build python-installer python-setuptools python-wheel
             python-pycryptodome)
checkdepends=(python-pytest)
optdepends=(
  'python-pycryptodome: for draft RFCs'
)
# HACK: commit=$pkgver works during fetching sources as upstream repo uses non-annotated tags,
# and we want to PGP verify commits, not tags
source=("git+$url?signed#commit=$pkgver")
sha256sums=('751e70c631110f18fcddd696b48fe0dcc7a6c540e2752a76ffa4b52827e8815f')
validpgpkeys=(
  # A key in https://github.com/lepture.gpg
  '72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C'
)

pkgver() {
  cd joserfc
  git describe --tags
}

build() {
  cd joserfc
  python -m build --wheel --no-isolation
}

check() {
  cd joserfc
  pytest
}

package() {
  cd joserfc
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
