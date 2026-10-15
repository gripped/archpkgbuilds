# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>

pkgname=python-markdown
pkgver=3.11.1
pkgrel=1
pkgdesc="Python implementation of John Gruber's Markdown"
arch=(any)
url='https://python-markdown.github.io/'
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-yaml: parse Python in YAML metadata'
  'python-pygments: Code highlighting'
)
checkdepends=(python-yaml python-pygments)
source=("$pkgname::git+https://github.com/Python-Markdown/markdown#tag=$pkgver")
sha512sums=('39d932d0685dc2f4170eaed73df1dd4ca78c6ef1d05b8edcb38dd5b30c2cbeb328ae7fb169b0df13577bb56ddfe9e887a17bcd0ccc31ee08ce76dfab1dde7b14')
b2sums=('190347a694e8e0366f5f119e987decb372e376e8663972f76d516a3057722d0ec5ca3da323ab199a9dc88baf0656907950b9a91b6c1699f7510ed019d6db95e9')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover tests
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
