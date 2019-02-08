var paragraphElement = document.createElement("p");
console.log(paragraphElement);

var paragraphText = document.createTextNode("IT WORKS");
console.log(paragraphText);

var paragraphWithText = paragraphElement.appendChild(paragraphText);                          
console.log(paragraphWithText);

var divElement = document.getElementById("main");
console.log(divElement);

var divWithParagraph = divElement.appendChild(paragraphElement);
console.log(divWithParagraph);

var someBtnElement = document.createElement("button");
someBtnElement.className = "btn-primary";


console.log(someBtnElement);

var someBtnText = document.createTextNode("CLICK ME");

var btnWithText = someBtnElement.appendChild(someBtnText);
console.log(btnWithText);

var btnInDiv = divElement.appendChild(btnWithText);
console.log(btnInDiv);