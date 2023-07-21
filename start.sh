#!/bin/sh
skip=49

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

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�Ǳ�dstart.sh �X�o�V���.�:�U�@Ee[��X)�B�k�$ǎ�hS R��@�U$�64�m%6Vڵ�3u�~ڿ��{m�I�WK�/׊���8��~�q��H�R4aJ4�\w�T7���'+�������y8%�. �D�� �ZZ�$gsj]<��,�8���ۆ�Qx�ê��N��������͕�����_K���ܑ�c��gO������(r\�����[�eP3q�섿�GRu[N����$.`dbcZʹDUEx�x��%]951�=��r���3���<{�Ӑ��kg�wj���ÓgGǿ]�WPZ='�ډѯ�}0�M�
]���)D�̿�\{�������:៿o����t���҃w��3��'�����;,�V`�~vo��-�$��ꧭ��;/����O�&�y�T��t��y�C���&??��؟���y@2���������e��*Ml
�ha�d}FSuQo�UE�����)��E��i�(2��K6E�3M!dM`�)��]���t�Q�g�'<�0ڮ�ˢ��C�Z~&�X4rM]�
|��5'�Z'����@*��}`��U7s@���N] j��J��G-�U����R/�J+��J�^��P�I���"0��d����9��e8h���@�-�h�VR���nj)��������ckb#>�Gn��ǝ�Q�&\I��G�N7��ݼ�b��(��I���]c��h�~�]�B�]5R�7�8�y�:���J���_�W8Dkb=�NDzw��(�?�����L"�����B�٭����n����k��N6����2�[��1M���h�I���q ܠ�Ga��z�":$�xZ�lh�R�zP�W)�hGEa��i�ī]�8<߶��ID1��}[f�*H�=Xʺ!�Eנa�Q�i�ǎ�/��r����i���r�J��Ɔ��mKG���i�}���pm������T����#����Ҧ�x��|��f������g�o��L�S�#|�x�A��d2I'�1N-$�]<ʶex��H��Cs�5��(����ީ~d���p�nJ@�;�1��ն��}"L��B{����	vi��os�ߖ�W�?ݟp�F�s�(=Wa
r�:�b� ���H`v������)}A|#�W�.m� �p�����2%��HmΌd¢�d��ņ�H6�L�u:����Buo�~|����m�+�y�-�i[�,�HY,]���=}W�zI�5��𞁦����~���=�Ʃ,��W˿��D�zj�sc���� ��w��mga�Y}P~�*����p^����	�+�VU�n���b�eQS�L�<1�M�*k����&��mikB1�3�P{�h��o=Q׌�b���QL&w��h�]͝P���Im���l�yq,;��w�*�߁�%�)�LVQ1�s�޺���~��N?!����Gd(����a�Kg�V�����\e}�2��/���,�Ҝ��e^�b����P �p>rKhc�q����aRrHA�.�I�o�[�\v���޽��C��1t݇EǼ��1tCǪ$C��1t]��X�d�:���c�$C��1t��,:���cU�y��c��tܿm}D8}9  