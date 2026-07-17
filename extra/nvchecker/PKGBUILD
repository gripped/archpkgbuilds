# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=nvchecker
pkgver=2.21
pkgrel=1
pkgdesc="New version checker for software releases"
arch=('any')
url="https://github.com/lilydjwg/nvchecker"
license=('MIT')
depends=('python' 'python-structlog' 'python-platformdirs' 'python-tornado' 'python-pycurl')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             # for building docs
             'python-docutils' 'python-pygments'
             # optional deps
             'python-gobject' 'python-toml' 'python-aiohttp' 'python-httpx')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-pytest-rerunfailures'
              'pyalpm' 'python-awesomeversion' 'python-lxml' 'python-jq' 'git')
optdepends=(
  'pyalpm: for using "sort_version_key = vercmp" in configuration files and the alpm source'
  'python-awesomeversion: for using "sort_version_key = awesomeversion" in configuration files'
  'python-lxml: for the htmlparser source'
  'python-packaging: for the pypi source'
  'python-jq: for the jq source'
  'python-toml: for nvchecker-ini2toml script'
  'python-aiohttp: alternative HTTP backend'
  'python-httpx: alternative HTTP backend'
  'git: support for git repositories'
  'python-gobject: for nvchecker-notify'
  'libnotify: for nvchecker-notify'
)
source=("git+https://github.com/lilydjwg/nvchecker.git?signed#tag=v$pkgver")
sha512sums=('a8f0d06a50332024eabcf7318c03225b956838d49b6842cd0a6e0b2fba08cc6556dcced8c21539b0ffb51ba1ee379d5eaf69567cc0b5ebc31a493c6e9a210edd')
validpgpkeys=(
  # No direct trust chain. Some related stuffs:
  # https://api.github.com/users/lilydjwg/gpg_keys
  # https://zh.wikipedia.org/wiki/User:Lilydjwg
  '356690A1E7404E30D0E902B2E64D049594A54F54'
)

_backports=(
  da11370b404e1546b23cfd559df0b3646ada9bd7
  1ee24160f38063d7bec9cd8860c3c81d6349e058
)

prepare() {
  cd nvchecker

  # this loop is stolen from core/systemd :)
  local _c
  for _c in "${_backports[@]}"; do
    if git merge-base --is-ancestor "${_c}" HEAD; then
      echo $_c is already included!
      continue
    fi
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
}

build() {
  cd nvchecker
  python -m build --wheel --no-isolation

  make -C docs man
}

check() {
  cd nvchecker
  # https://github.com/lilydjwg/nvchecker/issues/310
  pytest --deselect tests/test_container.py::test_container_with_tag
}

package() {
  cd nvchecker
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  # bash completion scripts & docs
  install -Dm644 scripts/nvtake.bash_completion "$pkgdir"/usr/share/bash-completion/completions/nvtake
  install -Dm644 docs/usage.rst -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 sample_config.toml -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 docs/_build/man/nvchecker.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim:set ts=2 sw=2 et:
