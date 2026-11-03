# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ini2toml
pkgver=0.16
pkgrel=3
pkgdesc="Automatically conversion of .ini/.cfg files to TOML equivalents"
url="https://github.com/abravalheri/ini2toml"
license=('MPL')
arch=('any')
# The default installation is broken. Adding [full] flavor dependencies here.
depends=('python-packaging' 'python-setuptools' 'python-configupdater' 'python-tomlkit')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest-randomly' 'python-tomli-w' 'python-validate-pyproject' 'python-tomli')
source=("git+https://github.com/abravalheri/ini2toml.git#tag=v$pkgver")
sha512sums=('fe406bf6aadf3a9aff661f4a9acc7f9501c63d7aa9db23cd99d0e9b59f959ba8d90a5d445ec55e90b11abcdf8852f9b611302824347ccef20f89ba73ce9d8571')

prepare() {
  cd ini2toml
  # https://github.com/abravalheri/ini2toml/pull/134
  # https://github.com/abravalheri/ini2toml/pull/134/commits/fe6e2432b47dd82dc713680d666de137ccf0695d.p
  # Fix extra leading newlines in multiline strings
  git cherry-pick -n fe6e2432b47dd82dc713680d666de137ccf0695d
}

build() {
  cd ini2toml
  python -m build --wheel --no-isolation
}

check() {
  cd ini2toml
  python -m venv --system-site-packages local-env
  local-env/bin/python -m installer dist/*.whl
  local-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd ini2toml
  python -m installer --destdir="$pkgdir" dist/*.whl
}
