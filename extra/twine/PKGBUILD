# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=twine
pkgver=6.0.1
pkgrel=2
pkgdesc='Collection of utilities for interacting with PyPI'
arch=('any')
url='https://github.com/pypa/twine/'
license=('Apache-2.0')
depends=('python-pkginfo' 'python-readme-renderer' 'python-requests' 'python-requests-toolbelt'
         'python-urllib3' 'python-importlib-metadata' 'python-keyring' 'python-rfc3986'
         'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('git' 'python-munch' 'python-jaraco.envs' 'python-portend' 'python-pretend'
              'python-pytest-services' 'python-pytest-socket')
provides=('python-twine')
conflicts=('python-twine')
replaces=('python-twine')
source=("git+https://github.com/pypa/twine.git#tag=$pkgver")
sha512sums=('7acd424550a9c078435d5c43b20d9d36b2fcc539ee064a6dcf47f06ac9ec1aa7d7b9e1035fe14ef821341b03468db7e4558e15e46fe58b4041c6e6aabf90338d')

build() {
  cd $pkgname
  python -m build -nw
}

check() {
  cd $pkgname
  # Ignored tests are copied from upstream tox.ini:
  # https://github.com/pypa/twine/blob/4.0.2/tox.ini#L16
  python -m pytest --ignore-glob '*integration*.py'
}

package() {
  cd $pkgname
  python -m installer -d "$pkgdir" dist/*.whl
  ln -s twine "$pkgdir"/usr/bin/twine3
}
