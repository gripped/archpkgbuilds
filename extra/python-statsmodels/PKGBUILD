# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>

pkgname=python-statsmodels
pkgver=0.14.6
pkgrel=2
pkgdesc="Statistical computations and models for use with SciPy"
arch=(x86_64)
url="https://www.statsmodels.org/"
license=(BSD-3-Clause)
depends=(python-numpy python-scipy python-pandas python-patsy)
makedepends=(python-setuptools-scm python-wheel python-build python-installer cython git)
optdepends=('jupyter-notebook: needed to run the notebooks'
            'python-cvxopt: regularized fitting of some models'
            'python-joblib: accelerate distributed estimation for certain models'
            'python-matplotlib: plotting functions')
checkdepends=(python-pytest python-pytest-xdist python-joblib python-matplotlib)
source=(git+https://github.com/statsmodels/statsmodels#tag=v$pkgver)
sha256sums=('032a7ca9875b3752201fcc03916abb722271de9eaa85aba3e4c086248ce3b516')

prepare() {
  sed -e 's/,<9//' -e '/oldest-supported-numpy/d' -i statsmodels/pyproject.toml
}

build() {
  cd statsmodels
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd statsmodels/build/lib.linux-${CARCH}-cpython-${python_version/./}
  PYTHONPATH="${PWD}" pytest -vv --color=yes statsmodels
}

package() {
  cd statsmodels
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
