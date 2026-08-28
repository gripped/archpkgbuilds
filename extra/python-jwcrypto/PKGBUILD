# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Abdó Roig-Maranges <abdo.roig@gmail.com>

_pkgname=jwcrypto
pkgname=python-$_pkgname
pkgver=1.5.9
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
sha512sums=('88047183179c2c696c225e01b5e5764b4e31c314bba1261043d65c5c1d4d4526e57575bb68f3468dec164a9557afa9606c5608ebdf64e3060bc7723f5d7aaa6b')
b2sums=('9db966290fe8dffcac210acba405d8b9eefa847a72d18584e7900a079d618e7d3950fd2d075b026a85068602eb6cf4bb8dfd7b911f8a1807e0698f8d6e9caaff')
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
