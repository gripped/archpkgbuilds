# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-cheetah3
pkgname=(python-cheetah3 python-cheetah3-docs)
pkgver=3.4.0
pkgrel=4
pkgdesc='A Python powered template engine and code generator'
arch=(x86_64)
url='https://cheetahtemplate.org'
license=(MIT CC-PDDC)
makedepends=(
  git
  python
  python-legacy-cgi
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-sphinx
)
checkdepends=(python-markdown python-pygments)
optdepends=(
  'python-markdown: for markdown filter'
  'python-pygments: for codehighlight filter'
)
source=(
  "$pkgbase::git+https://github.com/CheetahTemplate3/cheetah3#tag=$pkgver"
  cheetah.1
)
sha512sums=('0822adf0e3f14e15c768c6a700fd2d7ba23252de7ae67b86659c60aea7bc1e81843901722872128cf8a7fde7ccb96b60dfd3cc41e87ef42fa772d49bdadad1fc'
            'ae100dee3893c120db8f6544b04db434b412bf0123f7feb40cca15e1866e0e6940a3d74d9baf87b04ebae7314f564929ebc7f34ae5eb72418200f7b01358235e')
b2sums=('94528d7db791e90a8d4109d32d51963f657efae8b5a6e45885ce0ffc8c86fda6bbd9c7d310438235998a18430144cf238a24f28c64e48a2a9c8dde492d6101f6'
        '59c0689df18640aea8e671cd267741d1bff4b3954147a34ac71c67ec8399c08460976ecabdce7c7b866bd895c8963b6f03059e496eb7dfa2710d99deba78503d')

build() {
  cd "$pkgbase"

  python -m build --wheel --no-isolation

  # generate documentation
  PYTHONPATH="$PWD:$PYTHONPATH" make -C docs html
}

check() {
  cd "$pkgbase"

  export PYTHONPATH="$PWD:$PYTHONPATH"
  export PATH="$PWD/bin:$PATH"
  python Cheetah/Tests/Test.py
}

package_python-cheetah3() {
  depends=(python python-legacy-cgi)
  optdepends=(
    'python-markdown: for markdown filter'
    'python-memcache: for caching'
    'python-pygments: for code highlight filter'
    'python-cheetah3-docs: documentation'
  )

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$srcdir/cheetah.1"
  ln -sf cheetah.1.gz "$pkgdir/usr/share/man/man1/cheetah-compile.1.gz"
  ln -sf cheetah.1.gz "$pkgdir/usr/share/man/man1/cheetah-analyze.1.gz"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgbase" LICENSE
}

package_python-cheetah3-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" README.rst
  cp -vr docs/_build/html "$pkgdir/usr/share/doc/$pkgbase"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
