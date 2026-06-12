# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-cloudflare
pkgver=5.3.0
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
sha512sums=('05101f8f6cd422a480cfc4da8341dd9e862caa38daa1256e971b4089e6003ff6d994012bd0190c7f9ca5024b4f39486f90a5fad579a0778ca0a9ca6f02f2ad79'
            '7d9ba9c4638b3c185c2be27485aafe24edc3c1ba76d2ab6addf3c8bef8dba892e5bec58f1f4262d2618c25517edaaca2ce5062b1cff6066acf59098533c6d74a')
b2sums=('fed702a56f56909d7e20a5b7b63dde99ccf89d604c2be49372c5341f2498bfd728c6ff8d3948f05064af8908f30c4bf0443d189592bab8a326ac7ed42a174177'
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
