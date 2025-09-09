# flutter_settings

## Formatter 設定

### エディター設定

- format code on save

## lefthook の導入

### lefthook のインストール

```bash
brew install lefthook
```

### lefthook の初期化

```bash
leftfook install
```

## Flavor 別ビルド / 実行手順

本プロジェクトは `develop` / `production` の 2 つの Flavor を持ち、エントリーポイントは以下です。

- `lib/main_develop.dart` (Flavor: develop)
- `lib/main_production.dart` (Flavor: production)

アプリ内では各 `main_*.dart` で `F.appFlavor` を設定しています。Platform 側 (applicationId / bundleId) を切り替えるため、Flutter コマンド実行時は必ず `--flavor` と `-t` (target) を併用してください。

### 開発実行 (Debug)

#### Android デバイス / Emulator

```bash
flutter run --flavor develop -t lib/main_develop.dart
```

#### iOS Simulator

```bash
flutter run --flavor develop -t lib/main_develop.dart
```

### 本番実行確認 (Debug ビルドで挙動確認)

```bash
flutter run --flavor production -t lib/main_production.dart
```

### リリースビルド (Android)

APK (デバッグ配布用など):

```bash
flutter build apk --flavor develop -t lib/main_develop.dart   # 開発用
flutter build apk --flavor production -t lib/main_production.dart  # 本番用
```

Google Play 配信用 (AAB):

```bash
flutter build appbundle --flavor production -t lib/main_production.dart
```

### リリースビルド (iOS)

```bash
flutter build ios --flavor develop -t lib/main_develop.dart        # 開発 (社内配布等)
flutter build ios --flavor production -t lib/main_production.dart  # App Store 提出用
```

Xcode で開く場合:

```bash
open ios/Runner.xcworkspace
```

Xcode 上で Scheme を Runner のまま、`--flavor` 指定と同様の構成 (xcconfig) が適用されます。Archive 時は Production Flavor のコマンドで一度ビルド済みであることを確認してください。

### 補足

- Dart-define は現状不要 (Flavor は main\_\* で設定)。
- iOS のビルド前に依存更新が必要な場合は `flutter pub get` を実行。
- 署名設定は未調整のため、Android Release 署名や iOS Distribution 証明書の設定が別途必要です。
