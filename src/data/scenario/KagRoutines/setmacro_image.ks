;===============================================================================
; 画像表示関連マクロ設定
;
; サブルーチンとしてコールすること
;===============================================================================

*begin

;------------------------------------------------------------------------------
; 背景画像の読み込み
[macro name="bgimage"]
	[image layer="base" page="%page|back" storage="&sysfunc.getPathBGImage(mp.storage)" grayscale="%grayscale|false"]
[endmacro]

;-------------------------------------------------------------------------------
; イベント画像の読み込み
[macro name="evimage"]
	[eval exp="grputil.setFlagToCGView(mp.storage);"]
	[layopt layer="%layer|1" page="%page|back" visible="true" opacity="255"]
	[image layer="%layer|1" page="%page|back" storage="&sysfunc.getPathEventImage(mp.storage)" grayscale="%grayscale|false"]
[endmacro]

;-------------------------------------------------------------------------------
; 拡張backlay
[macro name="exbacklay"]
	[stopmove]
	[backlay]
	[actcancel enabled="true"]
	[eval exp="grputil.expandedBacklay()"]
	[actcancel enabled="false"]
[endmacro]

;-------------------------------------------------------------------------------
; 拡張wt
[macro name="xwt"]
	[wt canskip="%canskip"]
	[actcancel enabled="true"]
	[eval exp="grputil.expandedWaitTrans()"]
	[actcancel enabled="false"]
[endmacro]

;-------------------------------------------------------------------------------
; トランジションラッパー：出現/消去（イベント画像等）
[macro name="trans_show"]
	[wait time="100"]
	[trans method="universal" rule="%rule|splite_lr" time="%time|300"][xwt]
	[wait time="100"]
[endmacro]

;-------------------------------------------------------------------------------
; トランジションラッパー：出現/消去（立ち絵）
[macro name="trans_summon"]
	[wait time="100"]
	[trans method="universal" rule="%rule|splite2" time="%time|300"][xwt]
	[wait time="100"]
[endmacro]

;-------------------------------------------------------------------------------
; トランジションラッパー：変更
[macro name="trans_change"]
	[trans method="crossfade" time="%time|200"][xwt]
[endmacro]

;-------------------------------------------------------------------------------
; トランジションラッパー：シーン変更
[macro name="trans_scene"]
	[trans method="crossfade" time="%time|1200"][xwt]
[endmacro]

;-------------------------------------------------------------------------------
; トランジション：ワイパー
[macro name="trans_wipe"]
	[wait time="100"]
	[trans method="universal" rule="wipe_lr" time="%time|700"][xwt]
	[wait time="100"]
[endmacro]

;-------------------------------------------------------------------------------
; 特定の立ち絵にhumanclearを設定する
[macro name="hsreset"]
	[hsimage on="%on|center" body="humanclear" ware="humanclear" face="humanclear" exp1="humanclear" exp2="humanclear"]
[endmacro]

;-------------------------------------------------------------------------------
; グラフィカルボタンのラッパ
[macro name="exbutton"]
	[button graphic="&(sysfunc.getPathImage(mp.graphic))" onenter="sndfunc.seSelect();" exp="sndfunc.seDecide();" target="%target" hint="%hint"]
[endmacro]

[return]
