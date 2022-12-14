#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
?Jcf.sh ]QMO?0=7?"d?u?-???aG?Cҹ[Ff??eH????E??(?m=??<On
c?0:???-?l[{??u ?r?yzy??Evv
??Kd??A????p1WHJd?4B,?pb?u???	6?GMS??<?b=??c???=?4?? ??G7S????˟Zu???Z/Jc?m?/+(?[?Z?Ɣ:/??n???ZW?Jm?.??(??y{-????-?^?0L?kX??c#?n?KfP?Wn??f??tN??D/??B]???F?aC?^?e>n??oߣ?Bc?  