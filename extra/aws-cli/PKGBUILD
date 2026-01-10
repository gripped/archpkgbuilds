# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
pkgver=1.44.11
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
b2sums=('738bd7864ea1465250d410235e767b4577258d8913745e9d90613dc4f4dc0cad7ccfc925b727fef3225f922acb50a56bbccc374ddde103a57758783f809a8a81')

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
