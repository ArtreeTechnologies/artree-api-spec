# NFTの発行ステータス確認

NFTの発行をリクエストした後に、NFTの発行ステータスを確認します。

```ts
import axios from 'axios';

const issueId = '7973eec7-0071-5a9d-54fd-00bd4a377f10'
const url = `https://api.artree.jp/nft/issue/status/${issueId}`

const headers = {
    Authorization: `Basic ${base64.encode(apiKey + ':' + apiSecret)}`
}

// NFTの発行ステータスを取得
const res = axios.get(url, {headers})
```

## リクエストパラメータ

| 変数 | 項目 | 説明 | 必須 |
| ---- | ---- | ---- | ---- |
| issueId | _ | ステータスを確認するNFTの発行リクエストのIDです。 | ✔️ |
| url | - | リクエストを送るurlです。ドメインは`api.artree.jp`でリクエストごとに以降のパスが変化します。 | ✔️ |
| headers | apiKey | 認証用のAPI Keyです。 | ✔️ |
| | apiSecret | 認証用のAPI Secretです。機密情報として管理してください。 | ✔️ |

## レスポンスパラメータ

| 項目 |  項目 |説明 | 型 |
| ---- | ---- | ---- | ---- |
| statusCode | _ | 処理に対するステータスです。 | 数字 |
| status | _ | デプロイ処理のステータスです。`ISSUED`であればNFT発行が完了しています。 | "PENDING", "ISSUED", "FAILED" |
| nft | id | NFTのIDです。 | 数字 |
|| tx_hash | NFTを発行したトランザクションハッシュです。 | 文字列(66) |
