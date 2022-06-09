# コントラクトのデプロイ

まず初めに、プロジェクトに紐付くコントラクトをデプロイします。
デプロイをするブロックチェーンとコントラクトで発行するNFTの名前とシンボルを決め以下のようにトランザクションを発行します。
コントラクトのデプロイ処理はそれぞれのブロックチェーンネットワークで所要時間が変わります。
そのため、デプロイをリクエストした後に、デプロイのステータスを確認する必要があります。

```ts
import axios from 'axios';

const url = 'https://api.artree.jp/contract/deploy'

const request = {
    symbol: "ETH",
    name: "Ethereum",
    chain: "AST",
    baseUrl: "https://example.com/images/",
    type: "normal",
    royalty: 0
}

const headers = {
    Authorization: `Basic ${base64.encode(apiKey + ':' + apiSecret)}`
}

// コントラクトのデプロイをリクエスト
const res = axios.post(url, request, {headers})
```

## リクエストパラメータ

| 変数 | 項目 | 説明 | 必須 |
| ---- | ---- | ---- | ---- |
| url | - | リクエストを送るurlです。ドメインは`api.artree.jp`でリクエストごとに以降のパスが変化します。 | ✔️ |
| request | symbol | 発行するNFTのシンボルです。例、ETH。 | ✔️ |
| | name | 発行するNFTの名称です。例、Ethereum。 | ✔️ |
| | chain | コントラクトをデプロイするブロックチェーンです。ETH, MATIC, ASTのどれか。 | ✔️ |
| | baseUrl | NFTの画像を保存するディレクトリ名を指定してください。 | ✔️ |
| | type | コントラクトのタイプです。normal, royaltyのどちらか。 | ✔️ |
| | royalty | コントラクトでのロイヤリティを定義します。 | - |
| headers | apiKey | 認証用のAPI Keyです。 | ✔️ |
| | apiSecret | 認証用のAPI Secretです。機密情報として管理してください。 | ✔️ |

## レスポンスパラメータ

| 項目 | 説明 | 型 |
| ---- | ---- | ---- |
| statusCode | 処理に対するステータスです。 | 数字 |
| msg | ステータスに関する付加的なメッセージです。 | 文字列 |
| deploy_id | デプロイのステータスを確認するIDです。 | 文字列(64) |
