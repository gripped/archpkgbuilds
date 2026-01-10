# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

pkgname=python-botocore
pkgver=1.42.21
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
b2sums=('65de15224f2c720267d0ccd3c42001a2320baa4493cff11f86602dd3498391bf5782f79ed072a8edf14c8fd3d02a8fe1ca9d50c21655fe7fb72da023efde4581')

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
