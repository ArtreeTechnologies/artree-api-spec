# デプロイのステータス確認

コントラクトのデプロイをリクエストした後に、デプロイの処理のステータスを確認します。
デプロイが完了した場合にNFTの発行を行うことができます。


```ts
import axios from 'axios';

const deployId = 'b916f448-759c-ef52-2c52-95d42c078ae6'
const url = `https://staging.api.artree.jp/contract/deploy/status/${deployId}`

const headers = {
    Authorization: `Basic ${base64.encode(apiKey + ':' + apiSecret)}`
}

// コントラクトのステータスを取得
const res = axios.get(url, {headers})
```

## リクエストパラメータ

| 変数 | 項目 | 説明 | 必須 |
| ---- | ---- | ---- | ---- |
| deployId | _ | ステータスを確認するデプロイリクエストのIDです。 | ✔️ |
| url | - | リクエストを送るurlです。ドメインは`api.artree.jp`でリクエストごとに以降のパスが変化します。 | ✔️ |
| headers | apiKey | 認証用のAPI Keyです。 | ✔️ |
| | apiSecret | 認証用のAPI Secretです。機密情報として管理してください。 | ✔️ |

## レスポンスパラメータ

| 項目 |  項目 |説明 | 型 |
| ---- | ---- | ---- | ---- |
| statusCode | _ | 処理に対するステータスです。 | 数字 |
| status | _ | デプロイ処理のステータスです。`DEPLOYED`であればデプロイが完了しています。 | "PENDING", "DEPLOYED", "FAILED" |
| contract | address | コントラクトのアドレスです。 | 文字列(42) |
|| tx_hash | コントラクトをデプロイしたトランザクションハッシュです。 | 文字列(66) |
