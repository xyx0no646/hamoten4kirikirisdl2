@loadcell storage=&(grputil.getFaceFile('erin'))
@loop
;
@macro name=copyone
@copy dx=142 dy=85 sx=%x sy=0 sw=200 sh=200
@wait time=90
@endmacro
;
[jump target="*no_mepachi" cond="!sf.userconfig.winkEnabled"]
*start
@copyone x=0
[wait time="&(Math.random() * 6000)"]
@copyone x=200
@copyone x=400
@jump target=*start
;
*no_mepachi
@copyone x=0
