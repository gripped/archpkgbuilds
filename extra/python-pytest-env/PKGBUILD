# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
pkgver=1.5.0
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
sha512sums=('5aaf0a14706cd8df6dcc808a1851126fb8332fbc5d12a42aceaa2c5e12a3aa73effb7d5a1befcc7513dfbc7ff16aea1bf203436cf8d5f1bf298463a38ddc81ad')
b2sums=('f08ace69c95f18e03753225b72724ec84b4bd1ae0873e9194146974795c556a8dfe12f3d53ce654dca2502dfb81e65a41af33b74ba15b34b668c54cfa3632c06')

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
