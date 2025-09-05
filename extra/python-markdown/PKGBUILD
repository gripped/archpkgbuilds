# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>

pkgname=python-markdown
pkgver=3.9.0
pkgrel=1
pkgdesc="Python implementation of John Gruber's Markdown"
arch=(any)
url='https://python-markdown.github.io/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-yaml: parse Python in YAML metadata'
  'python-pygments: Code highlighting'
)
checkdepends=(python-yaml python-pygments)
source=("$pkgname::git+https://github.com/Python-Markdown/markdown#tag=$pkgver")
sha512sums=('6f2f87ec42f053e7920f7de383b533f87aac00f12891838804eebd74acaea2b2989eec591ddf114a6d3996d5e235436912968f3cb47f4f2aac1605e3fd019f7a')
b2sums=('7e240e464bd42999180cd3d56b45d09e6cb4c218486960c36f76d4c30630443953c5646bb42c488170ac2687fd99629e5280161128021403832936b5113ab906')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
