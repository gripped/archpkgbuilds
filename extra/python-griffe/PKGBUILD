# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=python-griffe
pkgname=(
  python-griffe
  python-griffelib
  python-griffecli
)
pkgver=2.3.2
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
sha512sums=('c90614f6d319e3059b1f10686c9380889f297e879d8947db00a897c325dd5bb6d579f0b1e79b3de770c034fb80bbf7b9c6accc23402862c782b5b165522aea87'
            '25e190e21e983239228e236288d372c1600fc946b432d3da825d232b4bc15294d5834a079b1b37010af167ec23f8074b4dd0b0ed14c956fe8d2a0769f5d25243'
            'b653bc4a7866a950c71e473aca1776024e9236eac90d6827a6f0f20cbbdd21ca197ea9c749110120c175f79b099f9f3a0a8e4d05afca3982f1924329f5b26df8')
b2sums=('360f72e0819555e77977518fc58252369c370cce88c211c6f1b58bc5c0f2425c035e0e8ce81cc56e02be47f12f9f50c0b1d84fbf2584e23ae00742c3ed4fc89c'
        '39f9e6465e53fd76619542a162c328afae94be4d4d80d7be8735f99e114cf0f4b18cd6c3477acb1d8ea8b795d3114e604f24cd45263b1086e5a51aca160d6026'
        '3197f551a037a970ca2a22660f43da29cc2715ce2a22dc3cf5a630f93a9115d0431a8f30f144afd40af2e682d6849323c5a2bd76f724a9af4cd58a6570e41297')

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
