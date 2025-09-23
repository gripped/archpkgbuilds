# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-lark-parser
pkgver=1.3.0
pkgrel=1
pkgdesc='A modern parsing library'
arch=(any)
url='https://github.com/lark-parser/lark'
license=(MIT)
depends=(
  python
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-tzlocal
  python-atomicwrites
  python-regex
)
optdepends=(
  'python-atomicwrites: for atomic_cache'
  # 'python-interegular: for interegular support'  # TODO: package
  'python-regex: for regex support'
  # 'python-js2py: for nearley support', # unmaintained and incompatible with Python 3.13
)
provides=(python-lark)
source=(
  "$pkgname::git+$url#tag=$pkgver"
  'github.com-Hardmath123-nearley::git+https://github.com/Hardmath123/nearley'
)
sha512sums=('0d4f6a45bf61bfc7a124551d3ef77f4388b5a4ba66d56a37baca0c31e5b927ef7f54b938830451bf369803385845a55b682c970ec993068f8ff825204b31e08e'
            'SKIP')
b2sums=('bcf6cfb0aaeb794bf738b27641ff0960312a45712508f18bc1db035fc6b3920a7a50b09397393a404bcc136fdaf1b8df3a430f367a124bc12cf387100d4143e8'
        'SKIP')

prepare() {
  cd "$pkgname"

  # setup git submodules
  git submodule init
  git config submodule.tests/test_nearley/nearley.url "$srcdir/github.com-Hardmath123-nearley"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
