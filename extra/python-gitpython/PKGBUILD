# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.1.60
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
  procps-ng
)
source=("$pkgname::git+$url.git?signed#tag=$pkgver")
sha512sums=('b0b97ad3eb60baf161b35209749f45acd722c5ea6ac878312db4d85db3a30e362ad8da304f2f6d1cfbbe4bb3683729d578b02bdea962338fd615b4e3e669c76b')
b2sums=('1f605c8c5dd2d60e9615d08c403f637f21d5aaab99b27e4cdadab5313759b1a09c3d65d2798f7eef5ec8dc3bd30bd6a2489f7fd4f9c9fa918fd5a74a758ebd19')
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
    # ???
    --ignore ../../../../dev/test_git.py::TestGit::test_it_honors_kill_after_timeout_with_output_stream
  )

  cd "$pkgname"

  export TRAVIS="VERY CONVENIENT"
  # avoid `error: could not lock config file /dev/null: Permission denied` from git
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  git config --global user.name "Test User"
  git config --global user.email "test@user.org"
  ./init-tests-after-clone.sh
  PYTHONDONTWRITEBYTECODE=1 pytest -vv -c /dev/null "${deselected[@]}" test
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" {AUTHORS,CHANGES,{CONTRIBUTING,README}.md}

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
