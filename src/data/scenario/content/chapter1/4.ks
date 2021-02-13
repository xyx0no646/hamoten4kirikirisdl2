;===============================================================================
; 鱧天シナリオファイルひな形「会話ウインドウモード（ADV形式）」
;
; このファイルは必ず「*scene-start」から始まり、「*scene-end」で終わるように
; してください。
;===============================================================================

*scene-start
;シーンをはじめる準備。
;シネマットモードを終わります。
[endcinema]

;立ち絵はリセットしておく
[init_persons]

;暗幕を消してスタート。「samplebg」を任意の背景名に書き換えてください。
[exbacklay]
[bgimage storage="samplebg"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「anxious_mini」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="anxious_mini"]

[wait time="500"]
[start_speak]

;会話ウインドウモードで開始します。
;モノローグ用マットで開始。人物が立っていないときは、右側のマージンを30に指定します。
[show_speaker_mono marginr="30"]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

このひな形では、鱧天で用意しているもうひとつの表示形式である会話ウインドウモードを説明します。[xp]

全画面の文字表示を使わずに、このように画面の下の部分のみに文字を表示するタイプの画面で、
ADVゲームにはこちらの方が使いやすいように思います。[xp]

また、この表示方式の時は、このように……[xp]

;ADVモード時の主人公立ち絵を表示させるときは、表示位置を「lead」にします。
[exbacklay]
[hsimage on="lead" who="margot" body="1_2" face="face1/11" exp1="exp1/01"]
[trans_summon]

;ADV形式では、メッセージの表示領域が、人名の乗るものと、乗らないものがありますので、
;それぞれ、切り替えの際にフキダシを入れ替えなければいけません。

;人が喋るとき
[exbacklay]
[change_speaker]
[trans_change]

[blname name="マーゴット"]
主人公立ち絵が表示できます！[xp]


[blname name="マーゴット"]
そして、もちろん、向こう側にも立ち絵を立たせることができますわよ。[xp]

[blname name="マーゴット"]
エリン〜。[xp]

[exbacklay]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01"]
[trans_summon]

[blname name="エリン"]
お呼びでしょうか。[xp]


;会話でない（モノローグなど）のとき
[exbacklay]
[change_speaker_mono]
[trans_change]

立ち絵の使い方は、表示モードが変わっても変わりません。[xp]

次のひな形では、立ち絵が表示された状態からはじめてみますね。[xp]

;===============================================================================
; シーン終了
*scene-end

; 次のシーンを指定
[eval exp="f.nextscene = 'chapter1/6.ks'"]

[screturn][s]

