# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=twine
pkgver=6.2.0
pkgrel=3
pkgdesc='Collection of utilities for interacting with PyPI'
arch=(any)
url='https://github.com/pypa/twine/'
license=(Apache-2.0)
depends=(
  python
  python-packaging
  python-readme-renderer
  python-requests
  python-requests-toolbelt
  python-urllib3
  python-importlib-metadata
  python-keyring
  python-rfc3986
  python-rich
  python-id
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  git
  python-munch
  python-jaraco.envs
  python-portend
  python-pretend
  python-pytest-services
  python-pytest-socket
)
provides=(python-twine)
conflicts=(python-twine)
replaces=(python-twine)
source=(
  "$pkgname::git+https://github.com/pypa/twine.git#tag=$pkgver"
  docutils-test-failure.patch
  update-expected-error-message.patch
)
sha512sums=('f5d5adb135c33724331b49dfdab094684ef7794e0aff6674c2313deae6587ac4e0596442c1a16eb9f9691e0747ea6a7b4364dd442c91ae76e6233dd59fd333a0'
            '3730f3da370b9b2bc470a25389bd814631e7b7f5192af8bc7aca1e594d4dcd5912b5fa64880f99d5a679a644234e1c6c8048d4b7c1a1f8146a2bd77e7e36b357'
            '0119d292992bb445b01d084069ca9e4f690aeee2b1654c604122bcdf9847311ce22186ca2c35c2364f5f5f76206a4afc4084f965575b2b59b465d8f0d286a862')
b2sums=('435bd58741a64a6dca27ce3944a6219c006867cfa7e8d6aa64f52528f93da305d560ee68b0a899b9aecb819a79e13a94c5c5a5f41fdcc832a9d3c0e35fae53ea'
        'f3f9cc597d8455636f922a53f1b3a9fd8ef6e119b4391ff53299da20e843c0e5b77f56d555d23cc73386e5cd96fe249fed9b2568189c0542f76af774f0124e79'
        'b2ca73b35648d6489378a5b3a4e70274506ebda185fef44abbe352521c2195c6e30427788032101fa070159f4b906c4b1f1edfb2d91f97ed101899231b59c7b8')

prepare() {
  cd "$pkgname"

  # twine depends on docutils 0.22, which is not in arch repos yet
  # debian has the same issue, as per below link
  # https://salsa.debian.org/python-team/packages/twine/-/commit/061499917b9ce7ecb65586690cb00fb2920754ae
  patch -p1 -i "$srcdir/docutils-test-failure.patch"
  patch -p1 -i "$srcdir/update-expected-error-message.patch"
}

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
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
