# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.26.0
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=(any)
url="https://github.com/dns-lexicon/dns-lexicon"
license=(MIT)
depends=(
  python-beautifulsoup4
  python-cryptography
  python-yaml
  python-requests
  python-requests-unixsocket
  python-tldextract
  python-pyotp
  python-dnspython
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-vcrpy
  python-boto3
  python-localzone
  python-softlayer
  python-zeep
  bind
)
optdepends=(
  'python-boto3: for Route53 support'
  'python-localzone: for localzone support'
  'python-softlayer: for SoftLayer support'
  'python-zeep: for Gransy SOAP support')
  # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
  # 'python-tencentcloud-sdk-python: for QCloud support'
conflicts=(
    python-lexicon
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('311978d51db5ed4da63679c0a6692c958c25ce629a4ed89b38cf24da4522389fa8fa40e5a2be3c09cda2a71ff8d69d588373d78bbb42c12a399262726de0a846')
b2sums=('f0a764c1d34d1d206430d3652acc6a5eefab085101d654894c2c87f1322eb60fded53708c95268c224460c1f406ec21e91241eacae7f71229cb4c0662358150c')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # Provider discovery tests read the installed distribution metadata.
  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
