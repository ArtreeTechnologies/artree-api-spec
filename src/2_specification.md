# API仕様一覧

このドキュメントではNFT APIの仕様についてまとめられています。
リクエストを送る際のパラメータとシステムから返されるレスポンスの型が定義されています。

## はじめに

ブロックチェーン上でコントラクトのデプロイやNFTの発行を行うにあたり、処理の待ち時間が発生します。
APIをリクエストした後に、Artree APIを通してブロックチェーン上へ処理がリクエストされます。
ブロックチェーン上での処理は他のユーザーが送信しようとしているトランザクション数に依存しますが、通例では10分ほどで完了します。
このような性質があるため全ての処理はリクエストとステータスの確認に分かれています。
予めご了承ください。

## NFT発行の流れ

1. [コントラクトのデプロイリクエスト](https://artreetechnologies.github.io/artree-api-spec/2_1_contract_deploy.html)
2. [コントラクトのデプロイ確認](https://artreetechnologies.github.io/artree-api-spec/2_2_contract_status_check.html)
3. [NFTの発行リクエスト](https://artreetechnologies.github.io/artree-api-spec/2_3_nft_issue.html)
4. [NFTの発行確認](https://artreetechnologies.github.io/artree-api-spec/2_4_nft_status_check.html)

NFTはスマートコントラクトのECR721という規格に基づいて発行されるため、スマートコントラクトをデプロイする必要があります。
スマートコントラクトをデプロイした後にデプロイの確認を行い、処理が正常に終了したことを確認します。
処理が正常に終了したことを確認したら、NFTの発行のリクエストを送信します。
NFTを発行した後に発行の確認を行います。
ブロックチェーン上で行われた処理はトランザクションハッシュやアドレスを入力することで各種エクスプローラーにて確認することができます。

## エクスプローラー

### 本番

- [Ethereum](https://etherscan.io/)
- [Polygon](https://polygonscan.com/)
- [Astar](https://astar.subscan.io/)

### テスト

- [Shibuya](https://shibuya.subscan.io/)
