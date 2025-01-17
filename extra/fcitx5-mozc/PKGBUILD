# Maintainer: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Masato TOYOSHIMA <phoepsilonix at phoepsilonix dot love>

## Mozc compile option
_mozc_commit=9dc8247

## follow the submodule commits in https://github.com/fcitx/mozc/tree/fcitx/src/third_party
_abseil_cpp_commit=4447c756
_breakpad_commit=216cea7b
_gtest_commit=b514bdc8
_gyp_commit=9ecf45e3
_japanese_usage_dictionary_commit=e5b3425
_protobuf_commit=796e49f6c
_wil_commit=fc5dbf5

_bcr_commit=97be491d9
# Following are subject to change if bcr, bazel, and mozc commit changes.
# The build process does not necessary use all of them, but it is required to allow a no download build process.
# https://github.com/fcitx/flatpak-fcitx5/blob/master/mozc-deps.yaml has a constantly maintain list of these files
#
# Also jigyosyo.zip and ken_all.zip may be updated without notice.
_bazel_deps=(
    https://github.com/abseil/abseil-cpp/releases/download/20240722.0/abseil-cpp-20240722.0.tar.gz
    https://github.com/bazel-contrib/bazel_features/releases/download/v1.21.0/bazel_features-v1.21.0.tar.gz
    https://github.com/bazelbuild/apple_support/releases/download/1.16.0/apple_support.1.16.0.tar.gz
    https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz
    https://github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz
    https://github.com/bazelbuild/rules_android_ndk/releases/download/v0.1.2/rules_android_ndk-v0.1.2.tar.gz
    https://github.com/bazelbuild/rules_apple/releases/download/3.16.1/rules_apple.3.16.1.tar.gz
    https://github.com/bazelbuild/rules_cc/releases/download/0.0.16/rules_cc-0.0.16.tar.gz
    https://github.com/bazelbuild/rules_java/releases/download/8.6.1/rules_java-8.6.1.tar.gz
    https://github.com/bazelbuild/rules_kotlin/releases/download/v1.9.6/rules_kotlin-v1.9.6.tar.gz
    https://github.com/bazelbuild/rules_license/releases/download/1.0.0/rules_license-1.0.0.tar.gz
    https://github.com/bazelbuild/rules_pkg/releases/download/1.0.1/rules_pkg-1.0.1.tar.gz
    https://github.com/bazelbuild/rules_python/releases/download/1.0.0/rules_python-1.0.0.tar.gz
    https://github.com/bazelbuild/rules_shell/releases/download/v0.2.0/rules_shell-v0.2.0.tar.gz
    https://github.com/bazelbuild/rules_swift/releases/download/2.1.1/rules_swift.2.1.1.tar.gz
    https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/jigyosyo.zip
    https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/ken_all.zip
    https://github.com/indygreg/python-build-standalone/releases/download/20241016/cpython-3.11.10+20241016-x86_64-unknown-linux-gnu-install_only.tar.gz
    https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz
)

_pkgbase=mozc
pkgname=fcitx5-mozc
pkgdesc="Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
pkgver=2.31.5712.102.g9dc8247
pkgrel=1
arch=('x86_64')
url="https://github.com/google/mozc"
license=('BSD-3-Clause AND Apache-2.0 AND LGPL-2.0-or-later AND LicenseRef-Unicode-DFS-2015 AND LicenseRef-NAIST-2003')
depends=('qt6-base' 'fcitx5' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('git' 'bazel' 'python')
replaces=('mozc-fcitx')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx-mozc')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        git+https://chromium.googlesource.com/breakpad/breakpad#commit=${_breakpad_commit}
        git+https://github.com/google/googletest.git#commit=${_gtest_commit}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_commit}
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}
        git+https://github.com/microsoft/wil.git#commit=${_wil_commit}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_commit}
        git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}
        git+https://github.com/bazelbuild/bazel-central-registry#commit=${_bcr_commit}
)

for _bazel_dep in "${_bazel_deps[@]}"; do
  source+=("$_bazel_dep")
  noextract+=("${_bazel_dep##*/}")
done

sha512sums=('dad55aac4edd699b792f488de682c4ffd54b03e3f41bddbdb98b3df1f60deaa38a74300419104075974d91f0207c0f329a9bd1f755f4d133012ed72e559dc023'
            'f69046af8c37a2a8a441a258d5b8677016966cb43d8a3bb48badc78123a885d6179ff77d7885fd6c84130136a1b8931a98d35f9fcce3d03ed31a37a72ece0b9d'
            '44db7d4a09aa7d36f1fb5a89be2234834a58834c76e445f8e9f7bc5685f6a76005b19fc758842c63641e476fa97c10eb968fa13965312fafca25843181fd025b'
            'c8ce90c2493c05a78221befc4cbbcfcbe7a0bafb7bfa55403b085bf8c3fd069c4690d1ff59ef9e0e8a813bd3673588eb38e02ad81c42a6dd0be5246f27442169'
            '91b878735e767ddf6f1fe3de61486c1e78936a0f683855e7c34a21c711f405899d3de369d2ff0a1910d65b1afc8c225d8d8b9398cf98d760f3afcfe42644fca2'
            '504066a457f77b510f492626c919b6fd7b61f77948bdddef0f7e43ae09bb4bf03cea7000fba91ae0123a94d3b39cac6dfac2010126849afe0a183727fe7b0fc1'
            'e0b5744660f195daae952bb505965d811517aaed9d0838fdbe19dd9b3beddb0c2c003689e46773005d66c7a72f482063853353ba061c76f2bd5bf61cfa4a63e4'
            '83a6fa68645d138af64ddddcfd15da567c4c46f92fb69be6c10bc5989c3aa6ab85776dfb3fcccdc9e7c32ca9f8260be121ceb7d329792d28ec9a66417a903a68'
            '2f11f0153c42485ee789412504d3616e38fc7a8518ac9aa401a4602edcc94d223970ee42abf4bae43751b314326e81464a6a26b2fbc69badc12d50bcc1a01006'
            'bd2cca8f007f2eee66f51c95a979371622b850ceb2ce3608d00ba826f7c494a1da0fba3c1427728f2c173fe50d59b701da35c2c9fdad2752a5a49746b1c8ef31'
            '0cd72b38335acf00f203446ee4618aad2d4bcb9df7059ea7196261a42b988b4d63a5ce6eac70fda49f0ecc3058e0f75ed277e3d40991d82b55c4556028ed95bc'
            '93281a271103dfc860e11bb1c8f72d3d3aeb129f3d4bfed8acc6b99fc1727f820fc0c7feaa336c03e5b935c5c39296c361cbc3abd58756a420d518dc1cb4808f'
            'cb786ab69e288d789ab056e41c663662d6f42c619f3464869f016b01eacd912f730d49fec986dfdd61c630167a697b52c74c4eebc70e69cce4369087aea62ef9'
            'a92e54fccebc6ac9715be6ffb09f0bb20d402de4837ad5002e9c292b54f8b84a573b049c0e8192f955bb51b19c9926a3affc880f3d4dce28f535f97241b0663f'
            'c1c55513ab74867484193a3cb2443a594601d93153a51adb29a68b7e0a2d3d3c5f2c777939ba65c73dab82c226f2b2de2bc3a3cf22d69816a5b5dcc24a3f317c'
            '11523401df02c6b863c625e24ae78b54348ec958c253bec412adc4873f654c830bb7049d500d94e6ce890695899598eb7f785653cbdf264903ba7dd40496a783'
            '9fd1d0a5df0d3978e4c3f313ce25100a6737a8cc946878b265396f81d752bdcb1c2f075bef91f989c5cd716f2d982f5a19047c9166a8597cb214a4e2678e80b9'
            'f45114b02d9892781797686be73bbeab988d122bf3bd12f3d854810c62716d3a59a7630b1ab02ecfe464fc80c6041f2caebb465f7eb88d13106645b3fe589fba'
            '0e2d538a4d4c200d40ad0041d7ccc3155670247144b2be322607c5db219262fd6f7de512b54df9ed3bae72213ca340b6919a0248a00260b451af93042ccd3216'
            '17801f13c8a019de7e85a81ccfe6147ee9b996bbb72bbf4753aadb62e13c7c05040012182f3e557395a36453d8c7e9ca504b624bd2e490447656d0196c0fc6bb'
            '5bbcba04093e91718f00ae48571005ace679a44a8996c5f975f6dd7e8431fd703999e10ce35d84b39a5a5e4fa92ce14d8ff8fc771001ff5c5575f4f6f5098625'
            '47a341531548e1bdc90e9e1e2bc9d7199d9edb6b20815591f8fbc3bc2efc769adc213f3b2550e9f628548fe35be5a854a9cdcc44cc79355e6cff3ae5369e3382'
            '7d5a6ae362ad92b1886c81ac4779c6d027435ae559e6cd0ea0c3b3aba60e614dc5a6428e720d667b1061ee94065d10e86dfaa0c17e2eb0a11bc535c3d450d69d'
            '444939266564bf418c2dd7fc3c15353818da85fc35e970257d6b79ea62cc1225f68979ef5e5aa7e88e84f4e07b269d1973f9f578edfcc10a50f35b545700cb53'
            'cb47d51511d4021eb025db6575c593f399b70f027c5bf92eec2d1202029abd701b3476672b02da7f3ff3e18ba6824b277753fcc88c50d9015f14d1a8485513eb'
            'ed7b041a0d1d95b8be7c1824c3dfd50867080b6284265192ddc5f829c9d6bb0d537db56271764da3ddb8bba65ccf410050dfea276f579c853788e29e56bddaec'
            '0249257a1c50e58cfddd76bfc89a437e02fdae367c3949a9fb678bb9314f149d0c7e3c257a8c0db33d68008315f8ccd0da2aba47f583e19c8ce6c403771ec14a'
            '580677aad97093829090d4b605ac81c50327e74a6c2de0b85dd2e8525553f3ddde17556ea46f8f007f89e435493c9a20bc997d1ef1c1c2c23274528e3c46b94f')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

pkgver(){
  cd mozc
  # change pkgver is OK because we fixed commit
  # parse major.minor.buildid from version template, revision is fixed to 102 for Linux
  _bzr_ver=$(sed 's/ //g;$ a echo $MAJOR.$MINOR.$BUILD_OSS.102' src/data/version/mozc_version_template.bzl | source /dev/stdin)
  printf "%s.g%s" "${_bzr_ver}" "${_mozc_commit}"
}

prepare() {
  SHA256_ZIP_CODE_KEN_ALL=$(sha256sum ken_all.zip | cut -d' ' -f1);
  SHA256_ZIP_CODE_JIGYOSYO=$(sha256sum jigyosyo.zip | cut -d' ' -f1);
  cd "$srcdir/mozc"
  git config --global protocol.file.allow always
  git submodule init
  git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.src/third_party/wil.url "$srcdir/wil"
  git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git submodule update

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
  bazel build --config oss_linux \
      --distdir="${srcdir}" \
      --registry="file://${srcdir}/bazel-central-registry" \
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
