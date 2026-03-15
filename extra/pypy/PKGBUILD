# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=pypy
pkgver=7.3.21
pkgrel=1
pkgdesc="A Python implementation written in Python, JIT enabled"
url="https://pypy.org"
arch=('x86_64')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib' 'ncurses')
makedepends=('pypy' 'tk' 'sqlite' 'mercurial')
optdepends=('sqlite: sqlite module'
            'tk: tk module')
license=('MIT')
source=("https://downloads.python.org/pypy/pypy2.7-v${pkgver}-src.tar.bz2")
sha512sums=('9a0875ce1f621a571a91c5372778aa67c0cd48270139896cc7aeec9973ff2ff44779e9aea68c534daa7485edad8707376421ab5785daf6414331c881bf59d16e')

build() {
  cd pypy2.7-v${pkgver}-src/pypy/goal

  # Workaround for https://github.com/pypy/pypy/issues/5194
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"

  pypy ../../rpython/bin/rpython -Ojit --shared targetpypystandalone

  # Compile binary modules
  PYTHONPATH=../.. ./pypy-c ../../lib_pypy/pypy_tools/build_cffi_imports.py
}

package() {
  cd pypy2.7-v${pkgver}-src

  # Prepare installation
  pypy pypy/tool/release/package.py --archive-name pypy --targetdir .
  mkdir unpacked
  tar xf pypy.tar.bz2 -C unpacked

  # Install pypy
  cd unpacked
  install -Dm755 pypy/bin/pypy "${pkgdir}"/opt/pypy/bin/pypy
  install -Dm755 pypy/bin/libpypy-c.so "${pkgdir}"/opt/pypy/bin/libpypy-c.so
  cp -r pypy/include pypy/lib_pypy pypy/lib-python pypy/site-packages "${pkgdir}"/opt/pypy/
  cd ..

  # Install symlink
  mkdir -p "${pkgdir}"/usr/bin "${pkgdir}"/usr/lib
  ln -s /opt/pypy/bin/pypy "${pkgdir}"/usr/bin/pypy
  ln -s /opt/pypy/bin/libpypy-c.so "${pkgdir}"/usr/lib/libpypy-c.so

  # Install misc stuff
  install -Dm644 README.rst "${pkgdir}"/opt/pypy/README.rst
  install -Dm644 LICENSE "${pkgdir}"/opt/pypy/LICENSE
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/pypy/LICENSE
}
# vim: ts=2 sw=2 et:
