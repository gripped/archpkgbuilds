# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python-rich
pkgver=13.9.2
pkgrel=1
pkgdesc='Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal'
arch=(any)
url='https://github.com/willmcgugan/rich'
license=('MIT')
depends=(python-{colorama,markdown-it-py,pygments})
makedepends=(python-{build,installer,poetry-core,wheel})
source=("https://github.com/willmcgugan/rich/archive/v${pkgver}/rich-${pkgver}.tar.gz")
b2sums=('c83f736630a7bfbccda7d790476e7a9f518f2fa4e6bb3d4f5190bdeae784571875066c94bd8f4e01117b45a7eee83e9072bb7bb64ab5d5d8675aac5a63d5b0b5')

build() {
  cd rich-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd rich-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
