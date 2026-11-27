# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-griffe
pkgname=(
  python-griffe
  python-griffelib
  python-griffecli
)
pkgver=2.4.1
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
  simple-version.patch
)
sha512sums=('ec8a41d867c1bcea90c467afde36e5832dd7881fcfc73fd682b0551df5499de5362792c5e4eab0ab5b78ec6802ca1b319997939fa188a80a431b92968a17e576'
            '3d40f0837b68bcc3412fc7d14639d57362972a3cffe75dd09f18d358da7ea2a6084048b1bba8a294c84c1e16407e73e30f77be6d7a2f03697c8cbd1c6c1ccb42')
b2sums=('770dc5007f782891654d7d66d5a62e60a2bc210e7c6b2773d383d858a25d76944ed0e01b4d320337125cd194823a6e548402624aeaf20871f2b2ae18e8c71c24'
        'ccb0de5a562fc96e095b5096d73cb9c17ea4949c69c14bb4384d915ad00638a45c9d998e69622194055f1d1bc144dbd31da42a5b4e8cdf0bd288313fbe9c38be')

prepare() {
  cd "$pkgbase"

  # * avoid pulling in an entire dependency tree just so some
  # python project can magically set a simple number
  # * replace get_version() with a simpler implementation
  # * remove pdm-backend dependency
  patch -p1 -i "$srcdir/simple-version.patch"
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
