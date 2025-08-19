# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred.com>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Ismo Toijala <ismo.toijala@gmail.com>

pkgname=python-jsonschema
pkgver=4.25.1
pkgrel=1
pkgdesc='An implementation of JSON Schema validation for Python'
arch=(any)
url='https://github.com/python-jsonschema/jsonschema'
license=(MIT)
depends=(
  python
  python-attrs
  python-referencing
  python-jsonschema-specifications
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-hatch-vcs
  python-hatch-fancy-pypi-readme
)
checkdepends=(
  python-pip
  python-twisted
  python-isoduration
  python-fqdn
  python-idna
  python-jsonpointer
  python-jsonpath-ng
  python-rfc3339-validator
  python-rfc3987
  python-uri-template
  python-webcolors
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
sha512sums=('9ef699d39101c09ba8dcbbe77908a250a85486044e51eed0b17d69fa3ffb7bdab60023f94c051e1b1e5755f959429ce12e8533cc5016e95f0bbc3f1fd1523dc0')
b2sums=('75f6818875929eba7e18f11f35b522defe90208b5ed561da305f24c3ea6021c4a4e7a33948889204bd5e423e0e61fb65eaeb98a359d6324f7565c507eb090337')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  PYTHONPATH="$PWD/tmp_install$site_packages" \
    JSON_SCHEMA_TEST_SUITE=json trial jsonschema
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
