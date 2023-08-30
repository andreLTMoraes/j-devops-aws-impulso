#!/bin/bash

for d in 'publico' 'adm' 'ven' 'sec'
do
  mkdir "/$d"
done

for g in 'GRP_ADM' 'GRP_VEN' 'GRP_SEC'
do
  groupadd "$g"
done

for u_adm in 'carlos' 'maria' 'joao'
do
  useradd "$u_adm" -m -c ’$u_adm Dep. Administrativo’ -g GRP_ADM -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "senha")' Adm123)
  passwd "$u_adm" -e
done

for u_ven in 'debora' 'sebastiana' 'roberto'
do
  useradd "$u_ven" -m -c ’$u_ven Dep. Vendas’ -g GRP_VEN -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "senha")' Ven123)
  passwd "$u_ven" -e
done

for u_sec in 'josefina' 'amanda' 'rogerio'
do
  useradd "$u_sec" -m -c ’$u_sec Dep. Secretariado’ -g GRP_SEC -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "senha")' Sec123)
  passwd "$u_sec" -e
done

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

chmod 777 /publico/

for d in 'adm' 'ven' 'sec'
do
  chmod 770 /"$d"/
done