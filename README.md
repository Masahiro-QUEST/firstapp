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

## First Step
pubspec.yamlのdepenciesに追加したいpubを追記して、　PUb getを押下
<img width="1055" alt="image" src="https://user-images.githubusercontent.com/94669015/185342480-2260f133-2944-4f76-a046-e71ef48473bd.png">

## Second Step
Webアプリ用セットアップ
1.Cloud Firestoreで「コレクションの開始を押下」
2.ドキュメントの追加
<img width="1360" alt="image" src="https://user-images.githubusercontent.com/94669015/185343285-db99ae47-b605-4107-b0ac-11727e656bf6.png">

# AndoroidStudio参考サイト
- [ショートカット集](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja)
- [pub.dev](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja](https://developer.android.com/studio/intro/keyboard-shortcuts?hl=ja))
