# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=containers-common
pkgver=0.57.2
pkgrel=1
epoch=1
_image_pkgver=5.29.1
_podman_pkgver=4.8.3
_shortnames_pkgver=2023.02.20
_skopeo_pkgver=1.14.0
_storage_pkgver=1.51.0
pkgdesc="Configuration files and manpages for containers"
arch=(any)
url="https://github.com/containers"
license=(Apache-2.0)
depends=('container-network-stack>1')
makedepends=(go-md2man)
checkdepends=(ripgrep)
backup=(
  etc/containers/containers.conf
  etc/containers/mounts.conf
  etc/containers/policy.json
  etc/containers/registries.conf
  etc/containers/seccomp.json
  etc/containers/storage.conf
)
# configuration override directories need to exist
options=(emptydirs)
source=(
  common-$pkgver.tar.gz::https://github.com/containers/common/archive/v$pkgver.tar.gz
  image-$_image_pkgver.tar.gz::https://github.com/containers/image/archive/v$_image_pkgver.tar.gz
  podman-$_podman_pkgver.tar.gz::https://github.com/containers/podman/archive/v$_podman_pkgver.tar.gz
  skopeo-$_skopeo_pkgver.tar.gz::https://github.com/containers/skopeo/archive/v$_skopeo_pkgver.tar.gz
  storage-$_storage_pkgver.tar.gz::https://github.com/containers/storage/archive/v$_storage_pkgver.tar.gz
  shortnames-$_shortnames_pkgver.tar.gz::https://github.com/containers/shortnames/archive/refs/tags/v$_shortnames_pkgver.tar.gz
  mounts.conf
  $pkgname-0.48.0-init_path.patch
)
sha512sums=('57ce94194bbe3b4ff616b9d42e9f4ab9ae7a09c79dd295ad2b79e7ad3b49c30795ad0e65ba1019d6bc54e6054ed6402cfe79676cd44ed5a7e6b3930cfda66f61'
            '0e83161f23666f5597459e992c966b9f319cf94393109d80d5948f1259724ac7df5f8c8baa2bde0677eb90a8bd58f7c3664c9d053cf0a51311478dd6909db8f7'
            '13ade866b888d32ada3b38130d7cc4677591136e25234e040b478c5d002d1b7907ed46731996d25cc41b992b98b75f109c6e6eea44251f4ad89162b20266976d'
            '59d329036a97cbeca4de20b15d9dd8adacd5201834b26ae5e5c88b05594b2a7101c22da91f22c35c07a98e41afa28f2c7103e660b3847c7f8c9691f27f4c4146'
            '89916b49438bce8bb774b4aa799676d4b3a946a0b5207a1b5241b1a3ac0875b06b3cd8e81d7e23332ceae6010b693516fc31d8c7f75a37e7ad3056a83c75b6c1'
            '856dbbeb2acda276e9605bd1ecec0f8d65952c597ee2af61dd8909d7d3c04e5ef06c40b69ec4a98f79e623c536850f614c1b0af3a19637e300e7d3a285933193'
            '11fa515bbb0686d2b49c4fd2ab35348cb19f9c6780d6eb951a33b07ed7b7c72a676627f36e8c74e1a2d15e306d4537178f0e127fd3490f6131d078e56b46d5e1'
            '4a6526d01f192f0eb4dcbd28c019a2b0db6dc2128af644e8e89992e5dcfa45a02c739b06ee01e22606b5cb847213c002f8ab5f87a576846ac73f73eed9b2b469')
b2sums=('7ffaf99048ac94ecad789a333800ad99b529a7fbaef932f519e6395e6e4aa2f926c68e3332eb2a7a8884aa2d69803c7cda1e7af91184ec64336a0a319d450078'
        '0e56c56c0bbf17c5fa6b83ad428a7811bee4a985747e4cb91169bc15026aa8eab6032b3aee46ad0e63225ec799fcf92db86a00993c4fbe01485f636117153137'
        '13d2e5800dce96ba8c1671f251c2809dc0166198b807978d44b6f10b4dd2095e909678a12518fed84a0a1b5eee5a71e944170eb55350c3af945a63910f9c8082'
        '6ecf54d236405ce59bedf77acc124fa8b3bb12acefa24a679a1d2d85957ddf585b5a6ba163806b8b7b510485d936adbe1afd6eee8c92b267b948f7d78ac83d05'
        '108401d68e617e6237e68cf2147113680e0452a8d15ee099da9872508800f3e7b8f2c5508e17d9c5f3d58fec4efc1c20f23f1a567fe592533c0e63efd05ae5c8'
        '165a4c51bd284078990c94059145bb6b4bd5de4d8595eb2ccd2acc6fe8561e7edc300b7edadc684675ee281d7ada1c3a6d5aa0117c640ec22c2d2ef7e46486b5'
        '2f4b0af3271103362a898e7fcc3ec05f06755902ad664ac3107bb8debb8b2ac0d50de311d5fc651279a817a56e3ff05864a7e77c0d8fc628ff7411bfb98c9b69'
        '89e95f468785f6ca1309b0de37921702bd4eb6fb191afc0d93454bec7b7096a1b84e19408b5a0abcdfd89ce2ebd228879cbc42a0d409425fb41caab6a8f049f5')

prepare() {
  sed -r 's/(GOMD2MAN = ).*/\1 go-md2man/' -i storage-$_storage_pkgver/docs/Makefile
  patch -Np1 -d common-$pkgver -i ../$pkgname-0.48.0-init_path.patch
  mkdir -vp build/{man1,man5}
}

build() {

  (
    printf "Creating common man pages...\n"
    cd common-$pkgver
    for _man_page in docs/*.md pkg/hooks/docs/*.md; do
      go-md2man -in $_man_page -out ../build/man5/$(basename ${_man_page//.md})
    done
  )

  (
    printf "Creating image man pages...\n"
    cd image-$_image_pkgver
    mkdir -vp man5
    mv -v docs/*.5.md man5/
    for _man_page in docs/*.md; do
      go-md2man -in $_man_page -out ../build/man1/$(basename ${_man_page//.md}).1
    done
    for _man_page in man5/*.md; do
      go-md2man -in $_man_page -out ../build/man5/$(basename ${_man_page//.md})
    done
  )

  (
    printf "Creating storage documentation...\n"
    cd storage-$_storage_pkgver
    make -C docs
  )
}

check() {
  local _podman_common_ver
  _podman_common_ver="$(rg "github.com/containers/common" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"
  _podman_image_ver="$(rg "github.com/containers/image" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"
  _podman_storage_ver="$(rg "github.com/containers/storage" podman-$_podman_pkgver/go.mod | cut -d ' ' -f2 | sed 's/v//')"

  printf "Common version in podman: %s\n" $_podman_common_ver
  printf "Image version in podman: %s\n" $_podman_image_ver
  printf "Storage version in podman: %s\n" $_podman_storage_ver

  # NOTE: we are comparing the major.minor version of containers/common required by podman with the one of containers/common that we are trying to build
  # https://github.com/containers/common/issues/923
  if (( $(vercmp "${_podman_common_ver%.*}" "${pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/common in version %s but we are trying to build version %s\n" $_podman_pkgver ${_podman_common_ver%.*} ${pkgver%.*}
    exit 1
  fi
  if (( $(vercmp "${_podman_image_ver%.*}" "${_image_pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/image in version %s but we are trying to use version %s\n" $_podman_pkgver ${_podman_image_ver%.*} ${_image_pkgver%.*}
    exit 1
  fi
  if (( $(vercmp "${_podman_storage_ver%.*}" "${_storage_pkgver%.*}") != 0 )); then
    printf "The podman package in version %s requires containers/storage in version %s but we are trying to use version %s\n" $_podman_pkgver ${_podman_storage_ver%.*} ${_storage_pkgver%.*}
    exit 1
  fi
}

package() {
  # directories
  install -vdm 755 "$pkgdir/etc/containers/containers.conf.d/"
  install -vdm 755 "$pkgdir/etc/containers/oci/hooks.d/"
  install -vdm 755 "$pkgdir/etc/containers/registries.conf.d/"
  install -vdm 755 "$pkgdir/usr/share/containers/oci/hooks.d/"
  install -vdm 755 "$pkgdir/var/lib/containers/"

  # configs
  install -vDm 644 mounts.conf -t "$pkgdir/etc/containers/"

  (
    cd common-$pkgver
    # configs
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/config/containers.conf -t "$pkgdir/usr/share/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/etc/containers/"
    install -vDm 644 pkg/seccomp/seccomp.json -t "$pkgdir/usr/share/containers/"
  )
  (
    cd image-$_image_pkgver
    # configs
    install -vDm 644 registries.conf -t "$pkgdir/etc/containers/"
  )
  (
    cd shortnames-$_shortnames_pkgver
    install -vDm 644 shortnames.conf "$pkgdir/etc/containers/registries.conf.d/00-shortnames.conf"
  )
  (
    cd skopeo-$_skopeo_pkgver
    # configs
    install -vDm 644 default-policy.json "$pkgdir/etc/containers/policy.json"
    install -vDm 644 default.yaml -t "$pkgdir/etc/containers/registries.d/"
  )
  (
    cd storage-$_storage_pkgver
    # configs
    install -vDm 644 storage.conf -t "$pkgdir/etc/containers/"
    install -vDm 644 storage.conf -t "$pkgdir/usr/share/containers/"
    # man pages
    install -vDm 644 docs/*.1 -t "$pkgdir/usr/share/man/man1/"
    install -vDm 644 docs/*.5 -t "$pkgdir/usr/share/man/man5/"
  )
  # man pages
  install -vDm 644 build/man1/*.1 "$pkgdir/usr/share/man/man1/"
  install -vDm 644 build/man5/*.5 "$pkgdir/usr/share/man/man5/"
}
