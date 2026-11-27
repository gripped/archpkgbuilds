# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.9.5
pkgrel=1
pkgdesc='Python library that measures the width of unicode strings rendered to a terminal'
arch=(x86_64)
url='https://github.com/jquast/wcwidth'
license=(MIT)
depends=(glibc python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('7262a4631a6f9f8cf627fe5f684c3c1fc5970342ca613cc9444b743c2564ca36b96026141e752e26e73ff180d80a7a2294a70e44e00f0cd6a045dfa46f539791')
b2sums=('a4593a64862f55334589b9390523595712466f62e18a1d8fb9555856e8819090c980cfb47867d725631d465e130315f4d03e79d61262491d70cbf4663fec7a41')

build() {
  cd "$pkgname"

  CIBUILDWHEEL=1 python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  rm -v tox.ini

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  WCWIDTH_PYTHON=1 pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
