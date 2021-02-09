;===============================================================================
; endlist.ks
;
; エンディングリスト
;===============================================================================

*liststart
[eval exp="delete f.isFromExtraMenu"]
[eval exp="SystemManager.strContextMenuType = 'default'"]

[exbacklay]
[current layer="message0" page="back"]
[bgimage storage="endlist_bg"]
[position layer="message0" page="back" left="0" top="0" width="800" height="600" frame="" color="0x000000" opacity="0" marginl="0" margint="0" marginr="0" marginb="0" visible="true"]
[layopt layer="message0" page="back" opacity="255"]
[position layer="message1" page="back" frame="" opacity="0"]

[delay speed="nowait"]

; 以下エンディングリスト
; locateのyを50ずつ増やすと丁度良さげです
[locate x="170" y="80"]
[show_endlistitem id="1" number="1" title="エンディング１" hint="何か説明を入れるならここに"]

[locate x="170" y="130"]
[show_endlistitem id="2" number="2" title="エンディング２"]

; 戻る
[locate x="20" y="533"]
[exbutton graphic="bt_return_dark" target="*finish"]

[bcimage storage="clearmat"]
[trans_scene time="500"]

[current layer="message0" page="fore"]
[delay speed="user"]

[s]


;-------------------------------------------------------------------------------
;

*replay_ed
[exbacklay]
[bcimage storage="blackmat"]
[trans_scene]

[cm]
[freeimage layer="0"]
[eval exp="f.isFromExtraMenu = true;"]
[eval exp="SystemManager.strContextMenuType = 'endlist';"]

[scenejump storage="_extra_ending.ks"]
[s]

;-------------------------------------------------------------------------------
; エクストラメニューへ戻る

*finish
[cm]
[exbacklay]
[bgimage storage="extra_bg"]
[image layer="0" page="back" storage="clearmat"]
[trans_scene time="500"]

[jump storage="extra.ks" target="*edview_rp"]
[s]

;===============================================================================
; 
