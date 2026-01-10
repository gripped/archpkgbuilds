# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>
# Contributor: Dobroslaw Kijowski

pkgname=mitmproxy
pkgver=12.2.1
pkgrel=2
pkgdesc='SSL-capable man-in-the-middle HTTP proxy'
arch=(any)
url='https://mitmproxy.org'
license=(MIT)
depends=(
  python
  python-aioquic
  python-argon2-cffi
  python-asgiref
  python-brotli
  python-certifi
  python-cryptography
  python-flask
  python-h11
  python-h2
  python-hyperframe
  python-kaitaistruct
  python-ldap3
  python-mitmproxy-rs
  python-msgpack
  python-publicsuffix2
  python-pyopenssl
  python-pyparsing
  python-pyperclip
  python-requests
  python-ruamel-yaml
  python-sortedcontainers
  python-tornado
  python-typing_extensions
  python-urwid
  python-wsproto
  python-zstandard
  python-bcrypt
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-parver
  python-pytest-asyncio
  python-pytest-timeout
)
provides=(pathod)
conflicts=(pathod)
replaces=(pathod)
source=("$pkgname::git+https://github.com/mitmproxy/mitmproxy#tag=v$pkgver")
sha512sums=('d16d6dfc28396b52b44b90b3958a38dea072dee7b7d50dde821412237eeb7a15d61e355fea6f573f6a73d549a749e4fb6e1aba58d7075724e3a84adf1bb6b047')
b2sums=('44e98809d27cb1b97632fa5ca5fb24086c1f6c33856036b88d475fbf51231a6460acdd17f2460e19415e71e7deb3801af366d145ed38685c55acc6bfd854cf99')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m installer --destdir=test_dir dist/*.whl
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="test_dir/usr/bin:$PATH" PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" pytest -vv
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
