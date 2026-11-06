# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=unicode-emoji
pkgver=18.0.0
pkgrel=1
pkgdesc="Unicode Emoji Data Files"
arch=(any)
license=(Unicode-3.0)
url="https://www.unicode.org/emoji/"
depends=('unicode-character-database')
source=("emoji-sequences-$pkgver.txt::http://www.unicode.org/Public/$pkgver/emoji/emoji-sequences.txt"
        "emoji-test-$pkgver.txt::http://www.unicode.org/Public/$pkgver/emoji/emoji-test.txt"
        "emoji-zwj-sequences-$pkgver.txt::http://www.unicode.org/Public/$pkgver/emoji/emoji-zwj-sequences.txt"
        license-from-upstream)
sha512sums=('d9a37198a58093dac60a7de7329706faa49f063349e9849b2d86d3902beee4ae7c8d65f7fcb66f6fd2a265a79e63b5a6953a53387285bf019bbff853955020f2'
            'c4d1a38ddcfe9ed6036865a0494ca9a49fa06ffdf66029b8af6300862137c47c0d96ab8dcfe73b55c670af5de55726a9269682b529ca9b9804b3bb1ed8e30b40'
            '31981420a37d05c859310b2e0666fc60e50fee2161f434d32dfaad0b91ca05b4a607a2a0ef567eed82afa43d2ecd055d287c09a21f05fa5a1ceb31ca56e2b423'
            'cb717eb5bf8206b004d2784eb02909365cb4dbe5845198e298ae94f1c666fc5855e4194ca1f3aba4348de6146054c69ea23fd5c8706838bb345bba4deff6549c')

package() {
  for _f in sequences test zwj-sequences; do
    install -Dm644 emoji-$_f-$pkgver.txt "$pkgdir/usr/share/unicode/emoji/emoji-$_f.txt"
  done

  install -Dm644 license-from-upstream "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
