# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python-rich
pkgver=14.3.2
pkgrel=2
pkgdesc='Python library for rich text and beautiful formatting in the terminal'
arch=(any)
url='https://github.com/Textualize/rich'
license=(MIT)
depends=(python python-{markdown-it-py,pygments})
makedepends=(git python-{build,installer,poetry-core,wheel})
source=("$pkgname::git+https://github.com/Textualize/rich#tag=v$pkgver")
sha512sums=('e768b5c0b2ababd91aaeb1a21abb97324dd4530b08ef3ca2eac8876d14b34700da808fc1a4a1a036c20421a89cc746ad32bfd6bae975b4ab38ccebde7e9a4d4f')
b2sums=('b8bec0b0d517ccd517a8ab6f0c64d63b9ba85909cdfd310170900ad2340ad2392dfc0043e7ce0326043cf72cd1aa46f8d5baeea48cb27edd0547bd05555ebbf8')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
