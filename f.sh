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
�Y]cf.sh �RMs� ��+(k>�f4:������<vz dI�	X ~��/1������{<�����ABM�6X�}���ڕ���?6��ʀfJZ��g�����A�T�4MwAI��V#��*��[��=�pr��E��( 1j�t:{{�O�%�a�P����(`���$�#t�7�B&���q���sf7
�8�5?���+����0��VV1u�|]�1]�k��L��	e�p�j�����l󰴾��QJ9xQH#/�b�ţp�x<����(�Xj����R�͢�U��Z���Ф��4�*3��ne��{�ia�E9t[d5�r�g�$؍����C�m���� Q����/��k�T����ȍ"B�\�5s�x��o 2�  