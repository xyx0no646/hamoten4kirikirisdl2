@if exp="typeof(global.autoInsertLabel_object) == 'undefined'"
@iscript
/*
	どこでもセーブプラグイン
*/
class AutoInsertLabelPlugin extends KAGPlugin
{
	var label;

	function AutoInsertLabelPlugin(window)
	{
		super.KAGPlugin();
		this.window = window;

		window.mainConductor.onLabel = function()
		{
			autoInsertLabel_object.label = 1 if !f.autoInsertLabel;
			return owner.onConductorLabel(...);
		} incontextof (window.mainConductor);

		window.onConductorAfterReturn = function()
		{
			// コンダクタが return タグを実行した後
			if(!usingExtraConductor)
			{
				setRecordLabel(conductor.curStorage, currentLabel = conductor.curLabel);
			}
			setUserSpeed();
			if(!usingExtraConductor)
			{
				if(!getCurrentRead() && skipMode != 4)
					cancelSkip(); // 未読なのでスキップを停止
			}
			autoInsertLabel_object.setCurrentLabel();
		} incontextof window;
	}

	function finalize()
	{
		super.finalize(...);
	}

	function setCurrentLabel()
	{
		label = f.autoInsertLabel_object_label;
		kag.currentLabel += ':' + label;
		kag.currentRecordName = 'trail_' + Storages.chopStorageExt(Storages.extractStorageName(kag.conductor.curStorage)) + '_' + kag.currentLabel;
		if(!kag.getCurrentRead() && kag.skipMode != 4)
			kag.cancelSkip(); // 未読なのでスキップを停止
		kag.setUserSpeed();
		label++;
		f.autoInsertLabel=false;
	}
}

kag.addPlugin(global.autoInsertLabel_object = new AutoInsertLabelPlugin(kag));

@endscript
@endif

;▼labelマクロ
@macro name="label"
@eval exp="f.autoInsertLabel=true"
@eval exp="f.autoInsertLabel_object_label = autoInsertLabel_object.label, kag.incRecordLabel(true)"
@call storage="autoInsertLabel.ks" target=*label
@endmacro

@return
;---------------------------------------
;▼どこでもセーブ用サブルーチン
*label|
@return
