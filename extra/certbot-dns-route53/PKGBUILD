# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-route53
pkgver=5.7.0
pkgrel=1
pkgdesc='Route53 DNS Authenticator plugin for Certbot'
arch=(any)
license=(Apache-2.0)
url='https://pypi.python.org/pypi/certbot-dns-route53'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  python-boto3
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('8bf169295968b9a54dbf2be45239ba46d758fa4e1fa72f468f750b7ed001028f583f564204a95dd277743b5efc1c5202d6fc7d9948579e39be1c853193ade9dd')
b2sums=('366ef334b4cfdd48b138a8b5f6fe15b6ffd97af2ba575e246fe92fb1f5a80eb4e1b8e7d350f5483309ee5ce70b7af0e55774e719b98fbe1f3c8066da00ce3c83')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_repo/$pkgname"

  # https://github.com/certbot/certbot/issues/9606
  pytest -v -W ignore::DeprecationWarning
}

package() {
  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
