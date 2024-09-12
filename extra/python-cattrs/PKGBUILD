# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=24.1.1
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
sha256sums=('16e94a13f9aaf6438bd5be5df521e072b1b00481b4cf807bcb1acbd49f814c08')

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
