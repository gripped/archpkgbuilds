# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=python-pytest-env
pkgver=1.7.0
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
sha512sums=('d9ee0b7e4c69a490fe83ccfcaaef6e8e92bccbfa5831e177feadb353e4ff3c526435b833cad91128681cff763944eff0a92ba4e41d3ced9dbf7ecc06917a9193')
b2sums=('dacee47e2f65cba304d4792171c525977dd04d212e15c7d81977d31d1345cf5ef54427721862be708794c47dadf145c02009d523313e43b9a992adf05fedf335')

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
