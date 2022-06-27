# Artree NFT API Specification

[ドキュメントページへ](https://artreetechnologies.github.io/artree-api-spec)

## Curlでのテスト

### 前提条件

API KeyとAPI Secretを取得します。
API KeyとAPI Secretを用いて認証に使われるパラメータを取得します。
以下のページに`{API Key}:{API Secret}`と入力し、**ENCODE**ボタンを押すと文字列が取得できます。
https://www.base64encode.net/

例、API Keyが`VV9neHHL0R7ulLfCpSv0`、API Secretが`ZHgk5Z1aiPOOSt1xtdIFWPVzhzTM9DLQvFcVzmR`の場合。

- Input
```
VV9neHHL0R7ulLfCpSv0:ZHgk5Z1aiPOOSt1xtdIFWPVzhzTM9DLQvFcVzmR
```

- Output
```
VlY5bmVISEwwUjd1bExmQ3BTdjA6WkhnazVaMWFpUE9PU3QxeHRkSUZXUFZ6aHpUTTlETFF2RmNWem1S
```

このアウトプットの値を`Authorization: Basic {Output}`となるように入力してください。
上の場合は`Authorization: Basic VlY5bmVISEwwUjd1bExmQ3BTdjA6WkhnazVaMWFpUE9PU3QxeHRkSUZXUFZ6aHpUTTlETFF2RmNWem1S`となります。

### コントラクトのデプロイのリクエスト

コマンドを使用して、コントラクトをデプロイをリクエストします。

```shell
$ curl -X POST -H "Content-Type: application/json" -d '{"symbol":"ETH", "name":"Ethereum", "chain":"AST", "baseUrl":"https://example.com/images/","type":"NORMAL"}' -H "Authorization: Basic {Output}" https://staging.api.artree.jp/contract/deploy
```

- 例

```shell
$ curl -X POST -H "Content-Type: application/json" -d '{"symbol":"ETH", "name":"Ethereum", "chain":"AST", "baseUrl":"https://example.com/images/","type":"NORMAL"}' -H "Authorization: Basic VlY5bmVISEwwUjd1bExmQ3BTdjA6WkhnazVaMWFpUE9PU3QxeHRkSUZXUFZ6aHpUTTlETFF2RmNWem1S" https://staging.api.artree.jp/contract/deploy
```

処理が成功すると以下のようなメッセージが現れます。
```shell
{"statusCode":201,"msg":"処理が正常に終了しました","data":{"deploy_id":"1ba185c8-7e5c-4b17-98b9-74a1e6c61ccf"}}
```

### コントラクトのデプロイのステータス確認

コマンドを使用して、コントラクトのデプロイリクエストのステータス確認をします。
上記の成功メッセージで取得した`data`内の`deploy_id`を使います。

```shell
curl https://staging.api.artree.jp/contract/deploy/status/{deploy_id}
```

- 例

```shell
curl https://staging.api.artree.jp/contract/deploy/status/1ba185c8-7e5c-4b17-98b9-74a1e6c61ccf
```

処理が成功すると以下のようなメッセージが表示されます。
```shell
{"statusCode":200,"data":{"status":"DEPLOYED","contract":{"address":"0x7f70bBd75852BadaE12E8CfeE1F9e6B97aA1621E","tx_hash":"0xd014cede5dee626a2f979dec372b3aa8d726f59a3e19ebf8a72656c9e967adbf"}}}
```
ステータスは全部で`PENDING`, `DEPLOYED`, `FAILED`があります。
`PENDING`は処理を行なっている状態で完了すると`DEPLOYED`になります。
`PENDING`から`DEPLOYED`に変わるまでに3~10分ほどかかります。
`DEPLOYED`になりましたら、次へお進みください。

### NFTの発行のリクエスト

コマンドを使用して、NFTの発行リクエストを送信します。
Owner AddressにNFTの所有者に指定するアドレスを入力します。

```shell
curl -X POST -H "Content-Type: application/json" -d '{"owner":"{Owner Address}","chain":"AST","args":["image.png"]}' -H "Authorization: Basic {Output}" https://staging.api.artree.jp/nft/issue
```

- 例

```shell
curl -X POST -H "Content-Type: application/json" -d '{"owner":"0x6fA7BAB5fB3A644af160302de3Badc0958601b44","chain":"AST","args":["image.png"]}' -H "Authorization: Basic VlY5bmVISEwwUjd1bExmQ3BTdjA6WkhnazVaMWFpUE9PU3QxeHRkSUZXUFZ6aHpUTTlETFF2RmNWem1S" https://staging.api.artree.jp/nft/issue
```

処理が成功すると以下のようなメッセージが表示されます。
```shell
{"statusCode":201,"msg":"処理が正常に終了しました","data":{"issue_id":"f4bad224-018c-4894-ae76-1a486f7b5022"}}
```

### NFTの発行のステータス確認

コマンドを使用して、コントラクトのデプロイリクエストのステータス確認をします。
上記の成功メッセージで取得した`data`内の`issue_id`を使います。

```shell
curl https://staging.api.artree.jp/nft/issue/status/{issue_id} -H "Authorization: Basic {Output}"
```

- 例
```shell
{"statusCode":200,"data":{"status":"ISSUED","nft":{"id":"eb321d35-0103-4439-a23a-ce91bb507761","tx_hash":"0xd46df12803e416877e11ede379c1368e105b25c3e545086cfb6363f2db46f34d"}}}
```
ステータスは全部で`PENDING`, `ISSUED`, `FAILED`があります。
`PENDING`は処理を行なっている状態で完了すると`ISSUED`になります。
`PENDING`から`ISSUED`に変わるまでに3~10分ほどかかります。

### トランザクションの確認

送信したトランザクションは全てAstarのテストネットのShibuyaネットワークに送信されています。
反映までに時間がかかりますが、ステータス確認の際の`data`内の`tx_hash`を入力するとトランザクションを確認することができます。
以下のURLからアクセスしてください。

https://shibuya.subscan.io/

反映までに時間がかかるためコントラクトデプロイの`tx_hash`を入力すると表示される可能性が高いです。
