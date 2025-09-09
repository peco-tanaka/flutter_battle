# バトルシステム実装計画

## 概要

flutter を使用したシンプルなコマンドバトルゲームのバトルシステムを実装する。
三すくみの関係を持つコマンド（攻・反・溜）のじゃんけんを繰り返し、相手のHPを0にした方が勝利となる。

## 現在の状況

- Flutter プロジェクト基盤は構築済み
- Isar（ローカルDB）、freezed が依存関係に追加済み
- Flavorizr による環境分けが設定済み
- 基本的なアプリ構造（App, MyHomePage）が存在

## 実装計画

### Phase 1: データモデル設計・実装

- [ ] キャラクターデータモデルの作成
    - [ ] `lib/models/character.dart` - キャラクター基本情報
    - [ ] `lib/models/character.freezed.dart` - freezed生成ファイル
- [ ] バトル関連データモデルの作成
    - [ ] `lib/models/battle_command.dart` - コマンド（攻・反・溜）定義
    - [ ] `lib/models/battle_state.dart` - バトル状態管理
    - [ ] `lib/models/battle_result.dart` - バトル結果
- [ ] Isarデータベースエンティティの作成
    - [ ] `lib/database/entities/player_entity.dart` - プレイヤーデータ
    - [ ] `lib/database/entities/enemy_entity.dart` - 敵データ

### Phase 2: バトルロジック実装

- [ ] 三すくみシステムの実装
    - [ ] `lib/game/battle_logic.dart` - じゃんけん判定ロジック
    - [ ] コマンド相性判定（攻 > 反 > 溜 > 攻）
- [ ] コマンド制限システムの実装
    - [ ] 連続同一コマンド制限（2回連続後は選択不可）
    - [ ] コマンド履歴管理
- [ ] ダメージ計算システムの実装
    - [ ] 基本ダメージ計算
    - [ ] HP管理
    - [ ] 勝敗判定

### Phase 3: バトルUI実装

- [ ] バトル画面の作成
    - [ ] `lib/pages/battle_page.dart` - メインバトル画面
    - [ ] キャラクター表示UI
    - [ ] HP表示UI
- [ ] コマンド選択UI実装
    - [ ] コマンドボタン（攻・反・溜）
    - [ ] 使用不可コマンドの視覚的表示
- [ ] バトル結果表示UI
    - [ ] ターン結果表示
    - [ ] 最終勝敗表示

### Phase 4: 状態管理実装

- [ ] BLoC/Riverpodによる状態管理
    - [ ] `lib/blocs/battle_bloc.dart` - バトル状態管理
    - [ ] バトルイベント定義
    - [ ] バトル状態更新ロジック
- [ ] データ永続化
    - [ ] Isarデータベース設定
    - [ ] バトル履歴保存機能

### Phase 5: テストデータ・初期化

- [ ] テストデータの実装
    - [ ] プレイヤーキャラクター初期データ
    - [ ] 敵キャラクター初期データ
- [ ] データベース初期化処理
    - [ ] アプリ起動時のデータベースセットアップ

### Phase 6: 統合・テスト

- [ ] 各コンポーネントの統合
- [ ] バトルフロー全体のテスト
- [ ] UI/UXの調整

## 技術スタック

- **フレームワーク**: Flutter (最新)
- **状態管理**: BLoC or Riverpod
- **データモデル**: freezed
- **ローカルDB**: Isar
- **環境管理**: Flavorizr

## ファイル構成予定

```
lib/
├── models/
│   ├── character.dart
│   ├── battle_command.dart
│   ├── battle_state.dart
│   └── battle_result.dart
├── database/
│   ├── database.dart
│   └── entities/
│       ├── player_entity.dart
│       └── enemy_entity.dart
├── game/
│   └── battle_logic.dart
├── blocs/
│   └── battle_bloc.dart
├── pages/
│   ├── battle_page.dart
│   └── my_home_page.dart (既存)
└── widgets/
    ├── character_display.dart
    ├── command_buttons.dart
    └── battle_result_dialog.dart
```

## 実装時の注意点

- YAGNI原則に従い、現在の要件に集中する
- DRY原則で重複コードは関数化・モジュール化する
- KISS原則でシンプルで理解しやすいコードを心がける
- 小さな単位でコードを生成し、逐次レビューを行う
