# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-griffe
pkgname=(
  python-griffe
  python-griffelib
  python-griffecli
)
pkgver=2.0.2
pkgrel=2
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
sha512sums=('afd2ac08aae25c0b16b2a2a6ce4e2f2fbcda5d846a6dc4132b67d40e149231847df56a3565cb7ab9ea1fd318add43b2bcbe5f34da2f3c566d521664c8e0ead5c'
            'ea106bca001515439f1567b3f3ddce18ebfc9ea8e3d02c9edecc7849ef2cfb0db02c7952e680a2dd65f6ff7cab1df8eef6ba2bbebc945d1ff8f98fbb88aae116'
            'c2b08c3a5850da7eecec067ec5159275e4cb38924827660427f1f9fe83cad7f308bf77e7bc91d49e3e1279ed04a15dd3787b5ea75850f347bccae591e309186c')
b2sums=('f09d99fc512141dfe74d23038443fa990716a502c2408fce785c58298d06b4228322942da78f7a3c8804f5584332e52af10270a016acab4e844d71f01822188b'
        'aacce8c5a642c15be1bbab4122e615ac1449c75c744c240571006ba7341f646719af777c636669e1d3844b12fb4a373f75c731e97f3f0acd3d7286204b5b84dd'
        '3d289c0de0d9b7cff40072609de8cd66b092a05e6f1d1923a22d20e7e5f294de3d839d85d48e5fdc84c0ef0146ba663d68a592e540b101dbf2fc09625ea745bb')

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
