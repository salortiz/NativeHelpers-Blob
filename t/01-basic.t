use v6;
use Test;
use NativeCall;

{
    use-ok 'NativeHelpers::Blob';
}
use NativeHelpers::Blob;

my $a = 'Hola a todos'.encode;
isa-ok $a, utf8;

ok (my $au = carray-from-blob($a)),	'carray from blob';
isa-ok $au, CArray;
dies-ok { $au.elems },			'Can´t get size';
ok not carray-is-managed($au),		'Not managed';

ok my $am = carray-from-blob($a):managed, 'c-f-b managed';
isa-ok $am, CArray;
ok so carray-is-managed($am),		'Is managed';
ok $am.elems == 12,			'Correct size';

ok $am.list eqv (72, 111, 108, 97, 32, 97, 32, 116, 111, 100, 111, 115), 
					'Elems match';

my $bu = blob-from-carray($am);
say $bu.decode;

my $b2 = blob-from-carray($au):12size;
say $b2.decode;

