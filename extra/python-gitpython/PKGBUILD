# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.1.56
pkgrel=1
url="https://github.com/gitpython-developers/gitpython"
license=(BSD-3-Clause)
arch=(any)
depends=(
  git
  python
  python-gitdb
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-ddt
  python-pytest
  python-pytest-mock
)
source=("$pkgname::git+$url.git?signed#tag=$pkgver")
sha512sums=('910a55b66212b8bd2233debe83a22721e3cbfc1eff36f8ddf4fa1fd075f6a3510de69227feacd9da8dca46d6f96c9b54fa98c3659044c395ffb8662616ca048d')
b2sums=('3621527d9dc73d21c8bd6b584581de87734a0b27a878ed3d02c44bf8f144ee3cba1499a970c58b1994f57f2075e19c1496206baa3aaeb65dd65c6a902736d2b8')
validpgpkeys=('27C50E7F590947D7273A741E85194C08421980C9') # Sebastian Thiel (In Rust I trust!) <byronimo@gmail.com>

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  local deselected=(
    --deselect git/ext/gitdb/gitdb/test/db/test_git.py::TestGitDB::test_reading
    --deselect git/ext/gitdb/gitdb/test/db/test_ref.py::TestReferenceDB::test_writing
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_correctness
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_loose_correctness
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack.py::TestPackedDBPerformance::test_pack_random_access
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack_streaming.py::TestPackStreamingPerformance::test_pack_writing
    --deselect git/ext/gitdb/gitdb/test/performance/test_pack_streaming.py::TestPackStreamingPerformance::test_stream_reading
    --deselect git/ext/gitdb/gitdb/test/test_example.py::TestExamples::test_base
    --deselect test/test_submodule.py::TestSubmodule::test_git_submodules_and_add_sm_with_new_commit
    --deselect test/test_submodule.py::TestSubmodule::test_list_only_valid_submodules
    # https://github.com/gitpython-developers/GitPython/issues/1797
    --ignore test/test_index.py
  )

  cd "$pkgname"

  export TRAVIS="VERY CONVENIENT"
  # avoid `error: could not lock config file /dev/null: Permission denied` from git
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git config --global user.name "Test User"
  git config --global user.email "test@user.org"
  ./init-tests-after-clone.sh
  PYTHONDONTWRITEBYTECODE=1 pytest -vv -c /dev/null "${deselected[@]}"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" {AUTHORS,CHANGES,{CONTRIBUTING,README}.md}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
