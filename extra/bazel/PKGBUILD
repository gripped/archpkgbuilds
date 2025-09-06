# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Konstantin Gizdov <arch@kge.pw>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=bazel
pkgver=8.4.0
pkgrel=1
pkgdesc='Correct, reproducible, and fast builds for everyone'
arch=('x86_64')
license=('Apache-2.0')
url='https://bazel.build/'
depends=('java-environment=21' 'libarchive' 'zip' 'unzip' 'which')
makedepends=('git' 'protobuf' 'python')
options=('!debug' '!strip')
source=(
  "https://github.com/bazelbuild/bazel/releases/download/${pkgver}/bazel-${pkgver}-dist.zip"{,.sig}
)
b2sums=('e82189578965af3859d7e5d57545e9ee45263b21c68133c7526e09bae399cb2f50bfafefccb4a270bd4a78158754b60a43aa93af4c25ee57bdd453abca1cfa65'
        'SKIP')
validpgpkeys=('71A1D0EFCFEB6281FD0437C93D5919B448457EE0')

build() {
  EMBED_LABEL=$pkgver EXTRA_BAZEL_ARGS="--tool_java_runtime_version=local_jdk" ./compile.sh
  ./output/bazel build scripts:bazel-complete.bash
  cd output
  ./bazel shutdown
}

package() {
  install -Dm755 "${srcdir}/scripts/packages/bazel.sh" "${pkgdir}/usr/bin/bazel"
  install -Dm755 "${srcdir}/output/bazel" "${pkgdir}/usr/bin/bazel-real"
  local _bazel_major=${pkgver%%.*}
  ln -s bazel-real "${pkgdir}/usr/bin/bazel-$_bazel_major.x-linux-$CARCH"
  install -Dm644 "${srcdir}/bazel-bin/scripts/bazel-complete.bash" "${pkgdir}/usr/share/bash-completion/completions/bazel"
  install -Dm644 "${srcdir}/scripts/zsh_completion/_bazel" "${pkgdir}/usr/share/zsh/site-functions/_bazel"
  mkdir -p "${pkgdir}/usr/share/bazel"
  for d in third_party tools; do
    cp -r "${srcdir}/${d}" "${pkgdir}/usr/share/bazel/"
  done
}
# vim:set ts=2 sw=2 et:
