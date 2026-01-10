# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=vdirsyncer
pkgver=0.20.0
pkgrel=4
pkgdesc='Synchronize CalDAV and CardDAV'
arch=(any)
url=https://vdirsyncer.pimutils.org/en/stable/
license=(BSD-3-Clause)
depends=(
  python
  python-aiohttp
  python-aiostream
  python-click
  python-click-log
  python-requests
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-sphinx
  python-wheel
)
checkdepends=(
  python-aioresponses
  python-hypothesis
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-pytest-subtesthack
  python-trustme
)
optdepends=('python-aiohttp-oauthlib: Google support')
source=("git+https://github.com/pimutils/vdirsyncer.git#tag=v$pkgver")
b2sums=('c548f23993526e5b0844098c3ba32281a2f7e30cacc6e206e2543bbd3944dad27489a0f4e10fb8ac9244617f911833cc1e87ad1d619f091c17d03bc2d3b228f2')
#validpgpkeys=('951082781CA308E4A529DEFD6F9FFF122B98C0CD') # Hugo Osvaldo Barrera <hugo@barrera.io>

build() {
  cd $pkgname
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
  export PYTHONPATH="build:$PYTHONPATH"
  sphinx-build -b man docs/ build/
}

check() {
  cd $pkgname
  export DETERMINISTIC_TESTS=true
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts="
}

package() {
  # symlink license
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$pkgname-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  # systemd
  install -vDm 644 contrib/$pkgname.{service,timer} -t "$pkgdir"/usr/lib/systemd/user
  # man page
  install -vDm 644 build/$pkgname.1 -t "$pkgdir"/usr/share/man/man1
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst config.example -t "$pkgdir"/usr/share/doc/$pkgname
}
