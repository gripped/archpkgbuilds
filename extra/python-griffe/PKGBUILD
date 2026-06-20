# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-griffe
pkgname=(
  python-griffe
  python-griffelib
  python-griffecli
)
pkgver=2.1.0
pkgrel=1
pkgdesc='Signatures for entire Python programs'
arch=(any)
url='https://mkdocstrings.github.io/griffe'
license=(ISC)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
source=(
  "$pkgbase::git+https://github.com/mkdocstrings/griffe#tag=$pkgver"
  static-version.patch
  replace-get_version.patch
)
sha512sums=('1dafd42016ab1ff9ad52fa7cae16518b54d1117fe1094a68dac23808f4c278ce3510a108e03c85e329090558d8fdd56dada9b9913260134bc8d42ae9650fa23a'
            'ea106bca001515439f1567b3f3ddce18ebfc9ea8e3d02c9edecc7849ef2cfb0db02c7952e680a2dd65f6ff7cab1df8eef6ba2bbebc945d1ff8f98fbb88aae116'
            'c225dc274b39d179603ce9a24cead0cf2b779b8d0bc359340e45e0881c0b00aa928b93db361c4ec6d54c1d11d53d91202e54541fc673c48133b676340a8fb82f')
b2sums=('3782b81d6a27e6c75e9d837f6fdb208d3d4c8221fdcd352c69c1bc381e4b816e0f7f12b5e20457b3c78f90a94a472b10a6c1e511091d4592afdc4b11c4d1e0a3'
        'aacce8c5a642c15be1bbab4122e615ac1449c75c744c240571006ba7341f646719af777c636669e1d3844b12fb4a373f75c731e97f3f0acd3d7286204b5b84dd'
        'ac9d61c0bc4ff1a9d11c628fbcc94c7730edf1721af731a58e10020e92bd3990f7dc42c121a1971c3075ce4fe47486ad2cd0174104318230feaa8d62894d81fe')

prepare() {
  cd "$pkgbase"

  # avoid pulling in an entire dependency tree just so some
  # python project can magically set a simple number
  patch -p1 -i "$srcdir/static-version.patch"

  # replace get_version() with a simpler implementation
  # also remove pdm-backend dependency
  patch -p1 -i "$srcdir/replace-get_version.patch"
  sed -e "s/@pkgver@/$pkgver/" -i scripts/get_version.py
}

build() {
  cd "$pkgbase"

  pushd packages/griffelib
  python -m build --wheel --no-isolation
  popd

  pushd packages/griffecli
  python -m build --wheel --no-isolation
  popd

  python -m build --wheel --no-isolation
}

package_python-griffe() {
  depends=(
    python
    python-griffelib
    python-griffecli
  )
  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-griffelib() {
  pkgdesc+=' (library package)'
  depends=(
    python
    python-griffecli
    python-typing_extensions
    # griffelib[pypi] dependencies
    python-platformdirs
    python-pip
    python-wheel
  )

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" packages/griffelib/dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python-griffecli() {
  pkgdesc+=' (cli package)'
  depends=(
    python
    python-griffelib
    python-colorama
  )

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" packages/griffecli/dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
