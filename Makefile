install: calc_ui-es.mo
	install calc calc_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat calc.services`" /etc/services || cat calc.services >> /etc/services
	install calc.xinetd /etc/xinetd.d/calc
	ln -sf /usr/local/bin/calc_ui /usr/local/bin/ncalc_ui
	install calc_ui-es.mo /usr/share/locale/es/LC_MESSAGES/calc_ui.mo

calc_ui.pot: calc_ui
	xgettext -o calc_ui.pot -L Shell calc_ui

calc_ui-es.mo: calc_ui-es.po
	msgfmt -o calc_ui-es.mo calc_ui-es.po

clone:
	https://github.com/giguerra25/calc_examples.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
