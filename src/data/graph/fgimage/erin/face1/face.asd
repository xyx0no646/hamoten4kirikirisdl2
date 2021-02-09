@loadcell storage=&(grputil.getFaceFile('erin'))
@loop
;
@macro name=copyone
@copy dx=257 dy=32 sx=%x sy=0 sw=100 sh=100
@wait time=90
@endmacro
;
[jump target="*no_mepachi" cond="!sf.userconfig.winkEnabled"]
*start
@copyone x=0
[wait time="&(Math.random() * 6000)"]
@copyone x=100
@copyone x=200
@jump target=*start
;
*no_mepachi
@copyone x=0
