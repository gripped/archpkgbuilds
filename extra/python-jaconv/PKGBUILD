# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-jaconv
pkgver=0.4.1
pkgrel=1
pkgdesc='Japanese character interconverter for Hiragana, Katakana, Hankaku, and Zenkaku'
url='https://ikegami-yukino.github.io/jaconv/jaconv.html'
license=(MIT)
arch=(any)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-nose
  python-pytest
)
source=("$pkgname::git+https://github.com/ikegami-yukino/jaconv#tag=v$pkgver")
sha512sums=('e5a21d003818a23925a279fea7cb786076c4a091e64d5d8f48b3c8c82294393ba957556ba24de2980bc52aa70a80eec758406fd8ea0ce7197dd3d875c5923fb3')
b2sums=('c75abdcb63f17da013057b3ac3728574c6ac7d50b6b51e479ddb233452882bb09b51a273622c36b6736900093fedf4923d1cc2410cd3298adb9afb188eb8e1c1')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}
  
package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
