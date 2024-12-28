# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-readme-renderer
pkgver=44.0
pkgrel=1
pkgdesc="Safely render long_description/README files in Warehouse"
url="https://github.com/pypa/readme_renderer"
license=('Apache')
arch=('any')
depends=('python-docutils' 'python-pygments' 'python-nh3')
optdepends=('python-cmarkgfm: for Markdown support')
makedepends=('python-cmarkgfm' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=(https://github.com/pypa/readme_renderer/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('d5c0bcfeff30d3460ac7dc7ad6a5a487c1b3d8c3621e929ddc37493f400903471d2b3b017c176414e63c0919c70de2a9fafbf99357f45d0e92198748de772d92')

build() {
  cd readme_renderer-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd readme_renderer-$pkgver
  pytest -v
}

package() {
  cd readme_renderer-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
