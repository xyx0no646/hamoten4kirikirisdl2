@loadcell
@loop
;
@macro name=copyone
@copy dx=0 dy=0 sx=0 sy=%y sw=102 sh=40
@wait time=100
@endmacro
;
*start
@copyone y=0
@copyone y=40
@copyone y=80
@copyone y=120
@copyone y=160
@copyone y=200
@copyone y=240
@copyone y=280
@copyone y=320
@copyone y=360
@copyone y=400
@copyone y=360
@copyone y=320
@copyone y=240
@copyone y=200
@copyone y=160
@copyone y=120
@copyone y=80
@copyone y=40
@jump target=*start

