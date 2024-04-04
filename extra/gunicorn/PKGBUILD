# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: pumpkin <pumpkin at mailoo dot org>
# Contributor: Vsevolod Balashov <vsevolod at balashov dot name>

pkgname=gunicorn
pkgver=21.2.0
pkgrel=2
pkgdesc='WSGI HTTP Server for UNIX'
arch=('any')
url='https://gunicorn.org/'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-aiohttp'
  'python-coverage'
  'python-eventlet'
  'python-gevent'
  'python-pytest'
  'python-pytest-cov'
)
optdepends=(
  'python-eventlet: for asynchronous request handling with eventlet'
  'python-gevent: for asynchronous request handling with gevent'
  'python-setproctitle: for process renaming'
  'python-tornado: for asynchronous request handling with tornado'
)
source=("git+https://github.com/benoitc/$pkgname.git#tag=$pkgver")
b2sums=('6d16b867e202b5291529e757675c88236bb2cb213489fe9610cc057235f00fcc3c065e36857e152fe79e736d6cb903f8f18911a0eca597cf7b0e65350b4b5bcd')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
