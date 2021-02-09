;===============================================================================
; 鱧天シナリオファイルひな形「シネマットモードに立ち絵を立たせる」
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

;暗幕を消してスタート。「samplebg」を任意の背景名に書き換えてください。
[exbacklay]
[startcinema_0lines]
[bgimage storage="samplebg"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「anxious_mini」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="anxious_mini"]

[wait time="500"]
[start_speak]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

[begintalk]
[blname name="二月ほづみ"]
移動してきました。[xp]

[blname name="二月ほづみ"]
このファイルでは、シネマットモードに立ち絵を立たせます。[xp]


[blname name="二月ほづみ"]
あっ、私に立ち絵が無いので、ここからは交代しますね。[xp]


;立ち絵登場。登場するときはトランジションを「summon」にします。
[exbacklay]
[hsimage on="center" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_summon]

[blname name="マーゴット"]
ここから説明を担当させていただきます。[lr]
よろしくお願いしますね。[xp]

[beginstory]
鱧天での立ち絵は、仕様に沿って画像を用意した上で、独自のマクロで呼び出して使います。[lr]
画像は「身体」「表情」「前髪」「追加部品（眼鏡、表情記号など）」「マット（時間帯ごとの色調整）」で構成されます。[xp]

また、表情にはあらかじめ目パチが組み込まれていますが、デフォルトでは目パチオフになっています。[lr]
瞬きさせる場合は、右クリックメニューの環境設定で変更してみてください。[xp]

;立ち絵の表情を変えます。「face」の項目から表情番号を変えます。
;トランジションはパッと早く変化する「change」が良いでしょう。


[begintalk]

[exbacklay]
[hsimage on="center" who="margot" body="1_1" face="face1/20" exp1="exp1/01"]
[trans_change]

[blname name="マーゴット"]
こんな感じです。[xp]

[beginstory]
立ち絵を立たせることが出来る場所は、今マーゴットが立っている真ん中の他に、左と右があります。[xp]

[begintalk]

;立ち絵を移動させるときは、前に立っている場所の立ち絵を「hsreset」で消します。
[exbacklay]
[hsreset on="center"]
[hsimage on="right" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_summon]

[blname name="マーゴット"]
こんな感じで。[xp]


[exbacklay]
[hsreset on="right"]
[hsimage on="left" who="margot" body="1_1" face="face1/21" exp1="exp1/01"]
[trans_summon]

[blname name="マーゴット"]
こうですね。[xp]

[exbacklay]
[hsimage on="left" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_change]

[blname name="マーゴット"]
ポーズも変えられるんですが、あいにく、わたくしのこの身体は差分が無くて動かないので……[xp]

[blname name="マーゴット"]
エリンを呼びます。[xp]

[blname name="マーゴット"]
エリン〜。[xp]

[exbacklay]
[hsimage on="right" who="erin" body="1_1" face="face1/10" exp1="exp1/01"]
[trans_summon]

[blname name="エリン"]
お呼びでしょうか。[xp]

[blname name="マーゴット"]
動いてみて。[xp]

;「body」の中身を変更するとポーズが変化します。
[exbacklay]
[hsimage on="right" who="erin" body="1_2" face="face1/14" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
はい？[xp]

[beginstory]
ポーズ差分は「body」の項目を変更して変化させます。[lr]
表情が共通の場合は、ここだけで良いのですが、身体の向きを変えるなど、表情が
別パターンになる場合は、「face」「exp1」の中身も書き換えます。[xp]

;身体の向きが変わる場合は、「body」「face」「exp1」を全部書き換えます。
[exbacklay]
[hsimage on="right" who="erin" body="2_1" face="face2/14" exp1="exp1/02"]
[trans_change]

[blname name="エリン"]
こうでしょうか。[xp]

[exbacklay]
[hsimage on="left" who="margot" body="1_1" face="face1/20" exp1="exp1/01"]
[trans_change]

[blname name="マーゴット"]
よくできました！[xp]

[beginstory]
立ち絵の変化は、ちょこちょこと設定を変える箇所がありますが、一度ファイル構成が頭に入ると
やりやすいと思います。[xp]

[begintalk]
[blname name="マーゴット"]
次のシーンでは、あと少しよく使う演出を説明しますね。[xp]

;===============================================================================
; シーン終了
*scene-end

; 次のシーンを指定
[eval exp="f.nextscene = 'chapter1/5.ks'"]

[screturn][s]

