mathLogic = (event) => {
    let operation = "";
    let result ="";

    let operators = "+ - * / ";
    let numbers ="1 2 3 4 5 6 7 8 9 0"

    buttons = document.getElementById("buttons");
    let input = document.getElementById("input");
    let output = document.getElementById("output");

    buttons.onclick = (event) => {
        if(operation === "" || operation === "Infinity"){
            if(numbers.includes(event.target.name)){
                operation = event.target.name;

                input.removeChild(input.childNodes[0]);
                input.appendChild(document.createTextNode(operation));

                result = eval(operation);
                output.removeChild(output.childNodes[0]);
                output.appendChild(document.createTextNode(result));
            }
            else if(event.target.name === "."){
                operation = "0.";
                input.removeChild(input.childNodes[0]);
                input.appendChild(document.createTextNode(operation));

                result = eval(operation);
                output.removeChild(output.childNodes[0]);
                output.appendChild(document.createTextNode(result));
            }
        }
        else{
            if(numbers.includes(event.target.name) || event.target.name === "."){
                operation = operation + event.target.name;

                input.removeChild(input.childNodes[0]);
                input.appendChild(document.createTextNode(operation));

                result = eval(operation);
                output.removeChild(output.childNodes[0]);
                output.appendChild(document.createTextNode(result));
            }
            else if(operators.includes(event.target.name)){
                if(operators.includes(operation.substr(operation.length-1,operation.length))){
                    operation = operation.substr(0,operation.length-1);
                    operation = operation + event.target.name;

                    input.removeChild(input.childNodes[0]);
                    input.appendChild(document.createTextNode(operation));
                }
                else{
                    operation = operation + event.target.name;

                    input.removeChild(input.childNodes[0]);
                    input.appendChild(document.createTextNode(operation));
                }
            }
            else if(event.target.name === "clear"){
                operation = "";
                result = "";
                
                input.removeChild(input.childNodes[0]);
                input.appendChild(document.createTextNode(""));
                
                output.removeChild(output.childNodes[0]);
                output.appendChild(document.createTextNode(""));
            }
            else if(event.target.name === "backspace"){
                
                console.log(operation === "");
                if(operators.includes(operation.substr(operation.length-2,1))){
                    operation = operation.substr(0,operation.length-1);
                    result = eval(operation.substr(0,operation.length-1));

                    input.removeChild(input.childNodes[0]);
                    input.appendChild(document.createTextNode(operation));

                    output.removeChild(output.childNodes[0]);
                    output.appendChild(document.createTextNode(result));
                }
                else if(operation.length === 1){
                    result = "" ;
                    operation = "";
                    
                    console.log("tu");
                    input.removeChild(input.childNodes[0]);
                    input.appendChild(document.createTextNode(""));

                    output.removeChild(output.childNodes[0]);
                    output.appendChild(document.createTextNode(""));
                }
                else{
                    operation = operation.substr(0,operation.length-1);
                    result = eval(operation);

                    input.removeChild(input.childNodes[0]);
                    input.appendChild(document.createTextNode(operation));

                    output.removeChild(output.childNodes[0]);
                    output.appendChild(document.createTextNode(result));
                }
               
            }
            else if(event.target.name === "="){
                operation = String(result);

                input.removeChild(input.childNodes[0]);
                input.appendChild(document.createTextNode(operation));
                
                output.removeChild(output.childNodes[0]);
                output.appendChild(document.createTextNode(result));
            }
        }
    }
}

mathLogic();