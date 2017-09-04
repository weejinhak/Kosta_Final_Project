// student side
document.getElementById('getval').addEventListener('change', readURL, true);
function readURL(){
    var file = document.getElementById("getval").files[0];
    var reader = new FileReader();
    reader.onloadend = function(){
        document.getElementById('profile-upload').style.backgroundImage = "url(" + reader.result + ")";        
    }
    if(file){
        reader.readAsDataURL(file);
    }else{
    }
}

// teacher side

document.getElementById('getval2').addEventListener('change', readURL2, true);
function readURL2(){
    var file2 = document.getElementById("getval2").files[0];
    var reader2 = new FileReader();
    reader2.onloadend = function(){
        document.getElementById('profile-upload2').style.backgroundImage = "url(" + reader2.result + ")";        
    }
    if(file2){
        reader2.readAsDataURL(file2);
    }else{
    }
}