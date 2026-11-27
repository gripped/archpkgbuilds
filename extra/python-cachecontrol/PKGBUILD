# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_name=cachecontrol
pkgname=python-cachecontrol
pkgver=0.15.0
pkgrel=1
epoch=1
pkgdesc="Port of the caching algorithms in httplib2 for use with requests session object"
arch=(any)
url="https://github.com/ionrock/cachecontrol"
license=(Apache-2.0)
depends=(
  python
  python-msgpack
  python-requests
  python-urllib3
)
makedepends=(
  git
  python-build
  python-uv-build
  python-installer
  python-wheel)
checkdepends=(
  python-cherrypy
  python-cheroot
  python-filelock
  python-pytest
  python-redis
)
optdepends=(
  'python-filelock: for filecache'
  'python-redis: for redis cache'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('65f4dc692b069373f061b453406af6518ac4e00966c43f0a2ede524b4c99c2ec')
b2sums=('0c9d26ce8c6834dc60038e0f8ab1d6142692519d4d47c6d736fa9d8041aec7c9efe0cd6dc532408708c30bc4462fa2d82160593405ea5b8e26df4315e76e9b89')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
