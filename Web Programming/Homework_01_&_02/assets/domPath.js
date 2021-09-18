function domPath(){
    var mainDiv = document.getElementsByClassName("main")[0];
    var pathToFirstElem = [];
    var pathToSecondElem = [];
    var path = [];

    mainDiv.onclick = (event) => {

        if(pathToFirstElem.length === 0){
            //Okrećemo kako bi imali put od root-a prema node-u
            pathToFirstElem = event.path.reverse();

            //izbacujemo node-ove koji se nalaze van body-a
            pathToFirstElem = pathToFirstElem.slice(3, pathToFirstElem.length);
        }
        else{
            pathToSecondElem = event.path.reverse();
            pathToSecondElem = pathToSecondElem.slice(3, pathToSecondElem.length);

            //Imamo put do prvog elementa i put do drugog elementa, jer oba imaju "body" kao root
            //znači da otpočetka dijele barem jedan zajednički element (put sigurno postoji)
            //izbacujemo elemente sve dok ne dođemo do zadnjeg kojeg dijele
            //nakon što dođemo do zadnjeg kojeg dijele, izbacimo ga iz jedne liste
            //te konkateniramo dvije liste i imamo najkraći put
            while(true){
                //pokriva potencijalne buggove, npr kad se klikne dva puta na isti element
                if(pathToFirstElem.length === 0 || pathToSecondElem.length === 0){
                    break;
                }
                //uzimamo 1 jer sigurno postoji barem jedan zajednički, ako postoji još jedan biti će odma idući    
                else if(pathToFirstElem[1] == pathToSecondElem[1]){
                    pathToFirstElem = pathToFirstElem.slice(1, pathToFirstElem.lenght);
                    pathToSecondElem = pathToSecondElem.slice(1, pathToSecondElem.length);
                }
                else{
                    path = pathToFirstElem.reverse().concat(pathToSecondElem.slice(1, pathToSecondElem.length));
                    break;
                }
            }

            let stringPath = "";

            for(i = 0;i <(path.length - 1);i++){
                stringPath = stringPath + path[i].nodeName.toLowerCase() + " -> ";
            }

            //ako pritisnemo dva puta na isti element
            if(path.length > 0){
                stringPath = stringPath + path[path.length - 1].nodeName.toLowerCase();
            } 
            

            console.log(stringPath);
            pathToSecondElem = [];
            pathToFirstElem = [];
            path = [];
        }
    }
}

domPath();