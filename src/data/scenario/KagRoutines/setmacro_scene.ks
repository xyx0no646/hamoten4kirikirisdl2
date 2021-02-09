;===============================================================================
; シーンディレクション関連マクロ設定
;
; サブルーチンとしてコールすること
;===============================================================================

*begin

;------------------------------------------------------------------------------
; シーン呼び出し前の共通処理
[macro name="sceneprep"]
	[eval exp="f.AfterSelection = false;"]
	[history enabled="true" output="true"]
	[qsstate visible="true" enabled="true"]
[endmacro]

;------------------------------------------------------------------------------
; シーン終了後のほぼ共通処理
; BGMを止めたくない場合：contbgm="true"を追加する
; 環境音（バッファ1のSE）を止めたくない場合：contse="true"を追加する
; 立ち絵などをリセットしたくない場合：nolayerreset="true"を追加する
; BGMのフェードアウト時間指定：bftime="nnnn"（標準は3000ms）
; 環境音のフェードアウト時間指定：sftime="nnnn"（標準は2000ms）
; 環境音のバッファ：sbuf（標準は1）
; シーンを隠すマット指定：mat="filename"（標準はblackmat）
; 暗転までの時間：time="nnnn"（標準は2000ms）
; 一切の処理をしたくない場合：そもそも呼ばない
; 一部の処理をしたい場合：各タグを個別に記述する
[macro name="sceneout"]
	[if exp="!f.AfterSelection || mp.force == 'true'"]
		[qsstate visible="false"]
		[history output="false" enabled="false"]
		[fadeoutbgm time="%bftime|3000" cond="mp.contbgm != 'true'"]
		[fadeoutenvsound buf="%sbuf" time="%sftime|2000" cond="mp.contse != 'true'"]
		[exbacklay]
		[bcimage storage="%mat|blackmat"]
		[trans_scene time="%time|2000"]
		[wfenvsound buf="%sbuf" cond="mp.contse != 'true'"]
		[wb cond="mp.contbgm != 'true'"]
		[if exp="mp.nolayerreset != 'true'"]
			[init_persons]
			[endcinema]
		[endif]
	[endif]
[endmacro]

;-------------------------------------------------------------------------------
; 指定したシーンのディレクションファイルへ飛ぶ
[macro name="scenejump"]
	[jump storage="&(SceneManager.strDirectionPath + '/' + mp.storage)"][s]
[endmacro]

;-------------------------------------------------------------------------------
; エンディングからタイトル画面へ戻る
[macro name="scenario_over"]
	[gotostart]
[endmacro]

;-------------------------------------------------------------------------------
; 指定したエンディング回想メニューを表示する
; （エクストラモード用）
;	id     : エンディングの内部ID
;	number : エンディングの見かけ上の番号
;	title  : エンディングタイトル
;	hint   : メニューにカーソルを重ねたときに出てくる注釈
[macro name="show_endlistitem"]
	[if exp="SceneManager.checkSceneStatus(-1, mp.id)"]
		[eval exp="tf.pad = globfunc.getWideSpacesAsPad(MBContPref.EndTitleMaxLength, mp.title);"]
		[eval exp="globfunc.generateEndingItemLinkForExtra(mp);"]END[emb exp="mp.number"]　「[emb exp="mp.title"]」[emb exp="tf.pad"][endlink]
	[else]
		END[emb exp="mp.number"]　「？？？？」
	[endif]
[endmacro]

[return]
