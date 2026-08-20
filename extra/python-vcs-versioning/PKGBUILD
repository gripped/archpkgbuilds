# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-vcs-versioning
pkgver=2.3.1
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
sha512sums=('15770de68a00ab19086ea349770f8a1d6bbb9a90ceaff56fca066c1a0814bc8de351bf83e1ea585b7bc0e92ce498ce7fda6b48967f0ddf4d1b762d9ad5a51ef2')
b2sums=('6637c9b5d1cf971ff831a4422f41ff4f6ce46453b554f9093e134dc70d56f51634f48faa9547ea6312cedf37c37716eeffac696be78a3139decac8204fa426de')

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
