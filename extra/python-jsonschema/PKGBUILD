# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python-jsonschema
pkgver=4.22.0
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=('any')
url='https://github.com/python-jsonschema/jsonschema'
license=('MIT')
depends=(
  'python'
  'python-attrs'
  'python-pyrsistent'
  'python-referencing'
  'python-jsonschema-specifications'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
  'python-hatch-fancy-pypi-readme'
)
checkdepends=(
  'python-pip'
  'python-twisted'
  'python-isoduration'
  'python-fqdn'
  'python-idna'
  'python-jsonpointer'
  'python-rfc3339-validator'
  'python-rfc3987'
  'python-uri-template'
  'python-webcolors'
)
optdepends=(
  'python-isoduration: for duration format'
  'python-fqdn: for hostname format'
  'python-idna: for idn-hostname format'
  'python-jsonpointer: for json-pointer & relative-json-pointer format'
  'python-rfc3339-validator: for date-time format'
  'python-rfc3987: for iri, iri-reference, uri & uri-reference format'
  'python-uri-template: for uri-template format'
  'python-webcolors: for color format'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('7eff6dc0967af8d0a75a2f288410bbc8ef597fa4f4479bf47663ffd9342f6791c87c1de75bf761a7fea3b13fb603196871dbd49f715001ebff7a3671b044b682')
b2sums=('e3810424e3a6c61b7f22bbb25abc7dd1497c36c87398fb4befbd4f706b791ed2fe0a27fd81b7aeded2aadc55bca50a7cde8ae6321f8678a8341fc5ac47b61cd6')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" \
    JSON_SCHEMA_TEST_SUITE=json trial jsonschema
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/licenses/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
