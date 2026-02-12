# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
pkgver=1.3.2
pkgrel=1
pkgdesc='pytest plugin to set environment variables in pytest.ini or pyproject.toml file'
arch=(any)
url='https://github.com/pytest-dev/pytest-env'
license=(MIT)
depends=(
  python
  python-pytest
  python-dotenv
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(python-pytest-mock)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('a9cafa9d8999aeddeb7a2dfbef6eb331f5a92e1ee872ff45f006391669dab3c23f10ae69bee1fb04cbd572e1560377837e6495e971df00de41404df1f9ca5d58')
b2sums=('8a9e6e1adb8d408fa377b8415210b194ca18e8eb9e2333a07eec2d7628655236fbe9d18e1aa1ff70d9657d0cc7e9092772f6ea4e988e6140d06bd55c2e1f3202')

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v \
    --deselect tests/test_env.py::test_env_via_toml["pyproject toml via tool.pytest"] \
    --deselect tests/test_env.py::test_env_via_toml["pytest toml over pyproject toml"] \
    --deselect tests/test_env.py::test_env_via_toml["subdir pytest toml over parent pyproject toml"] \
    --deselect tests/test_env.py::test_env_via_pyproject_toml_bad["pytest.toml"] \
    --deselect tests/test_env.py::test_env_via_pyproject_toml_bad[".pytest.toml"]

}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
