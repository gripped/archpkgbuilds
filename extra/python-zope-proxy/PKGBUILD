# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-zope-proxy
pkgver=6.1
pkgrel=2
pkgdesc="Generic Transparent Proxies"
arch=('x86_64')
url="https://github.com/zopefoundation/zope.proxy"
license=('ZPL-2.1')
depends=(
  'glibc'
  'python'
  'python-zope-interface'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-zope-security'
  'python-zope-testrunner'
)
source=("git+https://github.com/zopefoundation/zope.proxy.git#tag=$pkgver")
sha512sums=('b70b0c713eef784b7ba48910bc335031f9baf4ce20194269c015d21541a0f39c752d5a7bccbb20ecba0fa6269e7a5010792e7adfb0a42055bd6012a06971b22f')

prepare() {
  cd zope.proxy
  sed -i 's/setuptools<74/setuptools/' pyproject.toml
}

build() {
  cd zope.proxy
  python -m build --wheel --no-isolation
}

check() {
  cd zope.proxy
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" \
    zope-testrunner --test-path=src
}

package() {
  cd zope.proxy
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
