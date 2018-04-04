# macのセットアップ

### ダウンロード

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/koharashota/mac-setup/master/download.sh)"
```

## 諸々インストール

### セットアップ

```shell
~/mac-setup/setup.sh
```

### アプリインストール

```shell
~/mac-setup/app.sh
~/mac-setup/appstore.sh
```

### 設定・アプリアップデート

```shell
~/mac-setup/update.sh
```

# その他にやること

## macOS

### Control + Space をアプリに開け渡す

だいたい入力ソースの切り替えか Spotlight 関連に `⌃Space` が割り当たってると思うので、
キーボードのショートカット設定から変更する。

入力ソースの切り替えは `⌘Space` に、 Spotlight は `^Space` にしておく。

### capslock を ^ に変更

「キーボード > 修飾キーを変更する」で変更する

### キーのリピート速度を速くする

「キーのリピート」を最速に、「リピート入力認識までの時間」を最短にする。

### GitHub 用に credential helper を設定する

[公式ドキュメン](https://help.github.com/articles/caching-your-github-password-in-git/)を参考に設定する。

`~/.gitconfig.local` に以下のように設定する

```gitconfig
[credential]
    helper = osxkeychain
```

## Ubuntu

### GitHub 用に credential helper を設定する

[こちらのサイト](https://stackoverflow.com/a/40312117) を参考に設定する。

``` sh
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

sudo apt-get install libsecret-1-0 libsecret-1-dev gnome-keyring
sudo make --directory  /usr/share/doc/git/contrib/credential/libsecret
```

``` gitconfig
[credential]
    helper = /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
```

## 共通

### Git のユーザー名、メールアドレスを設定する

`~/.gitconfig.local` に以下のように設定する:

```gitconfig
[user]
    name = koharashota
    email = transparent.blue69@gmail.com
```

### ssh config の作成

`mkdir -p ~/.ssh && chmod 0700 ~/.ssh && touch ~/.ssh/config && chmod 0600 ~/.ssh/config` する
中身は以下を書いておく

```ssh-config
Host *
   IdentitiesOnly yes
   ServerAliveInterval 120
   ServerAliveCountMax 10
   ForwardAgent yes
   IdentityFile ~/.ssh/id_rsa
   TCPKeepAlive yes
   UseKeychain yes
   AddKeysToAgent yes
```

