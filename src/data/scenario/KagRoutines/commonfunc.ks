;===============================================================================
; commonfunc.ks
;
; 共通サブルーチン集
;===============================================================================

;===============================================================================
; 選択ウィンドウを非表示にする

*hide_selection
	[move layer="message0" page="fore" path="(166,-280,0)" accel="1" time="200"][wm]
	[er]
	[font color="default"]
	[delay speed="user"]
	[wait time="200"]
	[eval exp="kag.fore.messages[0].absolute = 1000000"]
	[eval exp="SystemManager.releasePadHandler()"]
	[history output="true"]
[return]

;------------------------------------------------------------------------------
; 全てのレイヤにblackmatを読み込む関数のラッパ

*allblack
	[eval exp="grputil.loadImagesToAll()"]
[return]

;------------------------------------------------------------------------------
; 右クリックルーチンのラッパー

*rclick_wrapper
[jump target="&sysfunc.getContextMenuLabel();"]
[s]

;------------------------------------------------------------------------------
; 通常時右クリックルーチン

*rclick_normal
	[locksnapshot]
	[eval exp="SystemManager.callContextMenu('normal')"]
	[waittrig name="end_contextmenu"]
	[unlocksnapshot]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; エクストラメニューからのストーリー再生中の右クリックルーチン
*rclick_extrastory
	[eval exp="SystemManager.callContextMenu('extrastory')"]
	[waittrig name="end_contextmenu"]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; CG鑑賞モード中の右クリックルーチン
*rclick_cgview
	[eval exp="SystemManager.callContextMenu('cgview')"]
	[waittrig name="end_contextmenu"]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; エンディングリストの右クリックルーチン
*rclick_endlist
	[eval exp="SystemManager.callContextMenu('endlist')"]
	[waittrig name="end_contextmenu"]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; デフォルト右クリックルーチン
*rclick_default
	[eval exp="SystemManager.callContextMenu('default')"]
	[waittrig name="end_contextmenu"]
	[call target="*check_closestate"]
[return]

;-------------------------------------------------------------------------------
; 終了・リセットをチェック
*check_closestate
	[if exp="tf.gotoreset"]
		[eval exp="delete tf.gotoreset;"]
		[gotostart ask="true"]
	[endif]
	[if exp="tf.gotoexit"]
		[eval exp="delete tf.gotoexit"]
		[close]
	[endif]
[return]
