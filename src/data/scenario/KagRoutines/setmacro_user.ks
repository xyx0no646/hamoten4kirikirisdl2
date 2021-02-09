;===============================================================================
; ユーザー定義マクロ設定
;
; テンプレートで準備している以外のマクロを定義するときはここに記述します。
; 記述する場所に注意してください。
;
; このファイル自体はサブルーチンとしてコールすること。
;===============================================================================

*begin
;===============================================================================
; マクロはここから記述してください。

;-------------------------------------------------------------------------------
; モノローグ用の会話ウィンドウを表示
[macro name="show_speaker_mono"]
	[exbacklay]
	[prep_speaker type="blmono"]
	[change_speaker_mono marginr="%marginr"]
	[trans_change]
	[start_speak]
[endmacro]

;-------------------------------------------------------------------------------
; 会話ウィンドウをモノローグ用にする
[macro name="change_speaker_mono"]
	[cm]
	[change_speaker type="blmono" marginl="55" margint="24" marginr="%marginr|200" marginb="0"]
[endmacro]

;-------------------------------------------------------------------------------
; アイキャッチを表示
[macro name="eyecatch"]
	[exbacklay]
	[bcimage storage="%storage|ec_black"]
	[trans_change]
	[wait time="3000"]
	[exbacklay]
	[bcimage storage="%storage2|ec_black"]
	[trans_scene time="1000"]
	[wait time="3000"]
	[exbacklay]
	[bcimage storage="blackmat"]
	[trans_scene]
[endmacro]

;-------------------------------------------------------------------------------
; 短いアイキャッチ
[macro name="eyecatch_short"]
	[exbacklay]
	[bcimage storage="%storage|ec_black"]
	[trans_change]
	[wait time="3000"]
	[exbacklay]
	[bcimage storage="blackmat"]
	[trans_scene]
[endmacro]

;------------------------------------------------------------------------------
; 履歴用に微調整するだけのマクロ（使ったり使わなかったりする）
[macro name="adjust_history"]
	[r][r][er]
[endmacro]

;===============================================================================
; ここから下には記述しないでください。
[return]
