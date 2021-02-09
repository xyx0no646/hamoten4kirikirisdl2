;===============================================================================
; 文字表示関連マクロ設定
;
; サブルーチンとしてコールすること
;===============================================================================

*begin

;-------------------------------------------------------------------------------
; 会話ウィンドウを裏に準備
[macro name="prep_speaker"]
	[if exp="kag.fore.messages.count < 3"]
		[laycount messages="3"]
	[endif]
	[position layer="&f.mainMessageLayer" page="%page|back" frame="%type|bltalk" width="800" height="188" opacity="255" marginl="55" margint="55" marginr="%marginr|200" marginb="30" left="0" top="398" visible="%visible|true"]
	[position layer="&f.mainNameLayer" page="%page|back" frame="" color="0x000000" opacity="0" width="570" height="188" marginl="0" margint="0" marginr="0" marginb="0" left="55" top="412" visible="%visible|true"]
	[layopt layer="&f.mainMessageLayer" page="%page|back" visible="%visible|true" opacity="255"]
	[layopt layer="&f.mainNameLayer" page="%page|back" visible="%visible|true" opacity="255"]
[endmacro]

;-------------------------------------------------------------------------------
; 会話開始
[macro name="start_speak"]
	[current layer="&f.mainMessageLayer"]
	[if exp="f.fspcinemamode"]
		[cinemaer]
	[else]
		[er]
		[font color="0x000000"]
	[endif]
	[style align="left"]
	[delay speed="user"]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウ表示
[macro name="show_speaker"]
	[if exp="kag.fore.messages.count < f.mainMessageLayer + 1"]
		[laycount messages="&f.mainNameLayer"]
	[endif]
	[wait time="200"]
	[exbacklay]
	[position layer="&f.mainMessageLayer" page="back" frame="%type|bltalk" width="800" height="188" opacity="255" marginl="55" margint="47" marginr="%marginr|200" marginb="30" left="0" top="398" visible="true"]
	[position layer="&f.mainNameLayer" page="back" frame="" color="0x000000" opacity="0" width="570" height="100" marginl="0" margint="0" marginr="0" marginb="0" left="55" top="412" visible="true"]
	[layopt layer="&f.mainMessageLayer" page="back" visible="true" opacity="255"]
	[layopt layer="&f.mainNameLayer" page="back" visible="true" opacity="255"]
	[trans method="crossfade" time="300"][xwt]
	[start_speak]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウ変更
[macro name="change_speaker"]
	[cm]
	[position layer="&f.mainMessageLayer" page="%page|back" visible="true" frame="%type|bltalk" marginl="%marginl|55" margint="%margint|47" marginr="%marginr|200" marginb="0"]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウを隠す
[macro name="hide_speaker"]
	[if exp="kag.fore.messages.count > f.mainMessageLayer.substr(7)"]
		[wait time="200"]
		[er]
		[exbacklay]
		[position layer="&f.mainMessageLayer" page="back" frame="blbase" visible="false"]
		[position layer="&f.mainNameLayer" page="back" visible="false" cond="kag.fore.messages.count > f.mainNameLayer.substr(7)"]
		[trans_scene time="%time|300"][xwt]
		[wait time="200"]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウに名前を表示
[macro name="blname"]
	[if exp="f.fspcinemamode"]
		[delay speed="nowait"]
		[emb exp="mp.name + '：'" cond="mp.name != ''"]
		[delay speed="user"]
		[indent]
	[else]
		[current layer="&f.mainNameLayer"]
		[delay speed="nowait"]
		[emb exp="mp.name + '：'" cond="mp.name != ''"]
		[delay speed="user"]
		[current layer="&f.mainMessageLayer"]
		[wait time="150"]
		[indent]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウ等を初期化
[macro name="init_persons"]
	[hide_speaker time="10"]
	[hsclear on="lead"]
	[hsclear on="left"]
	[hsclear on="right"]
	[hsclear on="center"]
	[hsoption on="lead" left="&MBGraphicPref.leadStdX" top="&MBGraphicPref.leadStdY" index="&MBLayerAbs.chlLead" opacity="255"]
	[hsoption on="left" left="&MBGraphicPref.chOnLeftX" top="&MBGraphicPref.chOnLeftY" index="&MBLayerAbs.chlLeft" opacity="255"]
	[hsoption on="right" left="&MBGraphicPref.chOnRightX" top="&MBGraphicPref.chOnRightY" index="&MBLayerAbs.chlRight" opacity="255"]
	[hsoption on="center" left="&MBGraphicPref.chOnCenterX" top="&MBGraphicPref.chOnRightY" index="&MBLayerAbs.chlCenter" opacity="255"]
[endmacro]

;-------------------------------------------------------------------------------
; 拡張ページ送り
[macro name="xp"]
	[qsstate visible="true" enabled="true"]
	[p]
	[label cond="!MBSystemPref.withoutAutoLabel"]
	[if exp="f.fspcinemamode"]
		[endindent]
		[cinemaer]
	[else]
		[cm]
		[endindent]
	[endif]
[endmacro]

;------------------------------------------------------------------------------
; 拡張行送り
[macro name="xl"]
	[l cond="kag.chSpeed > 0"]
[endmacro]

;------------------------------------------------------------------------------
; 改行付き拡張行送り
[macro name="lr"]
	[xl][r]
[endmacro]

;------------------------------------------------------------------------------
; シネマットを準備する
[macro name="prepcinema"]
	[hsoption on="lead" left="&MBGraphicPref.leadStdX" top="&MBGraphicPref.leadStdY" index="&MBLayerAbs.chlLead" opacity="255"]
	[hsoption on="left" left="&MBGraphicPref.chOnLeftX" top="&MBGraphicPref.chOnLeftY" index="&MBLayerAbs.chlLeft" opacity="255"]
	[hsoption on="right" left="&MBGraphicPref.chOnRightX" top="&MBGraphicPref.chOnLeftY" index="&MBLayerAbs.chlRight" opacity="255"]
	[hsoption on="center" left="&MBGraphicPref.chOnCenterX" top="&MBGraphicPref.chOnCenterY" index="&MBLayerAbs.chlCenter" opacity="255"]
	[laycount layers="5" messages="2"]
	[image layer="0" page="fore" storage="clearmat"]
	[image layer="1" page="fore" storage="clearmat"]
	[image layer="2" page="fore" storage="clearmat"]
	[image layer="3" page="fore" storage="clearmat"]
	[image layer="4" page="fore" storage="clearmat"]
	[layopt layer="0" page="fore" width="800" height="600" left="0" top="0" visible="true" opacity="255"]
	[layopt layer="1" page="fore" width="800" height="600" left="0" top="0" visible="true" opacity="255"]
	[layopt layer="2" page="fore" width="800" height="600" left="0" top="0" visible="true" opacity="255"]
	[layopt layer="3" page="fore" width="800" height="600" left="0" top="0" visible="true" opacity="255"]
	[layopt layer="4" page="fore" width="800" height="600" left="0" top="0" visible="true" opacity="255"]
	[current layer="&f.mainMessageLayer"]
[endmacro]

;-------------------------------------------------------------------------------
; 標準シネマットの表示を開始
; このマクロはprepcinemaの後に呼ばれなければなりません。
[macro name="startcinema"]
	[cinemat layer="back" left="%left|0" top="%top|50" width="%width|800" height="%height|400"]
	[position layer="&f.mainMessageLayer" page="back" visible="true" width="%twidth|664" height="%theight|145" left="%tleft|84" top="%ttop|470" marginl="0" margint="0" marginr="32" marginb="0" frame="" opacity="0"]
	[eval exp="f.fspcinemamode = true;"]
[endmacro]

;-------------------------------------------------------------------------------
; 全画面シネマットの表示を開始
[macro name="startcinema_15lines"]
	[startcinema width="0" height="0" ttop="50" theight="500"]
[endmacro]

;-------------------------------------------------------------------------------
; ちょっと広めのシネマットの表示を開始
[macro name="startcinema_6lines"]
	[startcinema top="20" height="300" ttop="360" theight="220"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマットだがシネマットの表示をしない
; （最初にイラストを見せてからbeginstoryするときなどに使う）
[macro name="startcinema_0lines"]
	[startcinema top="0" left="0" width="800" height="600"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマットを透明にする
[macro name="set_tpcinema"]
	[setcinematcolor color="&MBColors.cinemat.mask_tp"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマットを半透明黒にする
[macro name="set_blackcinema"]
	[setcinematcolor color="&MBColors.cinemat.mask"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマット中に会話字幕を開始
[macro name="begintalk"]
	[exbacklay]
	[startcinema top="0" height="470" ttop="500" theight="220"]
	[if exp="mp.type == 'up'"]
		[trans method="universal" rule="wipe_bt" vague="128" time="300"][xwt]
	[else]
		[trans method="universal" rule="wipe_tb" vague="128" time="300"][xwt]
	[endif]
	[wait time="200"]
	[cinemaer]
[endmacro]

;-------------------------------------------------------------------------------
; シネマット中に本文字幕を開始
[macro name="beginstory"]
	[exbacklay]
	[startcinema_15lines]
	[if exp="mp.type == 'down'"]
		[trans method="universal" rule="wipe_tb" vague="128" time="300"][xwt]
	[else]
		[trans method="universal" rule="wipe_bt" vague="128" time="300"][xwt]
	[endif]
	[wait time="200"]
	[cinemaer]
[endmacro]

;-------------------------------------------------------------------------------
; シネマット中にイベントCGを見せるときに使う（マットを消す）
[macro name="beginpict"]
	[exbacklay]
	[startcinema_0lines]
	[trans method="universal" rule="wipe_tb" vague="128" time="300"]
	[xwt]
	[wait time="200"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマットの表示を終了
[macro name="endcinema"]
	[eval exp="f.fspcinemamode = false;"]
	[cinemaer]
	[layopt layer="0" page="fore" left="0" top="0" opacity="255" index="1000"]
	[layopt layer="0" page="back" left="0" top="0" opacity="255" index="1000"]
	[freeimage layer="0" page="fore"][freeimage layer="0" page="back"]
	[freeimage layer="1" page="fore"][freeimage layer="1" page="back"]
	[prep_speaker type="blbase" page="fore" visible="false"]
	[laycount layers="2"]
	[cinemat op="clear" layer="fore"]
[endmacro]

;-------------------------------------------------------------------------------
; シネマットモード中の拡張er
[macro name="cinemaer"]
	[er]
	[font color="0xffffff" size="%size|default" edge="true"]
[endmacro]

;-------------------------------------------------------------------------------
; 選択肢ウィンドウを準備する
[macro name="prepare_selection"]
	[label cond="!MBSystemPref.withoutAutoLabel"]
	[cm]
	[history output="false"]
	[position layer="message0" page="fore" frame="selectpanel" opacity="255" width="467" height="282" marginl="70" margint="20" marginr=46" marginb="20"]
	[layopt layer="message0" page="fore" visible="true" left="166" top="-282" opacity="0"]
	[current layer="message0"]
	[er]
	[font color="0xffffff"]
	[delay speed="nowait"]
	[layopt layer="message0" index="&MBLayerAbs.selection"]
[endmacro]

;-------------------------------------------------------------------------------
; 選択肢をつくる
[macro name="exlink"]
	[link storage="%storage" target="%target" onenter="sndfunc.seSelect();" exp="sndfunc.seDecide();"]▼[emb exp="mp.text"][endlink]
[endmacro]

;-------------------------------------------------------------------------------
; 選択肢ウィンドウを表示
[macro name="show_selection"]
	[eval exp="kag.fore.base.cursorX=540; kag.fore.base.cursorY=180;"]
	[clickskip enabled="false"]
	[move layer="message0" page="fore" path="(166,93,255)" accel="-2" time="200"][wm]
	[clickskip enabled="true"]
	[eval exp="f.AfterSelection = true;"]
[endmacro]

;-------------------------------------------------------------------------------
; 選択肢ウィンドウを隠す
[macro name="hide_selection"]
	[call storage="commonfunc.ks" target="*hide_selection"]
	[start_speak]
[endmacro]

[return]
