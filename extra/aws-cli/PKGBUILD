# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Alper KANAT <alperkanat@raptiye.org>

pkgname=aws-cli
pkgver=1.32.34
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services'
arch=('any')
url="https://github.com/aws/aws-cli"
license=('Apache')
# Upstream relies on transitive dependencies https://github.com/aws/aws-cli/issues/6556
depends=('python' 'python-botocore' 'python-dateutil' 'python-jmespath'
         'python-colorama' 'python-docutils' 'python-pyasn1' 'python-rsa'
         'python-s3transfer' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
md5sums=('97b5ca21d77b6fad0b691d8027b2d78b')
sha256sums=('ce32592ecd3dad7ea3643e13f209f24af555c4cab8cb4cc46c3fa33c05c72d1f')

build() {
  cd $pkgname-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 bin/aws_bash_completer "$pkgdir"/usr/share/bash-completion/completions/aws

  rm -f "$pkgdir"/usr/bin/{aws.cmd,aws_bash_completer}
}
