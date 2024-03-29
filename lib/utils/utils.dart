//app utils
var userToken="";

Map<String,String> headers={
  "Authorization":"Bearer "+userToken,
  "Content-Type":"application/json"
};


const url="https://muchira-mcuapi.herokuapp.com";

const String apiKey="fbudue730fbsjk78bnwo";

generateData(List names){
  var data=[];
  for (int i=0;i<=8;i++){
    data.add({
      "pin":i,
      "name":names.isNotEmpty ? names[i] : "Pin $i",
      "value":i>4 ? 0: "on",
      "type":i>4 ? "read" :"write"
    });
  }

  return data;
}
