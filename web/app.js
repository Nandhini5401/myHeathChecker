var html = "";

function dataHealth(data)
{
  data.forEach(doc => {
  var info = doc.data();
    html += "<li class=\"collection-item\">";
    html += "<div>Body temperature:"+info.bodytemperature+"</div>";
    html += "</li>";
  });
 document.getElementById("data find").innerHTML= html; 
}
 db.collection('data').get().then((snapshot) => {
   dataHealth(snapshot.docs);
})

  