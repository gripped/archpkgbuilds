# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-vcs-versioning
pkgver=2.2.3
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
sha512sums=('df885b608714cafca8c54a79c4131acf2ed690f830f7eaef1cfecb578ed469e94efb1658203cdd0357b321826ea39c81b2b8ab6a1dd047df63e55a88a80cd6b7')
b2sums=('6b13b1e0718e913ef26202e59713059cb52029ce1ef125e6f3aeb1141efc8f8c0bdcf78ae4584a2b07e6bdcfef0ff136ad9a60573f496c41f86f7ca65e3b3079')

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
