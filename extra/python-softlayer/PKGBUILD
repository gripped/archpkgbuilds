# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-softlayer
pkgver=6.2.7
_commit=0e656572a605dcb5c2f34d0f6a5c13d0589f396e
pkgrel=2
pkgdesc="A library for SoftLayer's API"
arch=('any')
url='https://github.com/softlayer/softlayer-python'
license=('MIT')
depends=('python' 'python-prettytable' 'python-click' 'python-requests'
         'python-prompt_toolkit' 'python-pygments' 'python-urllib3' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-testtools' 'tk')
source=("git+https://github.com/softlayer/softlayer-python.git#commit=$_commit"
         fix-tests.patch
         "$pkgname-click-8.3-compatibility.patch")
sha512sums=('88111a05431fafe3a3e9fabf9111c652da9300c8d549220776448d878c89a59ce17074b85b3e550b69672875ba05dc526073958894b0db3d2c19ed752a007abe'
            'e4f843fa3a04cd4332904f3652cb996b72bd671e701a774d11fbee59e3172f44edb178cfcb2622e8825da0d70835b4e095f56426ab6ea9c65095c3cc7c4241a3'
            'f2be77d7dda539a9fc8eb63ffbee7f0bba3e1e1bf72768bff674169158502f1f2bf36c44f99e20e98d2e1cc377f1c6a01805a78133ae087b9aa5f8eca0e8b829')

prepare() {
  cd softlayer-python
  sed -i 's/==/>=/' setup.py
  patch -p1 -i ../fix-tests.patch
  patch -p1 -i ../$pkgname-click-8.3-compatibility.patch
}

build() {
  cd softlayer-python
  python -m build --wheel --no-isolation
}

check() {
  cd softlayer-python
  pytest
}

package() {
  cd softlayer-python
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  rm -rf "$pkgdir"/usr/lib/python${python_version}/site-packages/tests

  # Prevent collisions with `sl` package; This command is deemed deprecated by
  # the project anyway
  rm -f "$pkgdir/usr/bin/sl"
}

# vim:set ts=2 sw=2 et:
