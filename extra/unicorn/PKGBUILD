# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andreas 'Segaja' Schleifer <segaja at archlinux dot org>

pkgbase=unicorn
pkgname=(unicorn python-unicorn ruby-unicorn-engine)
pkgver=2.1.2
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='https://www.unicorn-engine.org'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  cmake
  python
  python-setuptools
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
  ruby
  ruby-rdoc
)
checkdepends=(
  cmocka
  python-pytest
)
options=('!emptydirs')
source=(
  https://github.com/unicorn-engine/unicorn/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz
  bindings-ruby-fix-unexpected-uc_query-result-pointer.patch
  unicorn-${pkgver}-python-setuptools.patch::https://github.com/unicorn-engine/unicorn/commit/0f45f15e303b4a7b15eb4ca61860452f0a071a3e.patch
)
sha512sums=('f05e16f02fbf527875f7246811307b8b224cecd4d305dd59490a2a51444672c7ec769153545c857b5425111c19b8c0c33abbb51fcc8d49c0777771d31cf32630'
            '579700f4aad9c964c038f2ad77c8e26d0339dbfb96665f933d538a1f66e97486c02d671a41d996ab024ade2c8fdfc9c52c42e75fe368943fcbcac50019178ed2'
            'b616f81b4352d5e50279da4c588400c76360958fc14fdb69ac376ed663197c480aa45b2c93d597b21ca8622716f86f1ad8de34c047951830f98c4c3f1f1e3afa')
b2sums=('3e97c0f0b6dccd157222d473ef51f28fbcaf72eda056713fe1463a3f741f1abe6fbf73d770f391c3730c02e94ede2de4f25c0bf460c80dcc560a79258a7338b2'
        '2b501cbe3ea0228b2727342c549bf54f01a72385f51e753c4ec03a2af223b19e729942ef9a5272c2677c11958b45fcd52022e84fae23599536d2d1288b290206'
        '9b5c1ca49409862b0fb5d4aa78cd1d57682538c04ebe7341238c7f54f18f0e99f3983fefec2a64819471a58376137843dcadb7e835c0b67096e2cf47a285e236')

export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -Np1 < ../bindings-ruby-fix-unexpected-uc_query-result-pointer.patch
  patch -Np1 < ../unicorn-${pkgver}-python-setuptools.patch
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
      -DUNICORN_LEGACY_STATIC_ARCHIVE=OFF \
      -Wno-dev
  cmake --build build
  (cd bindings
    python const_generator.py python
    python const_generator.py ruby
  )
  (cd bindings/python
    # avoid rebuilding libunicorn.so
    env LIBUNICORN_PATH="/doesnotexist" python -m build --wheel --no-isolation
    env LIBUNICORN_PATH="/doesnotexist" python -m installer --destdir=tmp_install dist/*.whl
  )
  (cd bindings/ruby/unicorn_gem
    gem build unicorn-engine.gemspec
  )
}

check() {
  cd ${pkgbase}-${pkgver}
  ctest --test-dir build --output-on-failure
  cd bindings/python
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export LD_LIBRARY_PATH=$PWD/../../build/
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  py.test -k 'not test_network_auditing and not test_shellcode.py'
  ./tests/test_shellcode.py
  ./tests/test_network_auditing.py
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
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_ruby-unicorn-engine() {
  depends=(
    glibc
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
