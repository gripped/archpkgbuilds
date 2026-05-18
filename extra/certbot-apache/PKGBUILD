# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=certbot-apache
pkgver=5.6.0
pkgrel=1
pkgdesc='Apache plugin for Certbot'
arch=(any)
license=(Apache-2.0)
url='https://pypi.python.org/pypi/certbot-apache'
replaces=(letsencrypt-apache)
depends=(
  "certbot=$pkgver"
  "python-acme=$pkgver"
  python-augeas
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# git repository is used because certbot is a huge monorepo and it's easier to
# share the entire repository across all certbot related packages than a few
# hundred tarballs.
_repo='github.com-certbot-certbot'
source=("$_repo::git+https://github.com/certbot/certbot#tag=v$pkgver")
sha512sums=('6ede8da67b7f6c50336ade33d385976364ad6a8b7e24473847301f46dea62da4b02f4bc06b0df5fbee4c89c1ba016fa79b4d164fe489c378184911237a8b0db9')
b2sums=('b63ff547309041cc7171a4ccac9b6e57329b25daa960955039d8382d6dc139baf6496824f1ee9e0ec38c76f3c254c2189857cd724d7e531cdb86232833f2f61b')

build() {
  cd "$_repo/$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_repo/$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
