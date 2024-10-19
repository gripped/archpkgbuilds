# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=twine
pkgver=5.1.0
pkgrel=1
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
sha512sums=('127718f293702e29ae5cd90efaacf8093d77f0ee8c5fa6ec949c960057081b72b17df2d53ce9e3d03ce7d7bc2ef31d84c81af09b506135cf66e87cb836fe2f59')

prepare() {
  cd $pkgname
  # Fix metadata tests
  git cherry-pick -n 9eb9269e8c0ab0f53010a4b7b6cf466fd6f0090f
}

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
