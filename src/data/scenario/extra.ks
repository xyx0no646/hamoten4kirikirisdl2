;===============================================================================
; extra.ks
;
; エクストラモード
; この画面では「タイトルに戻る」を付ける・・・？
;===============================================================================

*extra|extra
[exbacklay]
[current layer="message0" page="back"]
[bgimage storage="extra_bg"]
[position layer="message0" page="back" left="0" top="0" width="800" height="600" frame="" color="0x000000" opacity="0" marginl="0" margint="0" marginr="0" marginb="0" visible="true"]
[layopt layer="message0" page="back" opacity="255"]

[delay speed="nowait"]

[call target="*placeButtons"]

[bcimage storage="clearmat"]
[trans_scene]

[current layer="message0" page="fore"]
[delay speed="user"]

[s]

;-------------------------------------------------------------------------------
; CG鑑賞

*cgview
[exbacklay]
[bgimage storage="cgview_bg"]
[position layer="message0" page="back" visible="false"]
[trans_change]
[iscript]
	CGViewer.init();
[endscript]
*internal_cgview
[eval exp="SystemManager.strContextMenuType = 'default'"]
[iscript]
	CGViewer.show();
[endscript]
[waittrig name="end_contextmenu"]
; マップからフレームを表示する場合
[if exp="CGViewer.isGoing"]
	[eval exp="SystemManager.strContextMenuType = 'cgview'"]
	[eval exp="CGViewer.isGoing = false"]
	[jump storage="cgview.ks" target="*init"]
[else]
	[exbacklay]
	[bgimage storage="extra_bg"]
	[trans_scene time="500"]
	
	[call target="*showbuttons"]
[endif]
[s]


;-------------------------------------------------------------------------------
; エンディング回想

*edview
[exbacklay]
[bgimage storage="endlist_bg"]
[position layer="message0" page="back" visible="false"]
[trans_change]
[jump storage="endlist.ks"]
[s]

*edview_rp
[call target="*showbuttons"]
[s]


;-------------------------------------------------------------------------------
; 終了（タイトルに戻る）

*finish
[exbacklay]
[bgimage storage="blackmat"]
[bcimage storage="blackmat"]
[trans_scene]

[clearvar]
[eval exp="Scripts.execStorage('system_mb/init/setMBEnvs.tjs')"]
[eval exp="init_xmbenv()"]

[cm]
[explaybgm storage="title"]
[jump storage="title.ks" target="*from_loader"]
[s]


;-------------------------------------------------------------------------------
; サブルーチン

*clearbuttons
	[exbacklay]
	[position layer="message0" page="back" visible="false"]
	[trans_change]
[return]

*showbuttons
	[exbacklay]
	[bgimage storage="extra_bg"]
	[position layer="message0" page="back" left="0" top="0" width="800" height="600" frame="" color="0x000000" opacity="0" marginl="0" margint="0" marginr="0" marginb="0" visible="true"]
	[layopt layer="message0" page="back" opacity="255"]
	[current layer="message0" page="back"]
	
	[call target="*placeButtons"]
	
	[trans_change]
	
	[current layer="message0" page="fore"]
[return]

*placeButtons
	; CG鑑賞 200
	[locate x="300" y="200"]
	[exbutton graphic="extra/bt_cg" target="*cgview"]
	
	; エンディング回想 280
	[locate x="300" y="280"]
	[exbutton graphic="extra/bt_ed" target="*edview"]
	
	; 戻る
	[locate x="20" y="543"]
	[exbutton graphic="bt_return_dark" target="*finish"]
[return]
