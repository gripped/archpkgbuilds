# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cachebox
pkgver=6.2.11
pkgrel=1
pkgdesc="The fastest memoizing and caching Python library written in Rust"
arch=('x86_64')
url="https://github.com/awolverp/cachebox"
license=('MIT')
depends=('glibc' 'libgcc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-maturin' 'python-wheel' 'rust')
checkdepends=('python-hypothesis' 'python-pytest' 'python-pytest-asyncio')
source=("git+https://github.com/awolverp/cachebox.git#tag=v$pkgver"
        "0001-tests-pause-gc-around-recursive-test.patch")
sha512sums=('c42f5ab479d723a13baf1dd2a98fd1f5952b4f0bd52b33aa60c65fad5cf33f464909a54ee6a823f2316c64d2bb5b360d50efac42cf404f3566f84f90607972d9'
            '5f4e775118d9ca8c3d0eb550e9b81adaa6d03f52460aa8e1b9467153eaf3dd3c52694bd775d38be590745263738935e6671116295d03fedc863010f1f773c96b')

prepare() {
  cd cachebox
  # Python 3.14 finalizers can break pytest while formatting RecursionError.
  patch -Np1 -i "$srcdir"/0001-tests-pause-gc-around-recursive-test.patch
  cargo fetch --locked
}

build() {
  cd cachebox
  CARGO_NET_OFFLINE=true python -m build --wheel --no-isolation
}

check() {
  cd cachebox
  cargo test --frozen --no-default-features --lib

  python -m venv --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  # Child processes must also use the installed wheel instead of the source tree.
  HYPOTHESIS_PROFILE=slow PYTHONSAFEPATH=1 test-env/bin/python -P -m pytest --import-mode=importlib
}

package() {
  cd cachebox
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 LICENSE-THIRD-PARTY -t "$pkgdir"/usr/share/licenses/$pkgname/
}
