# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.1.49
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
sha512sums=('64014d9f1e32ede570e0fd5393a398d715e596f228d79f488bcf53f951938d9b1b68a3f3647c505e126fd0c8814f1f9e9154cf573b5694c0b9957452cf476212')
b2sums=('04c2131f394f76b35e1863a17f3e3503189ca6e05623fce6c4474e72992380409e65a1d04b49f3fda93fc01ea89d44def7fbfab28d12f0e3f7a8f603b96bf88f')
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
