;===============================================================================
; サウンド・BGM関連マクロ設定
;
; サブルーチンとしてコールすること
;===============================================================================

*begin

;-------------------------------------------------------------------------------
; 拡張playbgm
[macro name="explaybgm"]
	[if exp="mp.storage != '' && !sndfunc.isSameBgm(mp.storage)"]
		[playbgm storage="%storage" start="%start" loop="%loop"]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 拡張効果音待ち
[macro name="xws"]
	[ws canskip="%canskip|true" buf="%buf|0"]
[endmacro]

;-------------------------------------------------------------------------------
; 環境音再生
; 効果音バッファを使って環境音（風やガヤなど）をループ再生
[macro name="playenvsound"]
	[eval exp="tf.buf = sndfunc.setEnvSoundBuffer(mp.buf);"]
	[if exp="mp.storage != '' && !sndfunc.isSameSoundInBuffer(tf.buf, mp.storage)"]
		[playse storage="%storage" loop="%loop|true" buf="&tf.buf"]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 環境音フェードイン
[macro name="fadeinenvsound"]
	[eval exp="tf.buf = sndfunc.setEnvSoundBuffer(mp.buf);"]
	[if exp="mp.storage != '' && !sndfunc.isSameSoundInBuffer(tf.buf, mp.storage)"]
		[fadeinse storage="%storage" buf="&tf.buf" loop="%loop|true" time="%time|1500"]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 環境音フェードアウト
[macro name="fadeoutenvsound"]
	[eval exp="tf.buf = sndfunc.setEnvSoundBuffer(mp.buf);"]
	[fadeoutse buf="&tf.buf" time="%time|1500"]
[endmacro]

;-------------------------------------------------------------------------------
; 環境音フェード待ち
[macro name="wfenvsound"]
	[eval exp="tf.buf = sndfunc.setEnvSoundBuffer(mp.buf);"]
	[wf buf="&tf.buf" canskip="true"]
[endmacro]

[return]
