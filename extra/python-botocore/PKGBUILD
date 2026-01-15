# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

pkgname=python-botocore
pkgver=1.42.25
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
b2sums=('ba4474223e49f36be485d147d54fa5ed1b848022ef4d1fca9169c1cb2c29adafb487834e3bf99154cd658c9c3d47da9cdd6f42ed626c868e258b58aaeb0ce1c6')

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
