// The fibonacci sequence in node

var a = 0;
var b = 1;
var nth;
for (var i=0; i<50; i++){
    console.log(a);
    nth = a + b;
    a = b;
    b = nth;
}
