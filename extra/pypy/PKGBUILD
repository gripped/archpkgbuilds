# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=pypy
pkgver=7.3.22
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
sha512sums=('482020a7a40e5642d88d1474979d733b079dc65d75f5d0a431c6ee2a8136cc101be42dabe51063e9f376c606f62559c6ab681dc65cd0abb5fef4e8d69931ad39')

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
