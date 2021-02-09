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
;このひな形では立ち絵が立った状態でスタートします。立たせる立ち絵の指定をします。
[exbacklay]
[bgimage storage="samplebg"]
[hsimage on="lead" who="margot" body="1_2" face="face1/11" exp1="exp1/01"]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01"]
[bcimage storage="clearmat"]
[trans_scene]

;流すBGMを指定。「anxious_mini」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="anxious_mini"]

[wait time="500"]
[start_speak]

;会話ウインドウモードで開始します。
;台詞用マットで開始。
;ちなみに人物が立っていてかつモノローグ用マットの時は[show_speaker_mono]です。
[show_speaker]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

[blname name="マーゴット"]
はい、移動してきました。[xp]

[exbacklay]
[hsimage on="center" who="erin" body="1_5" face="face1/12" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
立ち絵の差し替えや移動などの方法は、別のひな形に解説があります。[xp]

;会話でない（モノローグなど）のとき
[exbacklay]
[change_speaker_mono]
[trans_change]

そんなわけで、このひな形では、ADVモードとシネマットモードの切り替えをやってみます。[xp]

あまり使うことは無いかもしれませんが、シーンの途中で表示形式を切り替えたいときにお使いください。[xp]

;------------------------------------------------------------------------
;いったん暗転
[exbacklay]
[bcimage storage="blackmat"]
[trans_wipe]

;シネマットモードではじめます。
[prepcinema]

;立ち絵はリセットしておく
[init_persons]

;モードを変えて再開します。
[exbacklay]
[startcinema_0lines]
[bcimage storage="clearmat"]
[bgimage storage="samplebg"]
[trans_scene]

[wait time="500"]
[start_speak]
;------------------------------------------------------------------------

[beginstory]
はい、モードが変わりました。[xp]

こちらでの演出方法は、他のひな形と一緒ですので、ここでは割愛しますね。[xp]

あ、そういえば、立ち絵の演出で、ひとつ説明をし忘れていました。[xp]

背景の色合いに合わせたりするのに使えるマットの使い方です。[xp]

まず、立ち絵を呼び出してみます。

[exbacklay]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01"]
[trans_summon]

[begintalk]
[blname name="エリン"]
はい。[xp]

[beginstory]
この状態で違和感は無いですが、背景を夕方にしてみます。[xp]

;シネマットが邪魔なので消します。
[beginpict]

;背景を入れ替えます。
[exbacklay]
[bgimage storage="samplebg3"]
[trans_scene]


[begintalk]
[blname name="エリン"]
……変でしょうか？[xp]

[beginstory]
変ではありませんが、演出上こういうことをやりたいなと思うときもあります。[xp]

[beginpict]

;夕暮れになじませるために、立ち絵に「mat」属性を追加します。
;matの中には「fgimage」ディレクトリ直下に置いてある、立ち絵ファイルと同じサイズの画像を
;乗算で立ち絵の上にのせてくれます。
[exbacklay]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01" mat="sunset"]
[trans_change]

[begintalk]
[blname name="エリン"]
こうでしょうか。[xp]

[beginstory]
立ち絵に「mat」という属性を追加することによって、表示する立ち絵の一番上に、乗算で画像を
重ねることができます。[xp]

必須ではないですが、シネマットモードと合わせて使うと、少し一枚絵っぽい雰囲気になりますね。[xp]

他にも……[xp]

;シネマットが邪魔なので消します。
[beginpict]

;背景を入れ替えます。
[exbacklay]
[bgimage storage="samplebg4"]
[trans_scene]

;夜マット
[exbacklay]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01" mat="night"]
[trans_change]

[begintalk]
[blname name="エリン"]
夜になりました。[xp]

[beginstory]
鱧天に同梱されてあるマットのファイルは、素材として自由にご利用ください。[xp]

というわけで、今度はシネマットモードからADV形式に移行しましょう。[xp]


;------------------------------------------------------------------------
;いったん暗転
[exbacklay]
[bcimage storage="blackmat"]
[trans_wipe]

;シネマットモードを終わります。
[endcinema]

;立ち絵はリセットしておく
[init_persons]

;モードを変えて再開します。
[exbacklay]
[bcimage storage="clearmat"]
[bgimage storage="samplebg"]
[hsimage on="center" who="erin" body="1_5" face="face1/10" exp1="exp1/01"]
[hsimage on="lead" who="margot" body="1_2" face="face1/11" exp1="exp1/01"]
[trans_wipe]

[wait time="500"]
[start_speak]

;会話ウインドウモードで開始します。
[show_speaker]
;------------------------------------------------------------------------

[blname name="マーゴット"]
こんな感じですね。[xp]

[blname name="エリン"]
必要に応じて、コピペしてご利用ください。[xp]

;会話でない（モノローグなど）のとき
[exbacklay]
[change_speaker_mono]
[trans_change]

そんなわけで、ADV形式の表示モードの解説はだいたいこんな感じです。[xp]

;人が喋るとき
[exbacklay]
[change_speaker]
[trans_change]

[blname name="マーゴット"]
ぜひ、活用してみてくださいね！[xp]

[blname name="マーゴット"]
では、このルートはこの先エンディングです！[xp]


;===============================================================================
; シーン終了
*scene-end

; 次のシーンを指定
[eval exp="f.nextscene = 'ending/2.ks'"]

[screturn][s]

