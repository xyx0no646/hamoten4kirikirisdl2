;===============================================================================
; END1「エンディング名」
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

;暗幕を消してスタート。「blackmat」を任意の背景名に書き換えてください。
[exbacklay]
[startcinema_0lines]
[bgimage storage="blackmat"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「anxious_mini」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="anxious_mini"]

[wait time="500"]
[start_speak]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

[beginstory]
そういった訳でエンディングです。[lr]
エンディングも、書き方は普通のシナリオファイルと同じです。[lr]
このエンディングは、前のシナリオからBGMを流しっぱなしで設定していますので、
準備部分にある音楽指定は無くても大丈夫です。[xp]

[beginpict]

[exbacklay]
[bgimage storage="samplebg"]
[hsimage on="right" who="erin" body="1_2" face="face1/11" exp1="exp1/01"]
[hsimage on="left" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_scene]


[exbacklay]
[hsimage on="left" who="margot" body="1_1" face="face1/20" exp1="exp1/01"]
[trans_change]

[blname name="マーゴット"]
鱧天チュートリアルをお読みくださり、ありがとうございました！[xp]


[exbacklay]
[hsimage on="right" who="erin" body="1_2" face="face1/14" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
ご自分の創作に活かしていただければ幸いに思います。[xp]

[beginstory]
お疲れ様でした！[xp]

;===============================================================================
; シーン終了
*scene-end

[screturn][s]

