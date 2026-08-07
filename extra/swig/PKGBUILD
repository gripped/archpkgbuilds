# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# Note:
# When bumping major or minor versions, some downstream packages that use somewhat
# unorthodox runtime arrangements need rebuilding to match. After SWIG version
# bumps please rebuild first python-pivy then freecad in addition to usual suspects.
# c.f. https://github.com/FreeCAD/FreeCAD/issues/25048#issuecomment-3627741495
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/python-pivy/-/issues/1
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/swig/-/issues/2

pkgname=swig
pkgver=4.5.0
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('x86_64')
url="https://www.swig.org/"
license=(
  GPL-3.0-or-later
  LicenseRef-BSD-Arizona
  LicenseRef-BSD-Chicago
  LicenseRef-BSD-Utah-California
)
depends=(
  'libgcc'
  'libstdc++'
  'glibc'
  'pcre2'
  'zlib'
)
checkdepends=('ruby' 'python' 'java-environment' 'tcl' 'php' 'lua' 'r' 'go' 'boost')
makedepends=('git')
source=(git+https://github.com/swig/swig#tag=v$pkgver)
sha512sums=('847b78883be86688237f5f50725a490b23ac334a22cf05a01dc9809f6ef2354bd41e54414a6149d22391458afd20151c4b82dcfd6df8a5fcf08280dcf83d66b7')

prepare() {
  sed -n '5,32p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt

  cd $pkgname
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}
  make check PY3=y
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
