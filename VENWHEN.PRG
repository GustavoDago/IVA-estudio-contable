if m.modi = .f.
	STORE 0 TO m.ivageneral, m.impnetgrab, m.impnet105, m.ivanoins, m.imporfac, m.conograb, ;
	m.operexen, m.ret_ingbru, m.ret_pcta, m.ret_ingbru
endif

M.TIPO = 1

if m.consumidor = .t.
	if abonados.ef = "R.I."
		M.PRIMERO = 4
		M.ELEM = 1
	ELSE
		M.PRIMERO = 7
		M.ELEM = 1
	ENDIF
endif

if m.ticket = .t.
	M.PRIMERO = 8
	M.ELEM = 1
endif

if m.tarje = .t.
	M.PRIMERO = 9
	M.ELEM = 1
	M.SUCURSAL = "0000"
endif	

if m.retencion = .t.
	M.PRIMERO = 10
	M.ELEM = 1
endif	

if abonados.ef = "R.I."
	IF Cliente.ef = "R.I." .OR. Cliente.ef = "R.N.I."
		IF M.tarje = .f. .and. m.retencion = .f.
			M.PRIMERO = 1
			M.ELEM = 3
		ENDIF
		show get m.siniva21 disable
		show get m.impnetgrab enable
		show get m.siniva105 disable
		show get m.impnet105 enable
	ELSE
		IF M.ticket = .f. .and. m.tarje = .f. .and. m.retencion = .f.
			M.PRIMERO = 4
			M.ELEM = 3
		ENDIF
		show get m.siniva21 enable
		show get m.impnetgrab disable
		show get m.siniva105 enable
		show get m.impnet105 disable
	ENDIF
ELSE
	M.PRIMERO = 7
	M.ELEM = 1
	show get m.impnetgrab disable
	show get m.impnet105 disable
endif
SELECT CLIENTE
SCATTER MEMVAR
SELECT IVAVENTA
