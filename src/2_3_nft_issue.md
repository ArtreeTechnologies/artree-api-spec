# NFTの発行

デプロイしたコントラクトに対してリクエストを送りNFTを発行します。
コントラクトの所有者と必要な情報を入力します。

```ts
import axios from 'axios';

const url = 'https://api.artree.jp/nft/issue'
const nftUrl = 'image.png'

const request = {
    owner: "0x6fA7BAB5fB3A644af160302de3Badc0958601b44",
    chain: "AST",
    args: [
        nftUrl
    ]
}

const headers = {
    Authorization: `Basic ${base64.encode(apiKey + ':' + apiSecret)}`
}

// NFTの発行をリクエスト
const res = axios.post(url, request, {headers})
```

## リクエストパラメータ

| 変数 | 項目 | 説明 | 必須 |
| ---- | ---- | ---- | ---- |
| url | - | リクエストを送るurlです。ドメインは`api.artree.jp`でリクエストごとに以降のパスが変化します。 | ✔️ |
| nftUrl | - | NFTの画像のファイル名です。コントラクトデプロイの際の`baseUrl` + `nftUrl`で画像が表示されるように設定してください。 | ✔️ |
| request | owner | NFTの所有者を入力します。入力がない場合は管理者に紐づきます。 | - |
| | chain | NFTを発行するブロックチェーンを入力します。 | ✔️ |
| | args | NFTを発行する際のメタデータです。デプロイしたコントラクトによって異なります。 | ✔️ |
| headers | apiKey | 認証用のAPI Keyです。 | ✔️ |
| | apiSecret | 認証用のAPI Secretです。機密情報として管理してください。 | ✔️ |

## レスポンスパラメータ

| 項目 | 説明 | 型 |
| ---- | ---- | ---- |
| statusCode | 処理に対するステータスです。 | 数字 |
| msg | ステータスに関する付加的なメッセージです。 | 文字列 |
| issue_id | NFTの発行ステータスを確認するIDです。 | 文字列(64) |
