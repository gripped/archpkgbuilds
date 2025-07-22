# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python-jsonschema
pkgver=4.25.0
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=('any')
url='https://github.com/python-jsonschema/jsonschema'
license=('MIT')
depends=(
  'python'
  'python-attrs'
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
  'python-jsonpath-ng'
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
sha512sums=('fb603a3812896e78b5a6ac67013f5dc4badf34ae1b64b5552fe2f68f0d6c7e24c73c34604f2a2bd3b240fa722a66c81c78af663add40d3b9d01c6679343c0633')
b2sums=('632544ec7ae102b708001f865304f8d3e480dcc55b09923186036a7d9f42daa60cb8c702831569bbc749b2b305f551b9921ad9ab09bae4e54fa37b8f0c00ebf3')

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
