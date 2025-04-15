# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=twine
pkgver=6.1.0
pkgrel=1
pkgdesc='Collection of utilities for interacting with PyPI'
arch=('any')
url='https://github.com/pypa/twine/'
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-readme-renderer' 'python-requests' 'python-requests-toolbelt'
         'python-urllib3' 'python-importlib-metadata' 'python-keyring' 'python-rfc3986'
         'python-rich' 'python-id')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('git' 'python-munch' 'python-jaraco.envs' 'python-portend' 'python-pretend'
              'python-pytest-services' 'python-pytest-socket')
provides=('python-twine')
conflicts=('python-twine')
replaces=('python-twine')
source=("$pkgname::git+https://github.com/pypa/twine.git#tag=$pkgver")
sha512sums=('61160460877d0d5f464d42f8fa6cf643498421b73a0183bc3febc809b15bcf428a682303f48d62f320575db607eb2c516f333c45756e15dcf65c672c490690ca')
b2sums=('02e50e2656a4e5b0127365ec0437eba953e620c12d148759858e7d3742211e292cb19c6b69b60a406c0860a5e2eecdb4801afa2c261476cff8fe74646cd426ed')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # Ignored tests are copied from upstream tox.ini:
  # https://github.com/pypa/twine/blob/4.0.2/tox.ini#L16
  python -m pytest --ignore-glob '*integration*.py'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # create symlink
  ln -s twine "$pkgdir"/usr/bin/twine3
}
