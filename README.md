# 開発演習用サンプルアプリケーション

## 前提
* CentOS7
* 手順はrootで実行する

## デプロイ方法

```
# cd /var/www
# git clone git@github.com:takahiro-kida/django_sample.git
# cd django_sample
```

DB情報を記載する
```
# vim systemd/env
```

```
# default データベース名
DATABASES_DEFAULT_NAME=''

# default データベースホスト
DATABASES_DEFAULT_HOST=''

# default データベースポート
DATABASES_DEFAULT_PORT=''

# default データベース管理者ユーザ
DATABASES_DEFAULT_USER=''

# default データベース管理者ユーザパスワード
DATABASES_DEFAULT_PASSWORD=''
```

デプロイ
```
# sh scripts/deploy.sh
```
