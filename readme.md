#ssh
##ssh-keygenで共通鍵作成
    ssh-keygen -t rsa

##~/.ssh/config設定
```file
Host github
    HostName github.com
    IdentityFile ~/.ssh/macmini_kn
    User git
Host macbook
    HostName macbook.local
    IdentityFile ~/.ssh/macmini_kn
    User username1
```
###意味
ssh github = ssh git@github.com
ssh macbook = ssh username1@macbook.local
macmini_kn.pub を ~/Dropboxに放り込んで共有すると便利

#rsync
##コマンド例
```sh
rsync -Haxv knomoto@imac.local:hogehoge/ hogehoge/
#とか
rsync -Haxv hogehoge/ knomoto@macbook.local:hogehoge/
```
##option意味
>###-a, --archive
>This is equivalent to -rlptgoD. It is a quick way of saying you want recursion and want to preserve almost everything (with -H being a notable omission).  The only exception to the above equivalence is when --files-from is specified, in which case -r is not implied.
>Note that -a does not preserve hardlinks, because finding multiply-linked files is expensive.  You must separately specify -H.

>###-H, --hard-links
>This tells rsync to look for hard-linked files in the transfer and link together the corresponding files on the receiving side.  Without this option, hard-linked files in the transfer are treated as though they were separate files.
>Note that rsync can only detect hard links if both parts of the link are in the list of files being sent.

>###-x, --one-file-system
>This tells rsync to avoid crossing a filesystem boundary when recursing.  This does not limit the user's ability to specify items to copy from multiple filesystems, just rsync's recursion through the hierarchy of each directory that the user specified, and also the analogous recursion on the receiving side  dur-
>ing deletion.  Also keep in mind that rsync treats a "bind" mount to the same device as being on the same filesystem.
>If this option is repeated, rsync omits all mount-point directories from the copy.  Otherwise, it includes an empty directory at each mount-point it encounters (using the attributes of the mounted directory because those of the underlying mount-point directory are inaccessible).
>If rsync has been told to collapse symlinks (via --copy-links or --copy-unsafe-links), a symlink to a directory on another device is treated like a mount-point.  Symlinks to non-directories are unaffected by this option.

>###-v, --verbose
>This option increases the amount of information the daemon logs during its startup phase.  After the client connects, the daemon's verbosity level will be controlled by the options that the client used and the "max verbosity" setting in the module's config section.

#macport
##port オプション例
```sh
port search hogehoge|more
sudo port uninstall hogehoge
sudo port install hogehoge
sudo port clean hogehoge
#依存パッケージの表示
sudo port deps hogehoge
#インストール済パッケージファイル表示
sudo port contents hogehoge
#インストール時指定可能なオプション install時に+で指定可能
sudo port variants hogehoge
```

##portインストール後のバイナリファイルへの署名
`/opt/local/bin/portsign.sh`

port installにより取得した下記に署名を追加。
署名により他マシンでのバイナリパッケージの使用が可能になる。
/opt/local/var/macports/software/

##macbookにてimacからバイナリ取得rsync
```sh
sudo rsync -Haxv knomoto@imac.local:/opt/local/var/macports/software/ /opt/local/var/macports/software/
```
imacからmacbookへの転送はmacbook側rootがssh上で必要になるのでできない。
```sh
rsync -Haxv knomoto@imac.local:hogehoge/ hogehoge/
```

##env
.zshenvに下記パス設定
```sh
export PATH=~/bin:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
```

#tar
##内容物表示
```sh
tar -tzvf hogehoge.tar.gz
```
>###-v verbose 詳細表示
>###-f デフォルトのテープには入出力しない
>###-c
>Create a new archive containing the specified items.
>###-r
>Like -c, but new entries are appended to the archive.  Note that this only works on uncompressed archives stored in regular files.  The -f
>option is required.
>###-t
>List archive contents to stdout.
>###-u
>Like -r, but new entries are added only if they have a modification date newer than the corresponding entry in the archive.  Note that this
>only works on uncompressed archives stored in regular files.  The -f option is required.
>###-x
>Extract to disk from the archive.  If a file with the same name appears more than once in the archive, each copy will be extracted, with
>later copies overwriting (replacing) earlier copies.

##解凍
```sh
tar -zxcvf hogehoge.tar.gz
```

#ps
ps -ax|grep hogehoge

#launch
launchctl list
imac% sudo launchctl list|grep -e '^\d'|grep mysql
ロード済み野設定を表示 PID表示は起動済み
## register
$ sudo launchctl load -w /Library/LaunchDaemons/org.macports.mysql55-server.plist
## stop
$ sudo launchctl unload /Library/LaunchDaemons/org.macports.mysql55-server.plist
## start
$ sudo launchctl load /Library/LaunchDaemons/org.macports.mysql55-server.plist
Daemon と Agent の違い

##Daemon
OS 起動時に、PID 1 の launched によって起動されるプログラム。
##Agent
ユーザ権限で起動する launched によって起動されるプログラム。Agent は GUI インターフェースを持つことができるが、Daemon はそれができない。
launchd.plist ファイルを置くディレクトリ

通常は、/Library/LaunchDaemons に launchd.plist ファイルを置く。
~/Library/LaunchAgents
/Library/LaunchAgents
/Library/LaunchDaemons
/System/Library/LaunchAgents
/System/Library/LaunchDaemons

###launchd.plist の記述例

```xml:/System/Library/LaunchDaemons/com.apple.periodic-daily.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.apple.periodic-daily</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/sbin/periodic</string>
        <string>daily</string>
    </array>
    <key>LowPriorityIO</key>
    <true/>
    <key>Nice</key>
    <integer>1</integer>
    <key>StartCalendarInterval</key>
    <dict>
        <key>Hour</key>
        <integer>3</integer>
        <key>Minute</key>
        <integer>15</integer>
    </dict>
</dict>
</plist>
```
man に <key> の詳細が書かれている。man launchd.plist
テキストエディタで書いてもいいが、launchctl で load する時に propertyList is NULL とかのエラーが出るときがあるので、 Property List Editor.app で作るのが確実。
Label <string>
必須。ジョブラベル。launchd のジョブとして一意の名前が必要。
ProgramArguments <array of string>
必須。実行するプログラムと、オプション、引数など。
Disabled <boolean>
デフォルト: false
ジョブを使用するかしないか。デフォルトは false のため、Disabled キーが記述されていないジョブは使用することになる。
OnDemand <boolean>
デフォルト: true
要求があったときだけ起動するか、起動したまま常駐させるか。デフォルトは true なので、要求があったときだけ起動する。
false にすると常駐する。
launchd の GUI 管理アプリケーション

launchctl の使用例

OS ブート時に launchd が load しているジョブは、root 権限で操作する必要がある。
LaunchDaemon の起動方法
launchctl コマンドで launchd.plist ファイルをロードする。
load, unload するときは launchd.plist の指定をファイルパス（フルパス）で行う必要がある。
$ launchctl load /Library/LaunchDaemons/launchd.plist
Disabled キーが false、あるいは、Disabled キーの記述が無い場合は、そのジョブを使用することなので、load できる。
Disabled キーが true の場合、そのジョブを使用しないことなので、-F オプションを付けると強制的に load できる。
$ launchctl load -F launchd.plist
load 時に -w オプションを付けると、Disabled キーを削除して load する。つまり、Disabled キーに関係なく使用することになる。（OSブート時に自動起動するようになる。)
$ launchctl load -w launchd.plist
OnDemand true のジョブは load するのみ。
OnDemand true のジョブを使用するには
load した後、launchd.plist に記述してある Label キーの <string>（ジョブラベル）を指定して start する。
$ launchctl load /Library/LaunchDaemons/launchd.plist
$ launchctl start ジョブラベル
ジョブの再起動
$ launchctl stop ジョブラベル
ジョブラベルは、<launchd>.plist に記述してある Label キーの <string> のこと。
OnDemand false のジョブは常駐する設定なので、stop すると停止後すぐに起動する（つまり、再起動する）。
launchd.plist を修正した場合、stop で再起動しても launchd.plist の内容は反映されない。一度 unload して、再度 load する必要がある。
ジョブの停止
$ launchctl unload /Library/LaunchDaemons/launchd.plist
launchd.plist の修正内容を反映させる
launchd.plist を修正した場合、stop で再起動しても launchd.plist の内容は反映されない。一度 unload して、再度 load する必要がある。
$ launchctl unload ジョブラベル
$ launchctl load /Library/LaunchDaemons/launchd.plist
オプション例
launchctl load -w <launchd.plist path>   <key>Disabled</key> キーを削除し launchd.plist をロードする。 OSブート時に自動起動するようになる。
launchctl load -F <launchd.plist path>   <key>Disabled</key> キーがあっても強制的に launchd.plist をロードする。
launchctl unload <launchd.plist path>    launchd.plist をアンロードする。
launchctl unload -w <launchd.plist path>     launchd.plist に <key>Disabled</key><true/>を追記し、アンロードする。
OSブート時に自動起動しないようになる。
launchd にロードされている job の一覧
OS ブート時に launchd がロードしているジョブは、root 権限で操作する。
$ sudo launchctl list
com.apple.dashboard.advisory.fetch
com.apple.dnbobserverd
...

#mysql

##MySQLセットアップ
```mysql
#ユーザー権限の表示（grant権限があるか確認)
select host,user,grant_priv from mysql.user;

#lrngsqlユーザーの作成
grant all privileges on *.* to 'lrngsql'@'%' identified by 'password';

#すべてのrootアカウントにgrant_priv=Yを設定
update mysql.user set grant_priv='Y' where user='root';

show tables;
```

下記の設定をmy.cnfに設定（サーバークライアントどちらも）
```sh
[mysql]
default-character-set=utf8
[mysqld]
character-set-server=utf8
```

##その他
/opt/local/var/db/mysql55 内にdbの実態

#Python
##python install
```sh
sudo port install python27
which python
# /opt/local/bin/pythonを確認
# (実態は/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/python)
curl -O http://python-distribute.org/distribute_setup.py 
sudo python distribute_setup.py
# (easy_installが下に入ります
# /opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/)

which easy_install
# 通常/usr/bin/easy_installをさすので、
# /opt/local/Library/Frameworks 以下をさすようにシンボリックリンクを下記に作成
ln -s /opt/local/Library/Frame ~~ /opt/local/bin/easy_install-2.7

sudo easy_install-2.7 virtualenv
# easy_installと同様にシンボリックリンクを下記に作成
ln -s /opt/local/Library/Frame ~~ /opt/local/bin/virtualenv-2.7

#環境作成
virtualenv-2.7 --distribute --no-site-package env1
```

##まとめ
```sh
sudo port install python27
which python2.7
#/opt/local/bin/python2.7

curl -O http://python-distribute.org/distribute_setup.py
sudo python2.7 distribute_setup.py
cd /opt/local/bin
ln -s /opt/local/Library/Frame~~/opt/local/bin/easy_install-2.7/easy_install-2.7 easy_install-2.7
rehash

sudo easy_install-2.7 virtualenv
ln -s /opt/local/Library/Frame ~~ /opt/local/bin/virtualenv-2.7 virtualenv-2.7

virtualenv-2.7 --distribute --no-site-package env1
cd env1
source bin/activate
#で環境切り替え
```

##macportでのversion切り替え
```sh
sudo port select --list python
sudo port select --show python
sudo port select --set python python27
```

##課題
```python
import pwd
pwd.getpwnam('nobody')[2]
```
取得するUID,GIDがmacportインストールpythonでは-2とならない。


#grep
##ディレクトリ内を再起的にgrepする
```sh
grep 'python' `find . -type f`
```

#vim
vimの$PATHはSHELL の$PATHとは別物だけど、起動時にSHELLの$PATHからコピーされる。
vimの$PATHはSHELL の$PATHとはべつものとおもいきや、
$PATHへの変更は反映される。 

#CentOS6.4
##sshd pubkey の登録
dropboxのmacbook_kn.pubを下記にてCentOSのユーザーに登録

$cat macbook_kn.pub >> authorized_keys

キーの作成
$ssh-keygen -t rsa

#Vagrant
ディレクトリ構成三つ
1.vagrand用boxesファイル等格納される
#.vagrant.d
##boxes
2.viurtualbox用ファイルディスクイメージなど
#Viurtual VM
##vmdk
3.vagrant用設定ファイル（仮想端末毎に）
vagrantコマンドは個々で有効
#vm1
##Vagrantfile
