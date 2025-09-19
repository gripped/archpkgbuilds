# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: David Runge <dvzrv@archlinux.org> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_devendored=1  # set to 0 to use vendored sources
_pkgname=poetry-core
pkgname=python-poetry-core
pkgver=2.2.0
pkgrel=1
pkgdesc='Poetry PEP 517 Build Backend & Core Utilities'
arch=(any)
url="https://github.com/python-poetry/${_pkgname}"
license=(MIT)
groups=(python-build-backend)
_pydeps=(fastjsonschema
         lark-parser
         packaging)
depends=(python)
if (( _devendored == 1 )); then
	depends+=("${_pydeps[@]/#/python-}")
fi
makedepends=(python-{build,installer})
checkdepends=(git
              python-pytest
              python-pytest-mock
              python-setuptools
              python-tomli-w
              python-trove-classifiers
              python-virtualenv)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$pkgname-1.9.0-devendor.patch")
sha256sums=('3942711421f4141b9a97213845fdf2a95c5f6abe4e6fb70a84567dc696dc1f23'
            'd2c2829da782843def3d7df342001fdcee10ccb69a629f638b915c78c69b88ec')

prepare() {
	if (( _devendored == 1 )); then
		patch -Np1 -d "$_archive" -i "../$pkgname-1.9.0-devendor.patch"
		rm -rv "$_archive/src/poetry/core/_vendor"
	fi
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	export PYTHONPATH="$PWD/src"
	# only works inside git repositories
	pytest \
		-k 'not test_default_with_excluded_data and not test_default_src_with_excluded_data'
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
