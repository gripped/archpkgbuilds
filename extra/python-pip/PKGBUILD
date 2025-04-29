# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

_name=pip
pkgname=python-pip
pkgver=25.1
pkgrel=1
pkgdesc="The PyPA recommended tool for installing Python packages"
url="https://pip.pypa.io/"
arch=(any)
license=(MIT)
depends=(
  python
  python-attrs  # for vendored rich
  python-cryptography  # for vendored requests and urllib3
  python-filelock  # for vendored python-cachecontrol
  python-wheel  # for internal misc utils
)
makedepends=(
  python-build
  python-installer
  python-myst-parser
  python-setuptools
  python-sphinx
  python-sphinx-copybutton
  python-sphinx-inline-tabs
  python-sphinx-issues
)
checkdepends=(
  git
  python-freezegun
  python-proxy.py
  python-pytest
  python-pytest-rerunfailures
  python-pytest-xdist
  python-scripttest
  python-tomli-w
  python-virtualenv
  python-werkzeug
  subversion
)
source=(https://github.com/pypa/$_name/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('d6b93aeabe6a4e046caf85c028fca380936ab65cb3c5028a7fa7dbc61cef2cf7d0c46c499fe548dc0af8f7bc30f7ecace8f257b20a60c0cc905b531f193b5a9d')
b2sums=('3e719b180dd4f039a1bf15cdd2686fdc270e842e4b9ab416306bf9ea40c037541df05af78239fe067dfa3edc27b7370ea04c1d9cec43cc6cfd2f9e8f347f41ee')

prepare() {
  # pip is moving towards a separate sphinx config without towncrier https://github.com/pypa/pip/issues/12881
  # since python-sphinxcontrib-towncrier is broken, we remove its use (as it is not needed for manpages)
  sed '/towncrier/d' -i $_name-$pkgver/docs/html/conf.py
}

build() {
  cd $_name-$pkgver

  python -m build --wheel --no-isolation

  cd docs/
  PYTHONPATH="$srcdir/$_name-$pkgver/src/" python pip_sphinxext.py
  PYTHONPATH="$srcdir/$_name-$pkgver/src/" sphinx-build -b man -d build/doctrees/man man build/man -c html
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  local _deselected=(
    # deselect tests that would require python-pip in checkdepends (may or may not work due to devendored dependencies when python-pip is updated)
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_with_source_dir_obtains_commit_id
    --deselect tests/unit/test_direct_url_helpers.py::test_from_link_vcs_without_source_dir
    --deselect tests/unit/test_wheel_builder.py::test_should_cache_git_sha
    # disable downloading the internet
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_web_archive
    --deselect tests/unit/test_req.py::TestRequirementSet::test_download_info_vcs
    --deselect tests/unit/test_network_session.py::TestPipSession::test_proxy
    # fails due to EXTERNALLY-MANAGED / PEP 668 behaviour in v25
    --deselect tests/unit/test_self_check_outdated.py::test_pip_self_version_check_calls_underlying_implementation
  )

  cd $_name-$pkgver
  # install to temporary location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -m unit "${_deselected[@]}" tests/
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 docs/build/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"

  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --bash | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --zsh | tail -n+3 | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_pip
  PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir"/usr/bin/pip completion --fish | install -vDm 644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/pip.fish
}
