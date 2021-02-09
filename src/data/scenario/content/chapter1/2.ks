;===============================================================================
; 鱧天シナリオファイルひな形「シネマットモード・シーン末尾は選択肢」
;
; このファイルは必ず「*scene-start」から始まり、「*scene-end」で終わるように
; してください。
;===============================================================================
*scene-start
;シーンをはじめる準備。
;シネマットモードではじめます。
[prepcinema]

;立ち絵はリセットしておく
[init_persons]

;暗幕を消してスタート。「samplebg2」を任意の背景名に書き換えてください。
[exbacklay]
[startcinema_0lines]
[bgimage storage="samplebg2"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「neopolis」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="neopolis"]

[wait time="500"]
[start_speak]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

[begintalk]
[blname name="二月ほづみ"]
というわけで、飛んできました。[xp]

[blname name="二月ほづみ"]
ここが二つ目のひな形ファイル。[xp]

[beginstory]
基本的にシネマット＆立ち絵なしで進んでいますが、最初のひな形との違いはずばり……[xl]選択肢です！[xp]

[begintalk]
[blname name="二月ほづみ"]
シーン末尾が選択肢で終わることによって、シナリオが分岐します。[xp]

[blname name="二月ほづみ"]
そういうのが作りたいときにこれを利用ください。[xp]

[beginstory]
というわけで、諸事情によりいったん場所を移動します。[xp]

;背景をワイプで入れ替える
[exbacklay]
[bgimage storage="samplebg"]
[trans_wipe]

[begintalk]
[blname name="二月ほづみ"]
というわけで、再び飛んできました。[xp]

[blname name="二月ほづみ"]
あっ。[lr]
森に戻ってきたのに都会の音が鳴っています。[xp]

[blname name="二月ほづみ"]
変更しますね。[lr]
まず消します。[xp]

;BGMを消す
[fadeoutbgm time="1500"]

[blname name="二月ほづみ"]
フェードアウト。[xp]

;フェードアウトを待つ
[wb]

[blname name="二月ほづみ"]
消えましたね。[lr]
では、変更！[xp]

;BGMをかける。
[explaybgm storage="anxious_mini"]

[blname name="二月ほづみ"]
変わりました。[xp]

[blname name="二月ほづみ"]
では、次に行く世界を選んでください。[xp]

;===============================================================================
; シーン終了
*scene-end

; 選択肢関係ここから

; シーンスキップで飛んできた時用に選択肢直前の背景・立ち絵・イベント絵の設定を入れる
; 立ち絵が立ってるときは直前の立ち絵タグも入れること
[exbacklay]
[bgimage storage="samplebg"]
[evimage storage="clearmat"]
[trans_change]

;直前にかかっている音楽（シーン冒頭から変更されている場合のみ）
[explaybgm storage="anxious_mini"]

;会話文で終わっているので（地の文で終わっている場合は「beginstory」）
[begintalk]

[prepare_selection]

; 質問文
どのサンプルへ飛びますか？[r]
[r]

; ここから選択肢
[exlink target="*ans1" text="立ち絵のある世界"][r]
[exlink target="*ans2" text="ADV形式の世界"][r]
; ここまで選択肢


[show_selection]
[s]
;------------------------------------------------
;「立ち絵のある世界」の結果
*ans1
[hide_selection]

;選択結果のジャンプ先
[eval exp="f.nextscene = 'chapter1/2-1.ks'"]
[jump target="*finishselect"]
[s]
;------------------------------------------------
;「ADV形式の世界」の結果
*ans2
[hide_selection]

;選択結果のジャンプ先
[eval exp="f.nextscene = 'chapter1/2-2.ks'"]
[jump target="*finishselect"]
[s]
;------------------------------------------------


; 選択肢終了
*finishselect

[screturn][s]

