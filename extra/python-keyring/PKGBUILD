# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Brice Maron <brice@bmaron.net>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Steven Allen <steven {at} stebalien {dot} com>

pkgname=python-keyring
_name=keyring
pkgver=25.0.0
pkgrel=4
pkgdesc='Store and access your passwords safely'
arch=('any')
url='https://github.com/jaraco/keyring'
license=('PSF-2.0' 'MIT')
depends=('python-jaraco.classes' 'python-secretstorage' 'python-jaraco.functools' 'python-jaraco.context')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-keyrings-alt: Alternative backends'
            'python-dbus: kwallet backend')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('9b7f25aea1166f80b1b6ded7d691295690dac679e9f931437ae83fc2bf465c541bb1ed74b99a0de749a04df60576e9fe068f2f86b39a3c5bcef953b616678951')
b2sums=('b1b955215bf197f52e64c46572f29c2059f75f5eadce249fe1776f10f7f1c6d20428a811a8c36fe4bb85142f61f6281c71e2b97b1f8657fdc35a5075b840d39f')

build() {
  cd $_name-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver

  python -m pytest
}

package() {
  cd $_name-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir"/$site_packages/keyring/tests
}

# vim:set ts=2 sw=2 et:
