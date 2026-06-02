# keyd Multi‑Language Remap

> **Languages:** [English](#english) | [日本語](#japanese)

---

<a name="english"></a>

## English

This repository contains custom **keyd** configuration files designed for efficient keyboard and trackball remapping on Linux. It is optimized for non‑JIS layout users managing multiple languages, cross-device workflows (Krita, Terminal), and Japanese IME (Fcitx5/Mozc).

---

### About keyd

**keyd** is a low-level keyboard remapping daemon for Linux that enables advanced customization, including layers, dual-role keys, and complex remapping rules.

* Official repository: [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd)

---

## Key Features

This configuration is built upon the core capabilities of **keyd**, which allows for low-level keyboard remapping with the following mechanisms:

* **Remapping**: Replacing an actual key input with a completely different key input.
* **Dual-Role (Tap/Hold)**: Assigning two distinct functions to a single key based on whether it is briefly tapped or held down.
* **Custom Modifiers**: Enabling non-modifier keys (such as the Spacebar or RightAlt) to function effectively as modifier keys.
* **Chording**: Assigning unique operations or launching layers based on specific key combinations.

### Navigation & Editing (ESDF Cluster)

The `space_layer` brings efficient text navigation right under your left hand:

* **Arrows**: `E` (Up), `S` (Left), `D` (Down), `F` (Right)
* **Page Operations**: `W` (PgUp), `R` (PgDn), `A` (Home), `G` (End)
* **Backspace**: `Q`

### Multi-Language, IME, & Universal Compose Optimization

This system coordinates **UltimateKEYS**, **Hungarian (HU)**, **Russian (RU)** layouts, and **Fcitx5 / Mozc** to provide a seamless multilingual typing environment:

* **Keyboard Layout**: A custom version of **UltimateKEYS**. In the original layout, pressing `AltGr + 102nd-key` triggers `Multi_key` (acting as `Compose`) regardless of the `Shift` state. This configuration overrides that behavior so that holding `Shift + AltGr + 102nd-key` acts as `dead_greek`, unlocking Greek character input.

* **Layout-Agnostic Universal `Compose` Key (`rightalt`)**: 
  The physical `AltGr` key (`rightalt`) is configured as a dual-role key with a **150ms hold threshold** to break layout boundaries:
  * **Hold** (≥ 150ms): Activates `g_layer`, passing through the standard **`AltGr` (Graph)** modifier signals natively required by the currently active layout (UltimateKEYS, HU, etc.) for extended character input.
  * **Tap** (< 150ms): Functions as a **Universal `Compose` key** (`Multi_key`).

* **Language & Mode Switching (Simultaneous press with `Space`):**
  * **Mozc (Hiragana)**: `Space` + `V`
  * **Mozc (Alphabet)**: `Space` + `C`
  * **Layout 1 (UltimateKEYS)**: `Space` + `X`
  * **Layout 3 (HU)**: `Space` + `Z`
  * **Layout 4 (RU)**: `Space` + `102nd`

### Numpad Emulation

A standard numeric keypad layout (inspired by ISO/IEC 9995-2) mapped to the right-hand keys within the `space_layer`.

* **7 8 9 /** : `7` `8` `9` `0`
* **4 5 6 \*** : `U` `I` `O` `P`
* **1 2 3 -** : `J` `K` `L` `;`
* **0 , . +** : `M` `,` `.` `/`

### Windows-Style Numpad Navigation Fallback

On many modern compact keyboards, editing keys like `Home`, `End`, `PgUp`, and `PgDn` are either omitted or buried under awkward `Fn` key combinations. For layouts with a numeric cluster, this configuration provides a fallback to bypass this limitation:

* When `Shift` is held, the numpad keys automatically morph into directional and editing actions (`kp7` → `Home`, `kp1` → `End`, etc.), perfectly replicating native Windows behavior on Linux.
* **Note**: This feature does not support simultaneous dual-Shift presses.

### Universal Trackball Navigation Chording

By utilizing the trackball's physical **Back** and **Forward** buttons as dedicated modifier triggers (layer switches), this configuration enables complete page and document navigation directly from the device, eliminating the need to move your right hand back to the keyboard's editing cluster:

* **Back Button Chording**: Holding the **Back** button and clicking triggers document-edge navigation:
  * `Back + Left Click` → `Home`
  * `Back + Right Click` → `End`

* **Forward Button Chording**: Holding the **Forward** button and clicking triggers vertical page manipulation:
  * `Forward + Left Click` → `PgUp`
  * `Forward + Right Click` → `PgDn`

* *Note*: Standard standalone clicks on the Back and Forward buttons continue to function natively as normal web browser navigation when no simultaneous click is detected.

### Universal Clipboard Shortcuts (CUA Standard)

To bypass terminal conflicts (where `Ctrl+C` kills processes) and avoid stretching your hand across the keyboard, holding modifiers transforms the trackball's assignable buttons into universal clipboard tools based on the IBM CUA standard:

* **Shift Layer**: 
  * `Shift + Back` → `Shift+Insert` (**Paste**)
  * `Shift + Forward` → `Shift+Delete` (**Cut**)

* **Ctrl Layer**: 
  * `Ctrl + Back` → `Ctrl+Insert` (**Copy**)

### Cross-Device Krita Pan Workaround

The most standard way to pan the canvas in Krita is holding the **Middle Mouse Button**. However, under this system's KDE Plasma environment, the middle click hold is globally intercepted to drive "Trackball Scrolling". As a result, the application never receives the raw middle-hold signal.

To achieve standard panning without losing system-wide trackball scrolling, this setup maps Krita's secondary native gesture (**Space + Left-click**):

* **The Challenge**: Holding `Space` native to `keyd` intercepts Krita's standard `Space + Left-click` pan gesture. 
* **The Solution**: While in `space_layer`, physical Left/Right clicks are mapped to `mouse1`/`mouse2` (Back/Forward). By binding these mouse signals to "Pan" inside Krita's canvas settings, the seamless native pan feel is perfectly restored.

### Mouse Acceleration Scripts

This directory stores scripts triggered by OS-level keyboard shortcuts to manipulate pointer speed. Since modern audio players are easily operated via Space/Arrows, this setup repurposes unused **Media Keys** to pass hardware control signals safely:

* `⏪` → Triggers `accel-off.sh` (Disables pointer acceleration)
* `⏩` → Triggers `accel-on.sh` (Enables pointer acceleration)
* `⏯` → Triggers `accel-toggle.sh` (Toggles acceleration state)

#### Experimental Sync & Physical Feedback Rule

The system intentionally avoids complex background tracking daemons. Instead, it leverages **tactile sensory feedback**:

1. Activating `CapsLock` macro-sends `⏯` ` to drop mouse acceleration.
2. The heavy, sluggish cursor feel acts as a physical reminder that `CapsLock` is currently active, preventing accidental capital typing.
3. If the state relationship ever goes out of sync, pressing the explicit `⏪` / `⏩` hotkeys immediately re-aligns the hardware relation.

### Enhancing Minimalist 2-Button Devices

* **Tap/Hold Wheel Emulation**: 
  * **Brief Tap** (< 200ms): Acts right button
  * **Sustained Hold** (≥ 200ms): Acts as middle buton. When paired with the desktop environment's (e.g., KDE Plasma) "Scroll with mouse button" feature, this allows the trackball itself to drive smooth system-wide scrolling.

* **Chorded Navigation**: Sends a `Back` browser navigation command.

---

## Hardware Support

**Tested Devices:**
* **Kensington TrackBall Orbit** (Product ID: 047d:80fa)
  - 4th and 5th mouse buttons fully integrated for layer switching
  - Mouse wheel emulation via center-click behavior

* **Logitech Marble Mouse** (Product ID: 046d:c402)
  - Right Click and Wheel Emulation
  - Pressing Left + Right clicks simultaneously sends the `Back` command

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
*  Refer to the README in the `UltimateKEYS/` directory.

3. **Fcitx5 & Mozc**:
* Refer to the README in the `fcitx5/` or `mozc/` directory for the **Input Method Selector** setup and **Mozc key bindings**.
* Ensure `imselector.conf` is placed in `~/.config/fcitx5/conf/`.

4. **Mouse Scripts**:
* Place `mouse-accel-scripts` into your environment and map your Desktop Environment (e.g., KDE Plasma) global shortcuts to execute them using your keyboard's media keys.

---

## Notes

* The hardware integration features are tailored for specific workflows on the Kensington TB450 and Logitech Marble Mouse; device IDs and keycodes must be checked and altered to fit your specific setup.

---

<a name="japanese"></a>

## 日本語

このリポジトリは、Linux環境におけるキーボードおよびトラックボールの効率的なリマッピングを行うための **keyd** 設定ファイルと周辺スクリプトを管理しています。複数言語レイアウト、デバイスをまたぐワークフロー（Krita、ターミナル）、および日本語IME（Fcitx5/Mozc）を利用する、非JIS配列のユーザー向けに最適化されています。

---

### keyd について

**keyd** は Linux 向けの低レベルキーボードリマッパーで、レイヤー、修飾キーの多機能化、高度なリマッピングルールを定義可能です。

* 公式リポジトリ: [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd)

---

## 主な機能

本設定は、以下のような高度な低レイヤー・リマッピングを可能にする **keyd** のコア機能をベースに構築されています：

* **キーの置き換え**: 実際のキー入力を別のキー入力に置き換える。
* **デュアルロール（タップ/ホールド）**: 1つのキーに「短くタップしたとき」と「押し続けたとき」の2つの機能を持たせる。
* **カスタム修飾キー**: 本来は修飾キーではないもの（スペースキーや右Altキーなど）を、修飾キーとして機能させる。
* **コンビネーション制御**: 特定のキーの組み合わせに対して、独自の機能やレイヤー展開を割り当てる。

### ホームポジション・ナビゲーション (ESDFクラスタ)

`space_layer` を展開中、左手ホームポジションのまま強力なテキスト操作が可能です：

* **方向キー**: `E`（上）、`S`（左）、`D`（下）、`F`（右）
* **ページ操作**: `W` (PgUp)、`R` (PgDn)、`A` (Home)、`G` (End)
* **Backspace**: `Q`

### 多言語・IME環境 ＆ 共通Composeキーの最適化

本システムは、**UltimateKEYS**、**ハンガリー語 (HU)**、**ロシア語 (RU)** 配列、そして **Fcitx5 / Mozc** をシームレスな多言語タイピング環境を実現します：

* **キーボード配列**: 独自カスタマイズ版の **UltimateKEYS**。オリジナル配列では `Shift` の有無に関わらず `AltGr + 102ndキー` が常に `Multi_key`（`Compose` として機能）になってしまう仕様を修正し、`Shift` 同時押し時（`Shift + AltGr + 102ndキー`）には `dead_greek`（デッドキー）として動作させてギリシャ文字入力を可能にしています。

* **配列に依存しない共通AltGr＆Compose（`rightalt`）**:
  物理的な `AltGr` キー（`rightalt`）にホールド判定 **150ms** のデュアルロール（2つの役割）を持たせることで、選択中の配列の枠を超えた文字入力基盤を構築しています：
  * **ホールド時** (≥ 150ms): 本来の **`AltGr`（グラフキー）** の挙動をシミュレートする **`g_layer`** をアクティベートします。
  * **タップ時** (< 150ms): 選択しているレイアウトを問わず一発で機能する **共通の `Compose`（コンポーズ）キー**（`Multi_key`）として動作します。

* **言語・モード切り替え（`Space` キーとの同時押し）:**
  * **Mozc (ひらがな)**: `Space` + `V`
  * **Mozc (英数)**: `Space` + `C`
  * **第1レイアウト (UltimateKEYS)**: `Space` + `X`
  * **第3レイアウト (HU - ハンガリー語)**: `Space` + `Z`
  * **第4レイアウト (RU - ロシア語)**: `Space` + `102nd`

### テンキーエミュレーション

`space_layer` 展開時、右手側キーが ISO/IEC 9995-2 規格に準拠したテンキー配列へと変化します。

* **7 8 9 /** : `7` `8` `9` `0`
* **4 5 6 \*** : `U` `I` `O` `P`
* **1 2 3 -** : `J` `K` `L` `;`
* **0 , . +** : `M` `,` `.` `/`

### Windows風テンキーナビゲーション

近年のコンパクトなキーボードやノートPCでは、`Home` / `End` / `PgUp` / `PgDn` といった編集用のキーが排除されていたり、`Fn`キーとの同時押しを強要されるなど、非常に押しにくい位置に配置されているケースが目立ちます。本設定では、テンキー（またはそれに準ずるカスタムテンキー層）を有効活用し、この物理的課題を解決する手段を実装しています：

* `Shift`をホールドしている間、テンキー側が自動的にカーソル移動や編集キー（`kp7` → `Home`、`kp1` → `End` など）へと変化し、Windowsと全く同様の直感的なナビゲーション挙動をLinux上で再現します。
* **注意点**: 本機能は左右のShiftキー同時押し（両押し）には非対応です。

### トラックボールのサイドボタン同時押しによるユニバーサル・ナビゲーション
トラックボールの物理的な **Back（戻る）** および **Forward（進む）** ボタンを、それ自体が独自のカスタム修飾キーとして機能するように定義しています。

* **Back（戻る）ボタンとの同時押し**: **Back** ボタンを押しながら左右クリックを行うことで、行・ドキュメントの端へとジャンプします：
  * `Back + 左クリック` → `Home`
  * `Back + 右クリック` → `End`

* **Forward（進む）ボタンとの同時押し**: **Forward** ボタンを押しながら左右クリックを行うことで、大幅なページスクロールを行います：
  * `Forward + 左クリック` → `PgUp`
  * `Forward + 右クリック` → `PgDn`

* ※ボタンをホールドせず単体でクリックした場合は、本来のネイティブな **Back（戻る）** / **Forward（進む）** としてブラウザ等でそのまま動作します。

### CUA規格準拠のユニバーサル・クリップボード操作

ターミナル環境（`Ctrl+C` がプロセス強制終了になる）での衝突回避や、キーボードへ手を戻す無駄な動きを無くすため、修飾キーホールド時、トラックボールの割り当て変更ボタンをIBM CUA規格のクリップボードショートカットに変化します。

* **Shiftレイヤー時**:
* `Shift + Back` → `Shift+Insert` (**ペースト**)
* `Shift + Forward` → `Shift+Delete` (**カット**)

* **Ctrlレイヤー時**:
* `Ctrl + Back` → `Ctrl+Insert` (**コピー**)

### Kritaでのパン操作ワークアラウンド

Kritaにおいてキャンバスを移動（パン）する最も標準的な操作は「**中ボタン（ホイールクリック）のホールド**」です。しかし本環境（KDE Plasma）では、中ボタンのホールドをシステムレベルで「トラックボールスクロール」に割り当てているため、中ボタンのホールド信号がKritaなどのアプリケーションまで到達しません。

システム全体のスクロール利便性を維持しつつ、Krita側でも快適にパン操作を行うため、Kritaのもう一つの標準操作である「**Space + 左クリック**」をベースとした以下のワークアラウンドを実装しています：

* **課題**: `keyd` でスペースをレイヤーキーとしてホールドすると、Krita標準の `Space + 左クリック` によるパン操作が機能しなくなります。
* **解決策**: `space_layer` 展開中の左右クリックに `mouse1` / `mouse2`（戻る/進む）を割り当て、Krita側の設定で「戻る/進むボタン」にキャンバス移動をマッピングします。これにより、ユーザーの操作感としては完全に標準の `Space + 左クリック` によるパンを再現しています。

### マウス加速制御スクリプト

このディレクトリには、OSのグローバルショートカット経由で呼び出され、ポインタの加速状況を制御するスクリプト群が収められています。音楽プレイヤーはスペースや矢印キーで十分操作可能なため、普段使用しない「メディアキー」をハードウェア制御の安全なシグナルとして再利用しています。

* `⏪` → `accel-off.sh` を実行（加速をオフ）
* `⏩` → `accel-on.sh` を実行（加速をオン）
* `⏯` → `accel-toggle.sh` を実行（加速状態を反転）

#### 試験的な違和感を利用した状態管理

バックエンドで複雑な監視デーモンを常駐させる代わりに、違和感を利用する試験的なアプローチを導入しています。

1. `CapsLock` が有効（On）になると、マクロ経由で `⏯` が飛び、マウス加速がOffになります。
2. ポインタの動きが意図的に鈍くなることで、感覚的に「CapsLockの戻し忘れ」に気づくことができます。
3. 万が一、OS起動時などに物理LEDとポインタの速度関係が逆転（ミスマッチ）した場合は、明示的なショートカットキー（`⏪` / `⏩`）を一度叩くことで、手動で即座に期待する状態へ矯正可能です。

### 旧世代2ボタンデバイスの有効活用と機能拡張

* **タップ/ホールドによるホイール＆右クリックのエミュレーション**: 
  * **短くタップ時** (< 200ms): 右ボタンとして動作。
  * **長押しホールド時** (≥ 200ms): 中ボタンとして動作。KDE Plasma等のシステム側機能「マウスボタンを押しながらスクロール」と組み合わせることで、スクロール操作を実現します。

* **同時押し（コンビネーション）ナビゲーション**: ブラウザ等の `Back`（戻る）シグナルを送信。

---

## ハードウェアサポート

**動作確認済みデバイス:**

* **Kensington TrackBall Orbit** (Product ID: 047d:80fa)
  - 第4、第5マウスボタンを完全に統合したレイヤー切り替え対応
  - 中央クリックによるマウスホイールエミュレーション機能

* **Logitech Marble Mouse** (Product ID: 046d:c402)
  - 右クリックとホイールのエミュレーション
  - 左右ボタンの同時押しにより`Back`（戻る）シグナルを送信

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
* `UltimateKEYS/` ディレクトリのREADMEを参照。

3. **Fcitx5 & Mozc**:
* `fcitx5/`もしくは`mozc/`ディレクトリのREADMEを参照し、**Input method selector**の設定と **Mozc のキーバインド**設定を行ってください。
* `imselector.conf` を `~/.config/fcitx5/conf/` に配置する必要があります。

4. **マウススクリプト**:
* mouse-accel-scripts ディレクトリを適切な場所に配置し、KDE Plasma等のデスクトップ環境のショートカット設定から、キーボードの各メディアキーと各スクリプトを紐付けます。

---

## 注意事項

* ハードウェア統合機能（Kensington TB450 および Logitech Marble Mouse）は特定のワークフローに合わせて調整されているため、お使いの環境に応じてデバイスIDやキーコードの変更が必要です。

---

# License / ライセンス

This project is licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
本プロジェクトは クリエイティブ・コモンズ 表示 4.0 国際 ライセンスの下で公開されています。
