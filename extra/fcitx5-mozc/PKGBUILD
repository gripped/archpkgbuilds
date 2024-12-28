# Maintainer: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Weng Xuetian <wengxt@gmail.com>

## Mozc compile option
_mozc_commit=0cbb8f1

## follow the submodule commits in https://github.com/fcitx/mozc/tree/fcitx/src/third_party
_abseil_cpp_commit=4447c75
_breakpad_commit=216cea7
_gtest_commit=b514bdc
_gyp_commit=9ecf45e
_japanese_usage_dictionary_commit=e5b3425
_protobuf_commit=7cc670c
_wil_commit=fc5dbf5

_bcr_commit=a81b754
# Following are subject to change if bcr, bazel, and mozc commit changes.
# The build process does not necessary use all of them, but it is required to allow a no download build process.
# https://github.com/fcitx/flatpak-fcitx5/blob/master/mozc-deps.yaml has a constantly maintain list of these files
#
# Also jigyosyo.zip and ken_all.zip may be updated without notice.
_bazel_deps=(
    https://github.com/bazel-contrib/bazel_features/releases/download/v1.11.0/bazel_features-v1.11.0.tar.gz
    https://github.com/bazelbuild/apple_support/releases/download/1.16.0/apple_support.1.16.0.tar.gz
    https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz
    https://github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz
    https://github.com/bazelbuild/rules_android_ndk/releases/download/v0.1.2/rules_android_ndk-v0.1.2.tar.gz
    https://github.com/bazelbuild/rules_apple/releases/download/3.5.1/rules_apple.3.5.1.tar.gz
    https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz
    https://github.com/bazelbuild/rules_java/releases/download/7.9.0/rules_java-7.9.0.tar.gz
    https://github.com/bazelbuild/rules_license/releases/download/0.0.7/rules_license-0.0.7.tar.gz
    https://github.com/bazelbuild/rules_pkg/releases/download/0.7.0/rules_pkg-0.7.0.tar.gz
    https://github.com/bazelbuild/rules_proto/releases/download/6.0.0-rc1/rules_proto-6.0.0-rc1.tar.gz
    https://github.com/bazelbuild/rules_python/releases/download/0.34.0/rules_python-0.34.0.tar.gz
    https://github.com/bazelbuild/rules_swift/releases/download/1.18.0/rules_swift.1.18.0.tar.gz
    https://github.com/indygreg/python-build-standalone/releases/download/20240415/cpython-3.11.9+20240415-x86_64-unknown-linux-gnu-install_only.tar.gz
    https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz
    https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip
    https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
)

_pkgbase=mozc
pkgname=fcitx5-mozc
pkgdesc="Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
pkgver=2.30.5618.102.g0cbb8f1
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

sha512sums=('20335ac48f9719143e9c647613a3a8da4e5110bf367d9333f9389f1a456c7340e179a790eec2dadc63f7b428fdd7d52778bd522b809ddd77da49b4d8c0360b55'
            'f69046af8c37a2a8a441a258d5b8677016966cb43d8a3bb48badc78123a885d6179ff77d7885fd6c84130136a1b8931a98d35f9fcce3d03ed31a37a72ece0b9d'
            '44db7d4a09aa7d36f1fb5a89be2234834a58834c76e445f8e9f7bc5685f6a76005b19fc758842c63641e476fa97c10eb968fa13965312fafca25843181fd025b'
            'c8ce90c2493c05a78221befc4cbbcfcbe7a0bafb7bfa55403b085bf8c3fd069c4690d1ff59ef9e0e8a813bd3673588eb38e02ad81c42a6dd0be5246f27442169'
            '91b878735e767ddf6f1fe3de61486c1e78936a0f683855e7c34a21c711f405899d3de369d2ff0a1910d65b1afc8c225d8d8b9398cf98d760f3afcfe42644fca2'
            '504066a457f77b510f492626c919b6fd7b61f77948bdddef0f7e43ae09bb4bf03cea7000fba91ae0123a94d3b39cac6dfac2010126849afe0a183727fe7b0fc1'
            'b9fade4c8cfe60915c51433c1acd4b253b947dd2fabe7b70dd53c92cd751322fb007ef68e04d5551315f3bc2f52048fb8b9babf40455309ab7b38d9f3efd348a'
            '83a6fa68645d138af64ddddcfd15da567c4c46f92fb69be6c10bc5989c3aa6ab85776dfb3fcccdc9e7c32ca9f8260be121ceb7d329792d28ec9a66417a903a68'
            '3c244bb1b6cd4ae602115f3981a41717201803ac7e1f8b029b67720f31f0b17255789188e428d02f113b20326a5035ebf361c3b0ed350bc9aff18248801a2ae8'
            '9ca6af9d6f9045cfaa6d2d665ff4016dc3ef199c614e0cf2ef0d39bd093870a87cd0fa78e6cbafae1325ba1219124987ee02ec4012f4fcc95b7ee82bef276ada'
            '93281a271103dfc860e11bb1c8f72d3d3aeb129f3d4bfed8acc6b99fc1727f820fc0c7feaa336c03e5b935c5c39296c361cbc3abd58756a420d518dc1cb4808f'
            'cb786ab69e288d789ab056e41c663662d6f42c619f3464869f016b01eacd912f730d49fec986dfdd61c630167a697b52c74c4eebc70e69cce4369087aea62ef9'
            'a92e54fccebc6ac9715be6ffb09f0bb20d402de4837ad5002e9c292b54f8b84a573b049c0e8192f955bb51b19c9926a3affc880f3d4dce28f535f97241b0663f'
            'c1c55513ab74867484193a3cb2443a594601d93153a51adb29a68b7e0a2d3d3c5f2c777939ba65c73dab82c226f2b2de2bc3a3cf22d69816a5b5dcc24a3f317c'
            '46e83c2e163e9e904d6325b03c2ce2ae9dc44a8cec8736ff23bc0d201b36defbc050f95f0965d2fc45d4f529438b18422251ac0592eedbdf9ebc51588cc926d3'
            '8ac262bbb2c1b85f6357a099d4cf8cf6d965c237d56c22f64b279938d495a4b650949c1364da3256ad4d76b016b53b46242a9b3ac75af2008f185d53e8fe8749'
            '892ddb2073a9885dea9645b8d1ab01e3a1bbd16205c298c79f27b1b3b284c25e3b464b30848929e5dd52447066067b8b58d870d5fa1ae2cc00326a10b8efa13d'
            'dc02790fa5e56a4dfdf8fa8b2fd759ea5b679f58afdafca623294d62a8c7ecbc50f5ee2c35b14035f519701e86947473590463a70359e7528f7b323d28ac24db'
            '2fba108997065d753e17f1e7de1db08461416d03f8832d38e25f5151bfd0ad896565db9eb56b3702b604296a19620f9b60e5c15440855d36e64865010e6f4cdc'
            '7687fd21fe245597c4ce9ef15ae47563b2e1c9bd17908eb28e4c9373b51f8999f0d9ac99f5dbde08c4494c879ad15f2ccfd6c3dcf07daef722f11e79ee142279'
            '633635d038fc1cb0e843e5c0d25851a54b7d418a308331d66127b42ec70114d6e29ca4d2b3d0acb34ef441314c5284f90a8a27bf7241f1d5b6c7f11ddbf7c4de'
            '097c87522f8602b2327a7fbc699c52f20d58048ce2d4b0ea94c7b7d81a81d51ecb3bdfbcd7b07219af942ddf94be3b0fdf03f9d1c72a07943807bbe4ba72a16e'
            '236ed786c374cec14df637327d8880d5397ded6428f47ac08e3be91cb48d88af2593d9035bac5b2bb8e6fee6b15422575ce0dd98c6d57780a265c84f591ccc0a'
            '580677aad97093829090d4b605ac81c50327e74a6c2de0b85dd2e8525553f3ddde17556ea46f8f007f89e435493c9a20bc997d1ef1c1c2c23274528e3c46b94f'
            'cb47d51511d4021eb025db6575c593f399b70f027c5bf92eec2d1202029abd701b3476672b02da7f3ff3e18ba6824b277753fcc88c50d9015f14d1a8485513eb'
            'ed7b041a0d1d95b8be7c1824c3dfd50867080b6284265192ddc5f829c9d6bb0d537db56271764da3ddb8bba65ccf410050dfea276f579c853788e29e56bddaec')
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
