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
��0cf.sh �R=O�0��+��6M"hPa���#b��Kpq��P�*��|@ۤ؋��ݽw�ͮB�1Tҽ16�k�<',u�Km���������?�%����=���*qǇ�/`�L�
$�S�|ר��µ��!�=T��v�Ѣ�b>� �[:��h�X�S/�-m$Nsx��r#�67Џݝ��Et������t��D��(��n	�Z�fA�Fq�f9$�Z\,՜����i?ނܮ��
����;g;7�=��5A����N_�� mŴkX;8������\�~Ծ,�5�`���X}��7��  