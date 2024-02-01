# [KIMOCHI]

## サービス概要
KIMOCHIは共同生活するとなぜか発生する「悪いことをするわけではないのに、共同生活者にしてもいいか聞きづらい…」を見える化するアプリです。

## 想定されるユーザー層
10代〜40代の男女

## サービスコンセプト
共同生活を送っていると「なにか悪いことを実行しようとしているわけではないのに、それを行っていいのか相手に言いづらい」というなんともいえない感情が生まれることがあるかと思います。したいことを文字列に落とし込み、お互い平等な感覚で課題解決に向かっていくためのアプリです。
私はよく友達と麻雀をします。既婚の友人に「麻雀をしないか」と声をかけるといつも「妻の隙を伺っている」と回答されます。
もちろん金銭を賭けているわけではないし、他の参加者も友人の妻と知り合いで、麻雀は一種のボードゲームであるため悪いことをしているわけではありません。しかし友人は友人の奥さんに「麻雀をしに行ってもいい？」と言い出しづらいのです。
別の友人は「1人キャンプに行こうとすると妻からあまりいい顔をされないから、なかなか1人キャンプに行けない」と言っていました。
上記のようななんとも言えない感情を文字にして、共同生活者と共有し、お互いに条件提示と承認をしながら、ちょうど良い落とし所をつけるためのアプリです。

## アプリケーションの利用フロー図
基本的にアプリユーザーは報酬（自分の実行したいこと、欲しい物etc...）を得るための、対価（なんらかの条件、任意で複数可能）を設定します。

```mermaid
graph TD
 A(AがBに報酬と対価を提示)-->B[Bが報酬と対価を精査]
 B-->|承諾| C[Aは対価を支払うことが可能になる]
 C-->|全対価支払後| D(Aは報酬を得ることが可能になる)
 D-->|報酬を得る| E(完了)

 B-->|不承諾| G(BはAに報酬と対価の再考を求める)
 G-->H(Aは報酬および対価を修正し再度Bに提示)
 H-->|不承諾| B
 ```

## 実装を予定している機能
### MVP
* 会員登録
* ログイン
* 招待機能
* 投稿機能
* 投稿一覧表示機能
* カテゴリ機能
* アラート機能(LINE Messaging API)


### その後の機能
* リアルタイムチャット機能(ActionCable)

## 使用技術
### バックエンド
* ruby on rails 7.0.7
* ruby 3.2.2

### フロントエンド
* Tailwind CSS

### GEM
* device(ログイン・認証機能)
* omniauth-line, omniauth-rails_csrf_protection(LINEログイン)
* kaminari(ページネーション)
* Active Admin(管理画面)
* ActiveStorage(ファイルアップロード、保存)
* image_processing(画像リサイズ、ファイル容量一律化)
* rubocop(lintチェック)
* RSpec(テスト)

### デプロイ
* heroku

## 画面遷移図
[figma](https://www.figma.com/file/sd5Sa6ScSJaa9vY1S6LSNU/PF(KIMOCHI%EF%BC%89?type=design&node-id=0%3A1&mode=design&t=gUPB3r8R1ZEGAyfV-1))

## ER図
[![Image from Gyazo](https://i.gyazo.com/2fcd92537849c79635a88b5895dd3346.png)](https://gyazo.com/2fcd92537849c79635a88b5895dd3346)