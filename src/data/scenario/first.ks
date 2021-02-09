[wait time="200"]

; F#システムレイヤを読み込む（起動時のみ）
[eval exp="Scripts.execStorage('system_mb/magic.tjs')"]

*start

; 吉里吉里プラグインを組み込む
[loadplugin module="plugin/extrans.dll"]
[loadplugin module="plugin/wuvorbis.dll"]

; KAGプラグイン
[call storage="autoInsertLabel.ks"]

; クリックスキップ無効
[clickskip enabled="false"]

; 履歴記録をしばらくヤメ
[history output="false" enabled="false"]

; 右クリック設定
[rclick enabled="false" call="true" storage="commonfunc.ks" target="*rclick_wrapper"]


;===============================================================================
; 各種KAGマクロ読み込み

; シーンディレクション関連
[call storage="setmacro_scene.ks" target="*begin"]

; 画像関連
[call storage="setmacro_image.ks" target="*begin"]

; 文字表示関連
[call storage="setmacro_text.ks" target="*begin"]

; ムービー関連
[call storage="setmacro_movie.ks" target="*begin"]

; サウンド関連
[call storage="setmacro_sound.ks" target="*begin"]

; その他
[call storage="setmacro_user.ks" target="*begin"]

;===============================================================================
; 読み込み完了

[clickskip enabled="true"]

[eval exp="kag.fore.base.cursor = crDefault"]

;===============================================================================
; タイトル画面へ
[rclick enabled="true"]

[image layer="back" page="fore" storage="blackmat"]
[jump storage="title.ks"]
