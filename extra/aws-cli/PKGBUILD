# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
pkgver=1.43.15
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services'
arch=('any')
url="https://github.com/aws/aws-cli"
license=('Apache-2.0')
depends=(
  'python'
  'python-botocore'
  'python-colorama'
  'python-dateutil'
  'python-docutils'
  'python-jmespath'
  'python-pyasn1'
  'python-rsa'
  'python-s3transfer'
  'python-yaml'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-awscrt'
  'python-pytest'
  'python-pytest-xdist'
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('c8e1bafd8e065028bd146b508acd7f8f956c66f68088fe9829b521b1ad5c26b0')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Many integration tests need real credentials
  PATH=$PWD/test-env/bin:$PATH test-env/bin/python -m pytest tests -n auto \
    --ignore=tests/integration
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 bin/aws_bash_completer "$pkgdir/usr/share/bash-completion/completions/aws"
  rm -v "$pkgdir/usr/bin/"{aws.cmd,aws_bash_completer}
}
