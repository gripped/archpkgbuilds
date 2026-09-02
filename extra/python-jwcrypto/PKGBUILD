# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Abdó Roig-Maranges <abdo.roig@gmail.com>

_pkgname=jwcrypto
pkgname=python-$_pkgname
pkgver=1.6.0
pkgrel=1
pkgdesc='Python implementation of JWK, JWS, JWE specifications'
arch=(any)
url='https://github.com/latchset/jwcrypto'
# setup.py says LGPLv3+ https://github.com/latchset/jwcrypto/blob/v1.5.1/setup.py#L20
license=(LGPL-3.0-or-later)
# This package uses @typing_extensions.deprecated, which will be available as @warnings.deprecated in Python 3.13
# https://github.com/latchset/jwcrypto/pull/337
# https://typing-extensions.readthedocs.io/en/latest/#deprecated
depends=(
  python
  python-cryptography
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(python-pytest)
source=("git+$url?signed#tag=v${pkgver}")
sha512sums=('a3e17f55ebbefd759f2ebdd15ec5d1e857eb90618ecf5e8949c29f48353ebfae2c019c1c3e2a7ff4d9008f1bdbc5c830742b9be4ef5b787a86d518229402c7b6')
b2sums=('cef2a9e9f4cb2d150c67a75f7d9703d891e776e3142da100fa14e5c65b8fc71e6de92147cc10ffdd35930465c0a240a3eb720e781da62eb9157b171e48e68a43')
# PyPI sdists for older versions are signed by tiran's key. Since version 1.0,
# PyPI sdists are not signed, and tiran didn't declare transition of the
# signing key for some reason. I temporarily trust simo5's signed git tags as
# the @redhat.com UID in their key has been verified on keys.openpgp.org.
# See https://github.com/latchset/jwcrypto/issues/230 for more details.
validpgpkeys=(
  'BB97AF8BC4E7A5C0D96223D3C788C4C1D4550D45'  # https://github.com/tiran
  '7C7BD146943B206BB645B64594EAD67E004B65AB'  # Simo Sorce <simo@redhat.com>
)

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  pytest
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
