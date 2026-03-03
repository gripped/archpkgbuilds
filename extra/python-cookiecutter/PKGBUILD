# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.7.0
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=(any)
url="https://github.com/cookiecutter/cookiecutter"
license=(BSD-3-Clause)
depends=(
  python
  python-arrow
  python-binaryornot
  python-click
  python-jinja
  python-pyyaml
  python-requests
  python-rich
  python-slugify
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pytest
  python-pytest-mock
)
source=($url/archive/v$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('9fb441788c7b58f74e1e982519c2c66872751c4be45d65d35a3bafd41f767d6383f984ddb54ffc92f654aa96a1011a7861b618ac4dd91443bc00f366705ce842')
b2sums=('2810a34e1388afba3aaaf8e5b0580a08d28f9fe2d9b6b02a3289024e9e1c9abac6cdbf9151e6d69da370a6d01ed1778a03c38272ba0f94239f4c272a9e4e919e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=''  # we do not care about coverage
    # ignore tests that download the internet with git
    --deselect tests/vcs/test_clone.py::test_clone_handles_repo_typo
    --deselect tests/vcs/test_clone.py::test_clone_handles_branch_typo
    --deselect tests/vcs/test_clone.py::test_clone_unknown_subprocess_error
  )

  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
