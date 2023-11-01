# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=python-gitlab
pkgver=4.1.0
pkgrel=1
pkgdesc="Python wrapper for the GitLab API"
arch=('any')
url="https://github.com/python-gitlab/python-gitlab"
license=('LGPL3')
depends=('python' 'python-requests' 'python-requests-toolbelt')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml' 'python-responses')
optdepends=(
  'python-argcomplete: for autocompletion'
  'python-pyyaml: for YAML support'
)
source=($pkgname-$pkgver.tar.gz::https://github.com/python-gitlab/python-gitlab/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('db4110ebc29dcfcf09582fdd8866e6ea8588a4779e8122c124bb341f27b6a06ab5cca341837b5452c1674602812e51f5e820952571e36b58fbba7e21ed98cba7')
b2sums=('9c8fe752556ee49cdca880a9025229c69e0aa595a987da1d48f73144e28208f016b657de5588a04c986fa5e5dbe218c990e479f260f70c90d9477c56f21f899d')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest -v --ignore tests/functional/
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname-$pkgver/dist/*.whl
}
