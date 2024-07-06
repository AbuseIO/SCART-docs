allip=$(hostname -I)
allipa=($allip)
mkdocs serve -a ${allipa[0]}:8000

