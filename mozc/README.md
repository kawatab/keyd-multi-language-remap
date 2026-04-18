# Mozc Key Bindings

These key bindings are based on the MS-IME layout. The primary difference is the implementation of `Shift` + `Hiragana`.

## Behavior
A. When pressing `Space` + `V`
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `X`, followed by `Hiragana`.
  2. Mozc ignores the `Ctrl` + `Alt` + `Shift` + `Super` + `X` sequence.
  3. Mozc captures `Hiragana` and switches to Hiragana mode.

B. When pressing `Space` + C
  1. keyd converts the input to `Ctrl` + `Alt` + `Shift` + `Super` + `X`, followed by `Shift` + `Hiragana`.
  2. Mozc ignores the `Ctrl` + `Alt` + `Shift` + `Super` + `X` sequence.
  3. Mozc captures `Shift` + `Hiragana` and switches to Alphabet mode.

## Setup Instructions
1. Download `keymap.txt`.
2. Open the Mozc key binding settings menu.
3. Import the downloaded file.

---

# Mozcキー設定

このキー設定はMS-IMEのレイアウトに基づいています。主な相違点は `Shift`+ひらがなキーの実装です。

## 動作仕様
A. `Space`+`V`を押した場合
  1. keyd が入力を`Ctrl`+`Alt`+`Shift`+`Super`+`X`に変換し、それに続けて、ひらがなキーを送ります。
  2. Mozcは`Ctrl`+`Alt`+`Shift`+`Super`+`X`のシーケンスを無視します。
  3. Mozcが ひらがなキーを捕捉し、ひらがなモードに切り替えます。

B. `Space`+`C`を押した場合
  1. keydが入力を `Ctrl`+`Alt`+`Shift`+`Super`+`X`に変換し、それに続けて、`Shift`+ひらがなキーを送ります。
  2. Mozcは`Ctrl`+`Alt`+`Shift`+`Super`+`X`のシーケンスを無視します。
  3. Mozcが`Shift`+ひらがなキーを捕捉し、英数モードに切り替えます。

## セットアップ方法
1. `keymap.txt`をダウンロードします。
2. Mozcのキー設定メニューを開きます。
3. ダウンロードしたファイルをインポートします。
