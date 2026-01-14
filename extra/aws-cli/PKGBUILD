# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
pkgver=1.44.15
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
b2sums=('35dbc80e264258fdfbd68ab91b81fd1fd388ede68bb0738949bd9854b346f1ee3314ce6ed76a384bbf1b19686688ac46d05c51314b37c6ff5d1f4ee207dc6956')

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
