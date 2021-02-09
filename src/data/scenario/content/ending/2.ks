;===============================================================================
; END1「エンディング名」
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
;このひな形では立ち絵が立った状態でスタートします。立たせる立ち絵の指定をします。
[exbacklay]
[bgimage storage="samplebg2"]
[hsimage on="lead" who="margot" body="1_2" face="face1/11" exp1="exp1/01"]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「anxious_mini」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="anxious_mini"]

[wait time="500"]
[start_speak]

;会話ウインドウモードで開始します。
;モノローグ用マットで開始。
[show_speaker_mono]

;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

そういった訳でエンディングその２です。[xp]

エンディングも、書き方は普通のシナリオファイルと同じです。[xp]

[exbacklay]
[hsimage on="lead" who="margot" body="1_2" face="face1/20" exp1="exp1/01"]
[trans_change]

;人が喋るとき
[exbacklay]
[change_speaker]
[trans_change]

[blname name="マーゴット"]
鱧天チュートリアルをお読みくださり、ありがとうございました！[xp]


[exbacklay]
[hsimage on="center" who="erin" body="1_6" face="face1/13" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
ご自分の創作に活かしていただければ幸いに思います。[xp]

[beginstory]
お疲れ様でした！[xp]

;===============================================================================
; シーン終了
*scene-end

[screturn][s]

