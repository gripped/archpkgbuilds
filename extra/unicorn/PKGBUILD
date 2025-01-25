# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

pkgbase=unicorn
pkgname=(unicorn python-unicorn ruby-unicorn-engine)
pkgver=2.1.1
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='https://www.unicorn-engine.org'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  cmake
  python
  python-setuptools
  ruby
  ruby-rdoc
)
checkdepends=(
  cmocka
)
options=('!emptydirs')
source=(
  https://github.com/unicorn-engine/unicorn/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz
  bindings-ruby-fix-unexpected-uc_query-result-pointer.patch
)
sha512sums=('d6184b87a0fb729397ec2ac2cb8bfd9d10c9d4276e49efa681c66c7c54d1a325305a920332a708e68989cc299d0d1a543a1ceeaf552a9b44ec93084f7bf85ef2'
            '579700f4aad9c964c038f2ad77c8e26d0339dbfb96665f933d538a1f66e97486c02d671a41d996ab024ade2c8fdfc9c52c42e75fe368943fcbcac50019178ed2')
b2sums=('3dd434121418b9a4eb69683cfca6ec0cd019b632492fbfff421eaf26f4907a2f30bf78699b3afe28df624037e3973a5110a6ea21bd233e66a04a689d3e3e5d1c'
        '2b501cbe3ea0228b2727342c549bf54f01a72385f51e753c4ec03a2af223b19e729942ef9a5272c2677c11958b45fcd52022e84fae23599536d2d1288b290206')

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 < ../bindings-ruby-fix-unexpected-uc_query-result-pointer.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  export UNICORN_CFLAGS="${CFLAGS} -ffat-lto-objects"
  export UNICORN_QEMU_FLAGS="--extra-ldflags=\"$LDFLAGS\""
  export QEMU_CXXFLAGS="${CXXFLAGS}"
  export QEMU_LDFLAGS="${LDFLAGS}"
  cmake -B build \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -Wno-dev
  cmake --build build
  (cd bindings
    python const_generator.py python
    python const_generator.py ruby
  )
  (cd bindings/python
    # avoid rebuilding libunicorn.so
    env LIBUNICORN_PATH="/doesnotexist" python setup.py build
  )
  (cd bindings/ruby/unicorn_gem
    gem build unicorn-engine.gemspec
  )
}

check() {
  cd ${pkgbase}-${pkgver}
  ctest --test-dir build --output-on-failure
}

package_unicorn() {
  depends=(
    glibc
  )
  provides=(libunicorn.so)
  cd ${pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-unicorn() {
  depends=(
    unicorn
    python
    python-setuptools
  )
  cd ${pkgbase}-${pkgver}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_ruby-unicorn-engine() {
  depends=(
    unicorn
    ruby
  )
  replaces=('ruby-unicorn')
  cd ${pkgbase}-${pkgver}/bindings/ruby/unicorn_gem

  local _gemdir="$(gem env gemdir)"
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "${pkgdir}${_gemdir}" \
    --bindir "${pkgdir}/usr/bin" \
    ${pkgbase}-*.gem -- \
    --with-opt-include="${srcdir}/${pkgbase}-${pkgver}/include" \
    --with-opt-lib="${srcdir}/${pkgbase}-${pkgver}/build"

  install -Dm 644 ../sample* -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "${pkgdir}/${_gemdir}/cache/" \
    "${pkgdir}/${_gemdir}/gems/${_gemname}-${pkgver}/vendor/" \
    "${pkgdir}/${_gemdir}/doc/${_gemname}-${pkgver}/ri/ext/"

  find "${pkgdir}/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "${pkgdir}/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

# vim: ts=2 sw=2 et:
