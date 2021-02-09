;===============================================================================
; 鱧天シナリオファイルひな形「シネマットモードに立ち絵を立たせる」その２
;
; このファイルは必ず「*scene-start」から始まり、「*scene-end」で終わるように
; してください。
;===============================================================================
*scene-start
;シーンをはじめる準備。
;シネマットモードではじめます。
[prepcinema]

;暗幕を消してスタート。「samplebg」を任意の背景名に書き換えてください。
;このファイルではスタート時に既に立ち絵が立っているので、立ち絵を書いておきます。
[exbacklay]
[startcinema_0lines]
[bgimage storage="samplebg"]
[bcimage storage="clearmat"]
[hsimage on="right" who="erin" body="1_2" face="face1/11" exp1="exp1/01"]
[hsimage on="left" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_scene]

;流すBGMを指定。「lovely」を任意の音楽ファイル名に書き換えてください。
[explaybgm storage="lovely"]

[wait time="500"]
[start_speak]
;===============================================================================
;ここから本文エリア。タグ付本文を入れます。

[begintalk]
[blname name="マーゴット"]
このシーンでは、他によく使う表示について説明いたします。[xp]

[blname name="マーゴット"]
まずは……そうですね、イベントCGでしょうか。[xp]

[exbacklay]
[hsimage on="right" who="erin" body="1_3" face="face1/14" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
確かに……[xp]

[blname name="マーゴット"]
イベント絵というのは、こんな感じです！[xp]

;シネマットを消して全画面に絵が見えるように。
[beginpict]

;立ち絵を消してイベント絵を表示
[exbacklay]
[hsreset on="right"]
[hsreset on="left"]
[evimage storage="sample1"]
[trans_scene]

;これはウェイトで、処理を止める時間を入れます。1000で１秒です。
[wait time="1000"]

[beginstory]
鱧天でのイベントCGは「pict」フォルダに入っている画像を「evimage」で呼び出します。[xp]

イベント絵は背景よりも上に表示されますが、立ち絵があると被ってしまうので、同時に入れ替えたい場合は、立ち絵を消すタグを一緒に書くようにします。[xp]

[begintalk]
[blname name="マーゴット"]
本当は、画面サイズより大きい絵を表示させて動かす、みたいなことも出来ますのよ。[xp]

[blname name="マーゴット"]
ですが、ちょっとややこしいですし、、ここでは画面サイズ丁度のイラストにします。[xp]

;イベント絵を消去して立ち絵を表示させる
[exbacklay]
[hsimage on="right" who="erin" body="1_3" face="face1/14" exp1="exp1/01"]
[hsimage on="left" who="margot" body="1_1" face="face1/20" exp1="exp1/01"]
[evimage storage="clearmat"]
[trans_scene]


[blname name="マーゴット"]
再登場です。[xp]

[exbacklay]
[hsimage on="right" who="erin" body="1_2" face="face1/14" exp1="exp1/01"]
[trans_change]

[blname name="エリン"]
我々をただ消したいときはどうすれば？[xp]

[exbacklay]
[hsimage on="left" who="margot" body="1_1" face="face1/20" exp1="exp1/01"]
[trans_change]

[blname name="マーゴット"]
その場合は……[xp]

;立ち絵を消します。
[exbacklay]
[hsreset on="right"]
[hsreset on="left"]
[trans_summon]

[blname name="マーゴット"]
こんな感じにするか……[xp]

[exbacklay]
[hsimage on="right" who="erin" body="1_2" face="face1/14" exp1="exp1/01"]
[hsimage on="left" who="margot" body="1_1" face="face1/11" exp1="exp1/01"]
[trans_summon]


[blname name="マーゴット"]
もしくは、いったん暗転させて……[xp]

;「bcimage」は暗幕やアイキャッチ用です。メッセージよりもさらに上に表示されるので、
; 全部隠れて真っ暗になります。
[exbacklay]
[bcimage storage="blackmat"]
[trans_change]

;このタグを書くと全ての立ち絵がリセットされます。暗転中に書いてください。
[init_persons]

;シネマットも消しておいてもいいですね
[beginpict]

;暗幕を消して、戻ります。場所が移動するなどのときは背景も一緒に入れ替えてもいいです。
[exbacklay]
[bcimage storage="clearmat"]
[trans_scene]

[beginstory]
このように、いったん暗転させて立ち絵をリセットするという方法も良いですね。[lr]
雰囲気的に、画面から立ち絵が消えるよりも、ちょっと場面が一区切り付くような感じがします。[xp]

[begintalk]
[blname name="マーゴット"]
あとは、効果音を……[xp]

;効果音を鳴らします。こんな風にファイル名だけ指定するとループせず一度だけ再生されます。
[playse storage="footstep_dirt_running"]

[wait time="500"]

[blname name="エリン"]
どちらへ！？[xp]

[blname name="マーゴット"]
ふふふ、ごめんなさい。[xp]

[beginstory]
効果音は、このように一度きり再生する場合と……[lr]

[playse storage="footstep_dirt_running" loop="true"]

このように繰り返し再生することができます。[xp]

この辺は鱧天ではなくて、KAG標準の書き方ですね。[xp]

BGMや効果音は、基本的にシーンをまたぐとフェードアウトで消えるようになっています。[lr]
演出上、シーンをまたいでも音楽を流しっぱなしにしたいときは、このファイルではなく、ディレクションファイルの方で指定します。[xp]

;ループしていた効果音を止めます。
[stopse]

効果音を止めました。[xp]

このくらいのタグ演出でも、充分ゲームっぽいものが制作できると思いますので、よろしければチャレンジしてみてください。[xp]

[begintalk]
[blname name="マーゴット"]
では、この流れでBGMを流しっぱなしして、エンディングに行ってみます！[xp]


;===============================================================================
; シーン終了
*scene-end

; 次のシーンを指定
[eval exp="f.nextscene = 'ending/1.ks'"]

[screturn][s]

