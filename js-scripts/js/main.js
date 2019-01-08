"use strict";
var lines = 0;

var domains = [
{
		"id": 1,
		"domain": "example.net",
		"monitoring": true
	},
	{
		"id": 2,
		"domain": "example.com",
		"monitoring": false
	}
];

var mypage = {
    "element": {
        "type": "div",
        "attributes" : {
            "class" : "header"
            ,"id" : "div-main"
        }
        ,"children" : [
            {
                "element": {
                    "type": "h2",
                    "attributes" : {
                        "class" : "header"
                        ,"id" : "h2-logo"
                    }
                    ,"text" : "It works!"
                    ,"onclick" : "console.log('RederedPage');"
                }
            }
            ,
            {
                "element": {
                }
            }
        ]
    }
};

var Person = {
    id: 123
    ,phone: [
        "555-0001"
        ,"555-0002"
    ]
    ,name: {
        first: "John"
        ,last: "Doe"
    }
};

var empty_obj = {};
var obj_one = { id: 100 };
var obj_two = { id: 101, name: "Charlie Root" };
var obj_three = { id: 102, name: "Charlie Root", age: 30 };
var obj_array = { ids: [ 100,101,102 ] };

function renderPage(page) {
    console.log("DEBUG: renderPage("+page+") - START");
    iterateObject(mypage);
    //iterateObject(Person);
    //iterateObject(empty_obj);
    //iterateObject(obj_one);
    //iterateObject(obj_two);
    //iterateObject(obj_three);
    //iterateObject(obj_array);
  	console.log("");
    console.log("DEBUG: renderPage("+page+") - END");
}


function iterateObject(obj) {
	//console.log("obj:");
	//console.log(obj);
    for (var key in obj) {
    	//console.log("");
    	//console.log("DEBUG: typeof key: "+ typeof obj[key]);
    	if (Array.isArray(obj[key])) {
    		//console.log("obj["+key+"] is an Array");
    		lines++;
    		console.log(lines+":"+key+":");
    		for (var idx in obj[key]) {
    			//Check If its a Object
    			if (typeof obj[key][idx] == 'object') {
    				lines++;
    				//Iterate Child
    				iterateObject(obj[key][idx]);
    			} else {
    				lines++;
    				console.log(lines+": - "+obj[key][idx]);	
    			}
    		}

    	} else if (typeof obj[key] == 'object') {
    		lines++;
			console.log(lines+": "+key+":");
			//Iterate Child
			iterateObject(obj[key]);
				
		} else {
				lines++;
				console.log(lines+": "+key+"="+obj[key]);
				
		}
    }

}

function main() {
	renderPage("sanbox");
}

main();