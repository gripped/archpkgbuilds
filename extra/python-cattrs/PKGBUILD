# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=24.1.0
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
url='https://catt.rs'
# url='https://github.com/python-attrs/cattrs'
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-{build,installer,wheel}
             python-hatch-vcs
             python-hatchling)
# checkdepends=(python-hypothesis
#               python-pytest)
_archive="$_pipname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_archive.tar.gz")
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('8274f18b253bf7674a43da851e3096370d67088165d23138b04a1c04c8eaf48e')

prepare() {
	cd "$_archive"
	# Upstream test suite uses addopts to run benchmarks, drop them
	sed -i -e '/^addopts/d' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

# check() {
#         cd "$_archive"
#         export PYTHONPATH=src
#         pytest
# }

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
