# keyd Multi‑Language Remap

> **Languages:** [English](#english) | [日本語](#japanese)

---

<a name="english"></a>

## English

This repository contains custom **keyd** configuration files designed for efficient keyboard remapping on Linux. It is specifically optimized for users who use non‑JIS keyboards with multiple language layouts and Japanese IME.

The configuration enhances text navigation and IME control while maintaining ergonomic efficiency and avoiding conflicts with standard system shortcuts.

---

### About keyd

**keyd** is a low-level keyboard remapping daemon for Linux that enables advanced customization, including layers, dual-role keys, and complex remapping rules.

* Official repository: [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd)

---

## Key Features

### Space-Overload (Dual-role Spacebar)

To avoid interfering with existing system shortcuts, this configuration uses the **Spacebar** as a dual-role key with a **200ms hold threshold**:

* **Tap** (< 200ms): Sends `Space`.
* **Hold** (≥ 200ms): Activates the `space_layer` (custom navigation and function layer).

### Navigation & Editing (ESDF keys)

The `space_layer` provides intuitive access to:

* **Arrows**: `E` `S` `D` `F` (Up/Left/Down/Right)
* **Page Operations**: `W` (PgUp), `R` (PgDn), `A` (Home), `G` (End)
* **Backspace**: `Q`

### Numpad Emulation

A dedicated numpad layout is available within the `space_layer`:

* **7 8 9 /** : `7` `8` `9` `0`
* **4 5 6 \*** : `U` `I` `O` `P`
* **1 2 3 -** : `J` `K` `L` `;`
* **0 , . +** : `M` `,` `.` `/`

### Mouse Button Layers

Mouse thumb buttons (4th and 5th buttons) activate specialized navigation layers:

* **4th Button** (Thumb Back): Activates `m1_layer` for back/navigation commands.
* **5th Button** (Thumb Forward): Activates `m2_layer` for forward/navigation commands.

### Mouse Wheel Emulation

The middle mouse button supports context-aware behavior:

* **Tap** `Ctrl+V` (< 200ms): Sends middle mouse click.
* **Hold** `Ctrl+V` (≥ 200ms): Enables mouse scroll wheel functionality.

### Modifier + Space Behavior

When holding `Shift`, `Ctrl`, `Alt`, or `Meta` keys while pressing space:

* **Tap**: Sends the modified space (`Shift+Space`, `Ctrl+Space`, etc.).
* **Hold**: Activates `space_layer` while retaining the modifier key context.
* **Side effects** (with Shift): Additional bindings for `S+Insert` and `S+Delete` via mouse buttons.

### Optimized for UltimateKEYS + Fcitx5 + Mozc

This setup is specifically designed for the following environment:

* **Keyboard Layout**: A modified version of **UltimateKEYS** (with `Dead Greek` added to `Shift`+`AltGr`+`102nd`).
* **Input Method**: **Fcitx5** with the **Mozc** engine.
* **Language Switching**:
* **Mozc (Hiragana)**: `Space` + `V`
* **Mozc (Alphabet)**: `Space` + `C`
* **Layout 1 (UltimateKEYS)**: `Space` + `X`
* **Layout 3 (HU)**: `Space` + `Z`
* **Layout 4 (RU)**: `Space` + `102nd`

---

## Hardware Support

**Tested Devices:**
* **Kensington TrackBall Orbit** (Product ID: 047d:80fa)
  - 4th and 5th mouse buttons fully integrated for layer switching
  - Mouse wheel emulation via center-click behavior

---

## Installation & Setup

This project consists of multiple components. Please refer to the specific README in each directory for detailed instructions:

1. **keyd**:
* Install **keyd** and clone this repository.
* Copy the configuration files to `/etc/keyd/` and reload:
```bash
sudo keyd reload
```

2. **UltimateKEYS**:
* **Crucial**: Refer to the README in the `UltimateKEYS/` directory to apply the **"Dead Greek" modification** before using this keyd config.

3. **Fcitx5 & Mozc**:
* Refer to the README in the `fcitx5/` or `mozc/` directory for the **Input Method Selector** setup and **Mozc key bindings**.
* Ensure `imselector.conf` is placed in `~/.config/fcitx5/conf/`.

---

## Notes

* **Important**: This configuration **requires** the modified UltimateKEYS layout. It will not work correctly unless "Dead Greek" has been implemented as described in the `UltimateKEYS/` README.
* These configurations are tailored for a specific workflow and hardware (Kensington TrackBall Orbit); you may need to adjust device IDs and keycodes for your system.
* Mouse button behavior is specific to the tested device; verify mouse button IDs match your hardware (`keyd list-keys` to check).

---

<a name="japanese"></a>

## 日本語

このリポジトリでは、Linux 上で効率的なタイピングを実現するための **keyd** 設定ファイルを提供します。
特に、非JIS（US配列等）キーボードを使用し、日本語IMEと複数の言語レイアウトを切り替える環境に最適化されています。

---

### keyd について

**keyd** は Linux 向けの低レベルキーボードリマッパーで、レイヤー、修飾キーの多機能化、高度なリマッピングルールを定義可能です。

* 公式リポジトリ: [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd)

---

## この設定の特徴

### スペースキーの多機能化 (Space-Overload)

既存のショートカットとの衝突を避けるため、スペースキーに2つの役割を持たせています。ホールド判定は **200ms** です：

* **タップ時** (< 200ms): `Space` を入力。
* **ホールド時** (≥ 200ms): `space_layer`（ナビゲーション・関数レイヤー）を有効化。

### カーソル操作・編集 (ESDFキー)

`space_layer` を使用することで、ホームポジションを崩さずに以下の操作が可能です：

* **方向キー**: `E` `S` `D` `F`（上/左/下/右）
* **ページ操作**: `W` (PgUp), `R` (PgDn), `A` (Home), `G` (End)
* **Backspace**: `Q`

### テンキーエミュレーション

`space_layer` 内でテンキー入力が可能です：

* **7 8 9 /** : `7` `8` `9` `0`
* **4 5 6 \*** : `U` `I` `O` `P`
* **1 2 3 -** : `J` `K` `L` `;`
* **0 , . +** : `M` `,` `.` `/`

### マウスボタンレイヤー

マウスのサイドボタン（第4、第5ボタン）でナビゲーションレイヤーを切り替え可能：

* **第4ボタン**（親指・戻る）: `m1_layer` をアクティベート。
* **第5ボタン**（親指・進む）: `m2_layer` をアクティベート。

### マウスホイールエミュレーション

中央ボタンのコンテキスト対応動作：

* **タップ** `Ctrl+V` (< 200ms): 中央クリックを送信。
* **ホールド** `Ctrl+V` (≥ 200ms): スクロールホイール機能を有効化。

### 修飾キー + スペース動作

`Shift`、`Ctrl`、`Alt`、`Meta` キーを押しながらスペースを操作する場合：

* **タップ時**: 修飾キー付きのスペース (`Shift+Space` など) を送信。
* **ホールド時**: 修飾キーのコンテキストを保持しながら `space_layer` をアクティベート。
* **Shift時の追加機能**: マウスボタンに `Shift+Insert`/`Shift+Delete` を割り当て。

### UltimateKEYS + Fcitx5 + Mozc への最適化

以下の環境を前提とした設計になっています：

* **キーボード配列**: 修正版 **UltimateKEYS** (`Shift`+`AltGr`+`102nd` に `Dead Greek` を追加したもの)
* **入力メソッド**: **Fcitx5** + **Mozc**
* **言語・モード切り替え**:
* **Mozc (ひらがな)**: `Space` + `V`
* **Mozc (英数)**: `Space` + `C`
* **第1レイアウト (UltimateKEYS)**: `Space` + `X`
* **第3レイアウト (HU)**: `Space` + `Z`
* **第4レイアウト (HU)**: `Space` + `102nd`

---

## ハードウェアサポート

**動作確認済みデバイス:**
* **Kensington TrackBall Orbit** (Product ID: 047d:80fa)
  - 第4、第5マウスボタンを完全に統合したレイヤー切り替え対応
  - 中央クリックによるマウスホイールエミュレーション機能

---

## セットアップ方法

このプロジェクトは複数のコンポーネントで構成されています。詳細な手順については、各ディレクトリ内のREADMEを必ず参照してください。

1. **keyd**:
* **keyd** をインストールし、本リポジトリをクローンします。
* 設定ファイルを `/etc/keyd/` にコピーしてリロードします：
```bash
sudo keyd reload
```

2. **UltimateKEYS**:
* **重要**: この keyd 設定を使用する前に、`UltimateKEYS/` ディレクトリのREADMEを参照し、**「Dead Greek」の修正**を適用してください。

3. **Fcitx5 & Mozc**:
* `fcitx5/`もしくは`mozc/`ディレクトリのREADMEを参照し、**Input method selector**の設定と **Mozc のキーバインド**設定を行ってください。
* `imselector.conf` を `~/.config/fcitx5/conf/` に配置する必要があります。

---

## 注意事項

* **重要**: この設定は、修正版の UltimateKEYS レイアウトを**必要とします**。`UltimateKEYS/` の README に記載されている「Dead Greek」の実装が行われていない場合、正しく動作しません。
* この設定は特定のワークフローやハードウェア（Kensington TrackBall Orbit）に合わせて調整されているため、お使いの環境に応じてデバイス ID やキーコードの変更が必要な場合があります。
* マウスボタンの動作は使用デバイスに依存します。お使いのデバイスのマウスボタン ID と一致することを確認してください（`keyd list-keys` でご確認ください）。

---

# License / ライセンス

This project is licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
本プロジェクトは クリエイティブ・コモンズ 表示 4.0 国際 ライセンスの下で公開されています。
