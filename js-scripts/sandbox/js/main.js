var main_div = document.getElementById("main");
var h1 = document.createElement("h1");
var text = document.createTextNode("It Works!");



main_div.appendChild(h1);

h1.appendChild(text);


console.log(h1);    
