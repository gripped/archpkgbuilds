# Maintainer: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Masato TOYOSHIMA <phoepsilonix at phoepsilonix dot love>

## Mozc compile option
_mozc_commit=acc6b842

_bcr_commit=3001281d5
# Following are subject to change if bcr, bazel, and mozc commit changes.
# The build process does not necessary use all of them, but it is required to allow a no download build process.
# https://github.com/fcitx/flatpak-fcitx5/blob/master/mozc-deps.yaml has a constantly maintain list of these files
#
# Also jigyosyo.zip and ken_all.zip may be updated without notice.
_bazel_deps=(
    https://github.com/abseil/abseil-cpp/releases/download/20250814.0/abseil-cpp-20250814.0.tar.gz
    https://github.com/astral-sh/python-build-standalone/releases/download/20250610/cpython-3.11.13+20250610-x86_64-unknown-linux-gnu-install_only.tar.gz
    https://github.com/bazel-contrib/bazel_features/releases/download/v1.30.0/bazel_features-v1.30.0.tar.gz
    https://github.com/bazel-contrib/rules_python/releases/download/1.5.4/rules_python-1.5.4.tar.gz
    https://github.com/bazelbuild/apple_support/releases/download/1.23.1/apple_support.1.23.1.tar.gz
    https://github.com/bazelbuild/bazel-skylib/releases/download/1.8.1/bazel-skylib-1.8.1.tar.gz
    https://github.com/bazelbuild/platforms/releases/download/1.0.0/platforms-1.0.0.tar.gz
    https://github.com/bazelbuild/rules_android_ndk/releases/download/v0.1.3/rules_android_ndk-v0.1.3.tar.gz
    https://github.com/bazelbuild/rules_apple/releases/download/4.1.2/rules_apple.4.1.2.tar.gz
    https://github.com/bazelbuild/rules_cc/releases/download/0.2.2/rules_cc-0.2.2.tar.gz
    https://github.com/bazelbuild/rules_java/releases/download/8.14.0/rules_java-8.14.0.tar.gz
    https://github.com/bazelbuild/rules_kotlin/releases/download/v1.9.6/rules_kotlin-v1.9.6.tar.gz
    https://github.com/bazelbuild/rules_license/releases/download/1.0.0/rules_license-1.0.0.tar.gz
    https://github.com/bazelbuild/rules_pkg/releases/download/1.1.0/rules_pkg-1.1.0.tar.gz
    https://github.com/bazelbuild/rules_shell/releases/download/v0.3.0/rules_shell-v0.3.0.tar.gz
    https://github.com/bazelbuild/rules_swift/releases/download/3.1.2/rules_swift.3.1.2.tar.gz
    https://github.com/hiroyuki-komatsu/japanese-usage-dictionary/archive/refs/tags/2025-01-25.zip
    https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/33524763837473258e7ba2f14b17fc3a70519831/jigyosyo.zip
    https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/33524763837473258e7ba2f14b17fc3a70519831/ken_all.zip
    https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz
    https://github.com/protocolbuffers/protobuf/releases/download/v32.0/protobuf-32.0.zip
)

_pkgbase=mozc
pkgname=fcitx5-mozc
pkgdesc="Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
pkgver=3.33.6079.2
pkgrel=1
arch=('x86_64')
url="https://github.com/google/mozc"
license=('BSD-3-Clause AND Apache-2.0 AND LGPL-2.0-or-later AND LicenseRef-Unicode-DFS-2015 AND LicenseRef-NAIST-2003')
depends=('qt6-base' 'fcitx5' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('git' 'bazel' 'python')
replaces=('mozc-fcitx')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx-mozc')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        git+https://chromium.googlesource.com/breakpad/breakpad
        git+https://github.com/google/googletest.git
        git+https://chromium.googlesource.com/external/gyp
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
        git+https://github.com/microsoft/wil.git
        git+https://github.com/google/protobuf.git
        git+https://github.com/abseil/abseil-cpp.git
        git+https://github.com/bazelbuild/bazel-central-registry#commit=${_bcr_commit}
)

for _bazel_dep in "${_bazel_deps[@]}"; do
  if [[ ! " ${source[*]} " =~ [[:space:]]${_bazel_dep}[[:space:]] ]]; then
    source+=("$_bazel_dep")
  fi
  if [[ ! " ${noextract[*]} " =~ [[:space:]]${_bazel_dep##*/}[[:space:]] ]]; then
    noextract+=("${_bazel_dep##*/}")
  fi
done

sha512sums=('1003346e87b2e4dcc1a0b8e984ab3fe79bb21204fe954a38e01ddb004547aa005bcc685593a6a751d1ecce9972fca2977d2da41c787169739472e68355ac8321'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bcc112bd6280707ea56406d1d8efba4fb56f39eae41c1d0e587b4d5811dabf2513a9f3887ecbe0b11554f36c25afdc2a924d4b23a69bdd52469e08ed1431441e'
            '4ee1a217203933382e728d354a149253a517150eee7580a0abecc69584b2eb200d91933ef424487e3a3fe0e8ab5e77b0288485cac982171b3585314a4417e7d4'
            'c4aa3a09324abcbc1a2d9aa6a6278645d74af63cad76666224e53c50620450fb686c067db0f799afe84fefe575e0b2bea13b1b952f55e7e075562194b8e5ac43'
            '9cca730483639e6b711c1e48d8d916839d5c618eda0b07ccb965184e79326ac6fcecc1446c61efcb4f7bb76b557e291cd2666b90e280dc8a4a76e1f9c09f1bb2'
            'c702e38d13e7b502408aadc313878682272f5e86059350b7568ac07f518439c8645b69ad0ecacc997caa9405ea0c838b7dc08f2d4eb531190d6067c610d30237'
            '60991d408dc073245ab1ae407286e30a6e1390063546d9d6017aa2d395443dfb924b60a5553b930aa7b5ce549200e90354135dabda3ce397232ee300331f1ee8'
            '519623c2ddce5606ffd101108667ca82b12a53da8c6f01d176b61339dae383b747ae4a6a96584e56b4ee6b1a57167813ee29ccae9736202907b8f3c401458d4f'
            'cb05b7157e4e3b8ec05f1e4ac3e5eecc73d9a3ed5729455058a1290a5f04fb4e58be30368fc2ce6a90d6938ada331ea2abaeaaeaede16d1ae2ee091fa0c1faef'
            '6fc90f12ff4736a50e058b1d675b47fe2bb63320b27c42c3be996c52b0076e17248ce246849cc264cd96418c046d54075ebf8ee2ddb3b74b8813d605e8968135'
            '0494e784c5140059903cf8eeabd900125c5f917c6e2afdd2bdcb39b8c5c01a928ef3f717ce24cf10c8c3c6fae252d9cb246abe6ece63a9a40bd9cfb1f995710b'
            '1cbad05b9b40460f398d767d73c2d4edcf546c6402d38c98e703664b8201f6eacb9195713a632715613c49c65cc6d182c05193a3594835b5a85bcba59ef27b63'
            'b7ea0d839c9ed2edfe3042d8d7ffffeaee66547d9ec6670e71fcadadaa21a465e4fe0db7fae0fd2840a3499a06d1c4543378b96050387bd164ae28b657e9c1ce'
            '0e2d538a4d4c200d40ad0041d7ccc3155670247144b2be322607c5db219262fd6f7de512b54df9ed3bae72213ca340b6919a0248a00260b451af93042ccd3216'
            '17801f13c8a019de7e85a81ccfe6147ee9b996bbb72bbf4753aadb62e13c7c05040012182f3e557395a36453d8c7e9ca504b624bd2e490447656d0196c0fc6bb'
            '8eae67ababbf596d0c86f5ac9d6c6a0853f301c682df50403509b3bf2a85fdfc8532c4ca0c11e4ab85dac2bdb23165c8bbbeb35eb695a58a29b83c12a40abf55'
            '384f14574edf22fc7b515ca184b2af3868ea21aac31247a53aa5dab44293ed92dfed13807f1428051d6a539fd40f0fdb7e83ac2c8c8811be9ecdaa9725f044db'
            'd3155ed53b2811e17d3f92f1e1641a09e115c50c8dce686766b138b618925d9e60a1322655394e978fd9e6abc503bbc2601ef1f15ffef63826cb955bd5899554'
            'e2d71432836855192bee9ccf45781aef797d0112a0444684c782a5310cec35ff96793c2d4aba80ad2e71b789839f4fa1c70eb175be09a1c92e747639b0f6ab3e'
            'ec76f0c9b02a8f0a8633d752ebdb80ac7c4d5c71dfd9916cc9140d446bae8e09755db8d40eca87fbb08d21c31db80ec977f307c497f0d731087c73a1df9ea0c7'
            '00aef90b785a703d536813616eeec7057eeaf681b83bc35c6c4b597df298ccb6bbd97f97845c7570788e7f063d94b4c62e359ccc698fcaeff17ce472bc1b9225'
            '580677aad97093829090d4b605ac81c50327e74a6c2de0b85dd2e8525553f3ddde17556ea46f8f007f89e435493c9a20bc997d1ef1c1c2c23274528e3c46b94f'
            '53ba7921add31048adb7ae0fc442d819bf2e9dae5341163770cfc165795b80b19e81aa281f90757a637929acfff200c50ab1c1d09e8612e7a50cd0c3a6e374ba')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

pkgver(){
  cd mozc/src
  # https://github.com/google/mozc/discussions/1429
  # REVISION in mozc_version_template.bzl is no longer used by Bazel builds.
  # REVISION will be probably removed once GYP builds are completely removed.
  bazel build --config oss_linux --config stable_channel base:mozc_version_txt >/dev/null 2>&1
  source <(grep -E '^(MAJOR|MINOR|BUILD_OSS|REVISION)\s*=' bazel-bin/base/mozc_version.txt)
   _bzr_ver="$MAJOR.$MINOR.$BUILD_OSS.$REVISION"
  printf "%s" "${_bzr_ver}"
}

prepare() {
  SHA256_ZIP_CODE_KEN_ALL=$(sha256sum ken_all.zip | cut -d' ' -f1);
  SHA256_ZIP_CODE_JIGYOSYO=$(sha256sum jigyosyo.zip | cut -d' ' -f1);
  cd "$srcdir/mozc"
  git submodule init
  git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.src/third_party/wil.url "$srcdir/wil"
  git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git -c protocol.file.allow=always submodule update

  # bazel will always download file without checksum, set checksum so bazel will not download it.
  sed -e "s|SHA256_ZIP_CODE_KEN_ALL = \(.*\)|SHA256_ZIP_CODE_KEN_ALL = \"${SHA256_ZIP_CODE_KEN_ALL}\"|" \
      -e "s|SHA256_ZIP_CODE_JIGYOSYO = \(.*\)|SHA256_ZIP_CODE_JIGYOSYO = \"${SHA256_ZIP_CODE_JIGYOSYO}\"|" \
      -i src/config.bzl src/MODULE.bazel

}

build() {
  cd mozc/src

  # Use srcdir for pre-download files and override registry with local mirror.
  # bazel only respects CC from environment, not CXXFLAGS and LDFLAGS.
  # Pass them with --cxxopt, and --linkopt.
  bazel build \
      --config oss_linux \
      --config stable_channel \
      --distdir="${srcdir}" \
      --registry="file://${srcdir}/bazel-central-registry" \
      --copt=-DNDEBUG \
      $(echo "${CFLAGS}"|xargs -n1 echo "--conlyopt") \
      $(echo "${CXXFLAGS}"|xargs -n1 echo "--cxxopt") \
      --nostart_end_lib \
      --linkopt=-fuse-ld=bfd \
      $(echo "${LDFLAGS}"|xargs -n1 echo "--linkopt") \
      --copt="-Wno-uninitialized" \
      --host_copt="-Wno-uninitialized" --verbose_failures \
      unix/fcitx5:fcitx5-mozc.so \
      server:mozc_server \
      gui/tool:mozc_tool
}

package() {
  cd mozc/src
  export PREFIX="${pkgdir}/usr"
  ../scripts/install_server_bazel
  ../scripts/install_fcitx5_bazel

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
