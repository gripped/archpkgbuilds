# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Hao Long <imlonghao@archlinuxcn.org>

pkgname=python-rich
pkgver=13.8.0
pkgrel=1
pkgdesc='Render rich text, tables, progress bars, syntax highlighting, markdown and more to the terminal'
arch=(any)
url='https://github.com/willmcgugan/rich'
license=('MIT')
depends=(python-{colorama,markdown-it-py,pygments})
makedepends=(python-{build,installer,poetry-core,wheel})
source=("https://github.com/willmcgugan/rich/archive/v${pkgver}/rich-${pkgver}.tar.gz")
b2sums=('e319018387ff27f4ec2bce1d272ff7fe676d224a14798fa585c0d72fcdedd084c3e1d4b73d3d2db45a113e0c5433c7103382c7134ff6e1c8e580ff2c3fa444ae')

build() {
  cd rich-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd rich-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
