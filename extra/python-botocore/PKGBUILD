# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

pkgname=python-botocore
pkgver=1.42.44
pkgrel=1
pkgdesc='A low-level interface to a growing number of Amazon Web Services'
arch=('any')
url="https://github.com/boto/botocore"
license=('Apache-2.0')
depends=(
  'python'
  'python-certifi'
  'python-dateutil'
  'python-jmespath'
  'python-urllib3'
)
makedepends=(
  'python-awscrt'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'procps-ng'
  'python-jsonschema'
  'python-pytest'
  'python-pytest-xdist'
)
optdepends=('python-awscrt: use AWS Common Runtime')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a7047f799dc39ee8f49c7128e91e0f11f20c38b946ec5555a75e6fd3f8691fe396d312b9ff3023fc031415cc0846fe94f5d9a5357e31f9d0670cf7e534474609')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Many integration tests need real credentials
  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id
  test-env/bin/python -m pytest tests -n auto --ignore=tests/integration
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
