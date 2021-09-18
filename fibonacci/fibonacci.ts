// The fibonacci sequence in typescript

var a:number = 0;
var b:number = 1;
var nth:number;
var i:number;
for (i=0; i<50; i++){
    console.log(a);
    nth = a + b;
    a = b;
    b = nth;
}
