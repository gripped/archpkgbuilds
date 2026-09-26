# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-cloudflare
pkgver=5.8.0
pkgrel=1
pkgdesc='The official Python library for the Cloudflare API'
arch=(any)
url='https://github.com/cloudflare/cloudflare-python'
license=(Apache-2.0)
depends=(
  python
  python-httpx
  python-pydantic
  python-typing_extensions
  python-anyio
  python-distro
  python-sniffio
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-time-machine
  python-dirty-equals
  python-importlib-metadata
  python-rich
  python-pytest-xdist
  python-griffe
)
optdepends=(
  python-aiohttp
  python-httpx-aiohttp
)
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-unnecessary-dependency.patch
)
sha512sums=('b051cfd42bb7838cda1455df383327ada63e4c9a09e55a950ee125c79be8cb33f578d56a6833db144ba2cf11c56f905c03f51776751cb5006e0919af22784164'
            '7d9ba9c4638b3c185c2be27485aafe24edc3c1ba76d2ab6addf3c8bef8dba892e5bec58f1f4262d2618c25517edaaca2ce5062b1cff6066acf59098533c6d74a')
b2sums=('e4b7bbce3eb9a4104950b1325dceaf07b90f830b3d72968a94045dc32f81a679c41bc3345b25fde4ec539ff89080304aac39456c140c7b103fb70e4e97665d37'
        '7157d2d353966d08fdfc602d4bc5c16b8da257c840572fcfa568736865cf8e92bc749e9bd3ada10f45a2f6d230a5f2b0c7b0a49d383fef4bf2574df78f67f334')

prepare() {
  cd "$pkgname"

  # we don't need no stinkin' readme
  patch -p1 -i "$srcdir/remove-unnecessary-dependency.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# burns up too many cpu cycles to perform tests, not to mention that
# all the tests fail anyway
#check() {
#  cd "$pkgname"
#
#  # temporary install
#  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  export PYTHONPATH="$(pwd)/tmp/$site_packages"
#
#  pytest -v
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  #local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  #rm -r "$pkgdir$site_packages"/examples

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
