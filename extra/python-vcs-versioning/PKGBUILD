# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-vcs-versioning
pkgver=2.2.4
pkgrel=1
pkgdesc='the blessed package to manage your versions by vcs metadata'
arch=(any)
url='https://github.com/pypa/setuptools-scm'
license=(MIT)
depends=(
  python
  python-packaging
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-timeout
  jujutsu
  mercurial
)
optdepends=('python-rich: formatting of log messages')
source=("python-setuptools-scm::git+$url#tag=vcs-versioning-v$pkgver")
sha512sums=('2f3be69b1ed8909cb1cbf43ebc538afcaba02ea6e6c878a2b602d36dded94fa4b905e1d38209318514aa1aa14b3677ab34d25fe5e2573c1892bb933271277a10')
b2sums=('9f41c37fba2c26e35866a940d0c6991263ade1e349c870d096d21112ba371653d649bb0b6c76acd3ab29a02c824490200f04c7a60fb6df50f240e8d405aa24dc')

build() {
  cd python-setuptools-scm/vcs-versioning

  python -m build --wheel --no-isolation
}

check() {
  cd python-setuptools-scm/vcs-versioning

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_options=(
    -vv
    --deselect testing_vcs/test_jj.py::test_jj_disable_jj_falls_back_to_git
  )

  pytest "${pytest_options[@]}"
}

package() {
  cd python-setuptools-scm/vcs-versioning

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
