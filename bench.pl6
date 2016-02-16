use v6;
use Bench;
use NativeHelpers::Blob;
use NativeCall;

my $b = Bench.new;

my $small = Buf.new(0 xx 100);
my $medium = Buf.new(0 xx 1000);
my $large = Buf.new(0 xx 10000);

say "Blob to Carray";
$b.timethese(1000, {
    sml-clas => { CArray[uint8].new($small.list) },
    sml-fast => { carray-from-blob($small):managed; },
    med-clas => { CArray[uint8].new($medium.list) },
    med-fast => { carray-from-blob($medium):managed; },
    lge-clas => { CArray[uint8].new($large.list) },
    lge-fast => { carray-from-blob($large):managed; }
});

say "Blob creation";
$b.timethese(1000, {
    clasic => { Blob.new(0 xx 10000); },
    fast   => { blob-new(:elems(10000)); },
});
