# Maintainer: Sahan Rasanjana <sahan.user@gmail.com>

pkgname=aster-browser-settings
pkgver=20230204
pkgrel=1
pkgdesc="Aster Linux settings browser defaults"
arch=('any')
url="https://gitlab.aster.org/profiles-and-settings/aster-browser-settings"
license=('GPL')
makedepends=('git')
conflicts=('aster-firefox-settings')
replaces=('aster-firefox-settings')
_commit=9d8e020eccd3b6f9670cd02ee8b16f442a5c719c
source=("settings.tar.gz")
sha256sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
 # cd "$srcdir/$pkgname"
  cd "settings"
  # Discover is dead
  for i in palemoon/distribution.ini firefox/distribution.ini falkon/aster/bookmarks.json chrome/bookmarks.html; do
    sed -i 's/discover/software/g' ${i}
  done
}

package() {
#  cd "$srcdir/$pkgname"
  cd "settings"
  install -d "$pkgdir"/usr/lib/{chrome,chromium,brave,{firefox,firefox-developer-edition,palemoon,thunderbird}/distribution}
  for i in chrome chromium brave; do
    cp -r chrome/* "$pkgdir/usr/lib/${i}/"
  done

  cp -r palemoon/* "$pkgdir/usr/lib/palemoon/distribution/"
  install -d "$pkgdir/etc/skel/.config/falkon/profiles"
  cp -r falkon/* "$pkgdir/etc/skel/.config/falkon/profiles/"
  install -Dm644 firefox/distribution.ini "$pkgdir/etc/aster-firefox.ini"
  install -Dm644 thunderbird/distribution.ini "$pkgdir/etc/aster-thunderbird.ini"
  install -Dm644 firefox/distribution.ini "$pkgdir/etc/aster-firefox-developer-edition.ini"
  sed -i 's/Firefox/Firefox Developer Edition/;s/firefox/firefox-developer-edition/' "$pkgdir/etc/aster-firefox-developer-edition.ini"
  install -Dm644 firefox/distribution.ini "$pkgdir/etc/aster-firefox-kde.ini"
  sed -i 's/Firefox/Firefox KDE Edition/' "$pkgdir/etc/aster-firefox-kde.ini"
  install -Dm644 firefox/all-companyname.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/all-companyname.js"
  install -Dm644 firefox/all-companyname.js "$pkgdir/usr/lib/firefox-developer-edition/browser/defaults/preferences/all-companyname.js"


  # Hooks
  install -Dm644 firefox-pre.hook "$pkgdir/usr/share/libalpm/hooks/firefox-pre.hook"
  install -Dm644 firefox-post.hook "$pkgdir/usr/share/libalpm/hooks/firefox-post.hook"
  install -Dm644 firefox-pre.hook "$pkgdir/usr/share/libalpm/hooks/firefox-dev-pre.hook"
  sed -i 's/firefox/firefox-developer-edition/g' "$pkgdir/usr/share/libalpm/hooks/firefox-dev-pre.hook"
  install -Dm644 firefox-post.hook "$pkgdir/usr/share/libalpm/hooks/firefox-dev-post.hook"
  sed -i 's/firefox/firefox-developer-edition/g' "$pkgdir/usr/share/libalpm/hooks/firefox-dev-post.hook"
  install -Dm644 firefox-kde-pre.hook "$pkgdir/usr/share/libalpm/hooks/firefox-kde-pre.hook"
  install -Dm644 firefox-kde-post.hook "$pkgdir/usr/share/libalpm/hooks/firefox-kde-post.hook"
  install -Dm644 thunderbird-pre.hook "$pkgdir/usr/share/libalpm/hooks/thunderbird-pre.hook"
  install -Dm644 thunderbird-post.hook "$pkgdir/usr/share/libalpm/hooks/thunderbird-post.hook"
}
