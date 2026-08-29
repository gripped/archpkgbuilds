# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

pkgdesc="A python library used to interact with Git repositories"
pkgname=python-gitpython
pkgver=3.1.61
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
sha512sums=('0fd63e5955d08032f13aa8cb006f733d380349c4a258fc71d50605e66fd761f7a3e99bdee3c3a5d31d27658a06095d6d4b290132fb5ec73c11af0fd494e18c12')
b2sums=('805679ad74eb51b99c64cb511bcc095f25958d13e03f114f91b0286e1a3061359f8c147300e550cf090110ca09b7ec2e13889c142fb76782e666f7f1f7b47f1c')
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
