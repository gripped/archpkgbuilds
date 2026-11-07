# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-linode
pkgver=5.9.0
pkgrel=1
pkgdesc='Linode DNS Authenticator plugin for Certbot'
arch=(any)
license=(Apache-2.0)
url='https://pypi.python.org/pypi/certbot-dns-linode'
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  dns-lexicon
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
sha512sums=('3b363b9828b5afa6423c0e77ae405785bb4ae99473d63e8191007023534ae90c5444f7fbca40c3cf08fec69ca1f3ba7141bcc08dc0e1f490af2be4b1771a314f')
b2sums=('a599de2ceb13aafaad5649d50b2a01268527b4b32fa6ce05668fed811c43c9c8787008ae10de0c61e5f68a5673afdb08cdb5744422d5cbdd2042cb1db600010d')

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
