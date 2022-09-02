# firstapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# FirebaseをAndroidStudioに付属
Firebaseのメリット1：リアルタイムでの同期
リアルタイム同期型のデータベース使用がFirebaseでは可能です。一般的なデータベースでは、アプリからクラウド上のデータベースにアクセスし、直接データを読み書きします。

しかし、Firebaseの場合は、アプリがデータベースのローカルコピーに対して変更し、リアルタイムでサーバ上のデータベースに同期します。ローカルコピーを保持しているため、オフラインでも利用でき、オンラインになると同期します。

Firebaseのメリット2：サーバ管理が不要
Firebaseはバックエンド処理を担当するため、サーバ管理や保守が不要です。webアプリを自前で開発する場合、まずサーバを構築する手間や費用がかかり、稼働後もインフラの保守運用の費用がかかります。

Firebaseを利用することで、サーバを管理するエンジニアのリソースの節約と負担を軽減させ、クライアントサイドのプログラミングに集中させる、といった使い方ができます。

Firebaseのメリット3：複数の言語で開発可能
Firebaseは、Objective-C、Swift、Java、Scriptava、C++などさまざまな言語で開発ができます。エンジニアは既に習得している得意な言語を使い、Firebaseを利用できる可能性があります。

新たな開発言語を学習しなおす時間と手間をかけずに、アプリケーションの開発を始めることができます。

Firebaseのメリット4：コストやリソースの削減
通常、アプリケーションを開発するためにはサーバ側のインフラを構築したり、サーバサイドプログラムの開発も必要です。Firebaseを利用することでサーバ側の構築と開発、運用管理が不要になり、コストやリソースが削減できます。

また、使用量に応じて課金される仕組みのため、システム規模に合った料金のみを支払います。サービスの利用者が増えても、サーバ増築の検討は不要で、使用量分の料金を支払うのみです。

Firebaseのメリット5：豊富な機能
Firebaseはアプリ開発に活用できる豊富な機能があります。

例えば、リアルタイムに同期できるデータベース、特定ターゲット向けのメッセージ通知、ユーザー分析ができるアナリティクスやリアルタイムクラッシュレポートなど、さまざまな機能と使い方があり、組み合わせることでアプリ開発ができます。

具体的な機能について、このあとでご紹介します。
以下のバージョンのpubを追加。

- [firebase_core: ^1.20.1]
- [cloud_firestore: ^3.4.4]

## First Step -Firebase store編-
pubspec.yamlのdepenciesに追加したいpubを追記して、　PUb getを押下

## Second Step  -Firebase store編-
Webアプリ用セットアップ
1.Cloud Firestoreで「コレクションの開始を押下」
2.ドキュメントの追加
<img width="1360" alt="image" src="https://user-images.githubusercontent.com/94669015/185343285-db99ae47-b605-4107-b0ac-11727e656bf6.png">

## Third Step  -Firebase store編-
ルール設定。
<img width="1512" alt="Firestoreのルール設定" src="https://user-images.githubusercontent.com/94669015/185844978-23189fd7-3b20-45a8-b8a8-556c7c19bd19.png">

上記画像のところで、必要なセキュリティ設定が行える。
例えば、ログインしたユーザじゃないと閲覧できないコンテンツの設定をしたりが可能。

## First Step -Firebase storage編-
Storageは一般的なファイルストレージ機能を提供します。
ユーザからのファイルのアップロードや、全ユーザに提供する共有ファイルを配置するなどに使うことができます。認証済みユーザだけにアクセスを制限可能。

<img width="1376" alt="image" src="https://user-images.githubusercontent.com/94669015/185863987-ff6525ca-9bf3-4e29-937c-a3004cb7f0f6.png">
デフォルトのルールは認証した人しかアクセスできないようになっている。

## First Step -Firebase Authentication編-
Authiの「User」箇所に登録すると情報が表示される。
<img width="1501" alt="image" src="https://user-images.githubusercontent.com/94669015/186336203-2f35852b-0f4b-453d-924e-8151c35b6c1c.png">

「Sign-in method」のところでログイン　プロバイダの情報で押下し、有効にする必要がある。
<img width="1486" alt="image" src="https://user-images.githubusercontent.com/94669015/186337163-e37ea191-c5d7-4f78-8b5e-4e1b75c26fa3.png">


# エラー関係
DartにはExceptionとErrorクラスがある

馴染みのOSError等準備されたものがある（Implementers）
ExceptionとErrorの大まかな違い

- [Exception]
プログラムの問題ではなく、実行中に異常が起こった場合のため、コード修正が不要
- [Error]
プログラムの問題であり、コード修正が必要

*Firebaseの値取得の際にエラーやNullが入っていると『Exception』のエラーがでる

<img width="1031" alt="image" src="https://user-images.githubusercontent.com/94669015/185551156-360aec77-cd6b-4c35-b04e-1561ff38df2c.png">
## flutterのPackageのhttpのバージョン0.13.4を導入したところ下記のエラーが出てしまいました。
<img width="1077" alt="image" src="https://user-images.githubusercontent.com/94669015/186567718-c36a23cb-d9f3-4a97-9d8b-89cfffe05b73.png">
The argument type 'String' can't be assigned to the parameter type 'Uri'.

Stringの引数をURLに割り当てられませんというエラー。
```
function test() {
  console.log("この関数の前に空白行があるのがわかりますか?");
}
```

# knowledge
Shift + F6　･･･　変数名一括変換
Control　 + command + L  ･･･ コード整形

# AndoroidStudio参考サイト
- [ショートカット集](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja)
- [pub.dev](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja))
- [Flutter大学](https://www.youtube.com/watch?v=VZZx7YONWhc))
