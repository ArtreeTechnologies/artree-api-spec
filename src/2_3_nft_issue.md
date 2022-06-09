# NFTの発行

デプロイしたコントラクトに対してリクエストを送りNFTを発行します。
コントラクトの所有者と必要な情報を入力します。

```ts
import axios from 'axios';

const url = 'https://api.artree.jp/nft/issue'

const request = {
    owner: "0x6fA7BAB5fB3A644af160302de3Badc0958601b44",
    args: [
        "https://static.artree.jp/img/assets/159"
    ]
}

const headers = {
    Authorization: `Basic ${apiKey}:${apiSecret}`
}

// コントラクトのデプロイをリクエスト
const res = axios.post(url, request, {headers})
```

| 変数 | 項目 | 説明 | 必須 |
| ---- | ---- | ---- | ---- |
| url | - | リクエストを送るurlです。ドメインは`api.artree.jp`でリクエストごとに以降のパスが変化します。 | ✔️ |
| request | owner | NFTの所有者を入力します。入力がない場合は管理者に紐づきます。 | - |
| | args | NFTを発行する際のメタデータです。デプロイしたコントラクトによって異なります。 | ✔️ |
| headers | apiKey | 認証用のAPI Keyです。 | ✔️ |
| | apiSecret | 認証用のAPI Secretです。機密情報として管理してください。 | ✔️ |
