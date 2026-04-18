# Fcitx5 Key Bindings

In this configuration, the Fcitx5 keyboard layouts are ordered as follows: 1st is UltimateKEYS, 2nd, is Mozc (Japanese), 3rd is HU and 4th is RU.

The shortcuts to switch layouts are:
- 1st Layout: `Ctrl` + `Alt` + `Shift` + `Super` + `F1`
- 2nd Layout: `Ctrl` + `Alt` + `Shift` + `Super` + `F2`
- 3rd Layout: `Ctrl` + `Alt` + `Shift` + `Super` + `F3`
- 4th Layout: `Ctrl` + `Alt` + `Shift` + `Super` + `F4`

These combinations are intentionally complex to prevent accidental activation. They are intended to be triggered via keyd.

## Behavior
A. When pressing `Space` + `V`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `F2`, followed by `Hiragana`.
  2. Fcitx5 captures `Ctrl` + `Alt` + `Shift` + `Super` + `F2` and switches to **the 2nd layout (Mozc)**.
  3. Fcitx5 ignores the subsequent `Hiragana` key.
  4. Mozc captures `Hiragana` and switches to `Hiragana` mode.

B. When pressing `Space` + `C`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `F2`, followed by `Shift` + `Hiragana`.
  2. Fcitx5 captures `Ctrl` + `Alt` + `Shift` + `Super` + `F2` and switches to **the 2nd layout (Mozc)**.
  3. Fcitx5 ignores the subsequent `Shift` + `Hiragana` key.
  4. Mozc captures `Shift` + `Hiragana` and switches to Alphabet mode.

C. When pressing `Space` + `X`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `F1`.
  2. Fcitx5 captures `Ctrl` + `Alt` + `Shift` + `Super` + `F1` and switches to **the 1st layout (UltimateKEYS)**.

D. When pressing `Space` + `Z`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `F3`.
  2. Fcitx5 captures `Ctrl` + `Alt` + `Shift` + `Super` + `F3` and switches to **the 3rd layout (HU)**.

E. When pressing `Space` + `102nd`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `F4`.
  2. Fcitx5 captures `Ctrl` + `Alt` + `Shift` + `Super` + `F4` and switches to **the 4th layout (RU)**.

## Setup Instructions
1. Open Fcitx5 settings and go to the Add-on window.
2. Enable the Advanced option.
3. Check "**Input method selector**".
4. Click the Apply button.
5. Copy `imselector.conf` to `~/.config/fcitx5/conf/`.
6. Restart Fcitx5.

---

# Fcitx5キー設定

この構成では、Fcitx5のキーボードレイアウトは以下の順序で設定されています：1番目がUltimateKEYS、2番目がHU、3番目がMozcです。

レイアウトを切り替えるためのショートカットは以下の通りです：
- 第1レイアウト: `Ctrl`+`Alt`+`Shift`+`Super`+`F1`
- 第2レイアウト: `Ctrl`+`Alt`+`Shift`+`Super`+`F2`
- 第3レイアウト: `Ctrl`+`Alt`+`Shift`+`Super`+`F3`
- 第4レイアウト: `Ctrl`+`Alt`+`Shift`+`Super`+`F4`

これらの組み合わせは、誤操作を防ぐためにあえて複雑なものに設定されています。これらはkeydを介して実行されることを想定しています。

## 動作仕様
A. `Space`+`V`を押した場合
  1. keydが入力を`Ctrl`+`Alt`+`Shift`+`Super`+`F2`に変換し、続いてひらがなキーを送ります。
  2. Fcitx5が`Ctrl`+`Alt`+`Shift`+`Super`+`F2`を捕捉し、**第2レイアウト（Mozc）**に切り替えます。
  3. Fcitx5はその後のひらがなキーを無視します。
  4. Mozcがひらがなキーを捕捉し、ひらがなモードに切り替えます。

B. `Space`+`C`を押した場合
  1. keydが入力を`Ctrl`+`Alt`+`Shift`+`Super`+`F2`に変換し、続いて`Shift`+ひらがなキーを送ります。
  2. Fcitx5が`Ctrl`+`Alt`+`Shift`+`Super`+`F2`を捕捉し、**第2レイアウト（Mozc）**に切り替えます。
  3. Fcitx5はその後の`Shift`+ひらがなキーを無視します。
  4. Mozcが`Shift`+ひらがなを捕捉し、英数モードに切り替えます。

C. `Space`+`X`を押した場合
  1. keydが入力を`Ctrl`+`Alt`+`Shift`+`Super`+`F1`に変換します。
  2. Fcitx5が`Ctrl`+`Alt`+`Shift`+`Super`+`F1`を捕捉し、**第1レイアウト（UltimateKEYS）**に切り替えます。

D. `Space`+`Z`を押した場合
  1. keydが入力を`Ctrl`+`Alt`+`Shift`+`Super`+`F3`に変換します。
  2. Fcitx5が`Ctrl`+`Alt`+`Shift`+`Super`+`F3`を捕捉し、**第3レイアウト（HU）**に切り替えます。

E. `Space`+`102nd`を押した場合
  1. keydが入力を`Ctrl`+`Alt`+`Shift`+`Super`+`F4`に変換します。
  2. Fcitx5が`Ctrl`+`Alt`+`Shift`+`Super`+`F4`を捕捉し、**第4レイアウト（RU）**に切り替えます。

## セットアップ手順
1. Fcitx5の設定を開き、「アドオン」ウィンドウへ移動します。
2. 「高度なオプションを表示する」オプションにチェックを入れます。
3. **「Input method selector」**にチェックを入れます。
4. 「適用（Apply）」ボタンをクリックします。
5. `imselector.conf`を`~/.config/fcitx5/conf/`にコピーします。
6. Fcitx5を再起動します。
