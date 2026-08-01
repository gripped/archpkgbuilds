# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-feedparser-sgmllib
pkgver=2.0.1
pkgrel=1
pkgdesc='Provides sgmllib from Python 2'
arch=(any)
url='https://github.com/python-syndication/feedparser-sgmllib'
license=(PSF-2.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('4e3c34389e5229107499f6f80c766fbecf95810f3fb67a024761acc617a25ba23410bb8ecbb914164bf17ccadacdf40c4cc17dd3870386b55228ecef8de564cb')
b2sums=('3bc0e668c8671d86ec661d6335f0e232c0d91cdb8d9781270bc3ea25c6fce4360a8d8f63b04e09f8f51e22219f6b42dbcac552fa2b5a8c7dc18b9d9fee26a381')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
  )
  pytest "${pytest_options[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
