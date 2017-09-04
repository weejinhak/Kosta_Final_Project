$( function() {
    $( ".tier" ).sortable({
    	revert: true
    });
    $( ".alternative" ).draggable({
      connectToSortable: ".tier" ,
      /*helper: "clone",*/
      cursor: "move",
      revert: "invalid"
    });
    $( "div" ).disableSelection();
  } );

/*
	위치 저장
function saveDragDropNodes()
{
	var saveString = "";
	var uls = dragDropTopContainer.getElementsByTagName('.tier');
	for(var no=0;no<uls.length;no++){	// LOoping through all <ul>
		var lis = uls[no].getElementsByTagName('.alternative');
		for(var no2=0;no2<lis.length;no2++){
			if(saveString.length>0)saveString = saveString + ";";
			saveString = saveString + uls[no].id + '|' + lis[no2].id;
			console.log(saveString);
		}
	}

	document.getElementById('saveContent').innerHTML = '<h1>Ready to save these nodes:</h1> ' + saveString.replace(/;/g,';<br>') + '<p>Format: ID of ul |(pipe) ID of li;(semicolon)</p><p>You can put these values into a hidden form fields, post it to the server and explode the submitted value there</p>';

}
*/

$(function() {
	var email='';
	var name='';
	var position='';
	var groupTable='';

		$("#save").click(function() {
			
			alert("sava 누르셨구요")
		
			$('.alternative').each(function(index) {
				//var indexval = $("input[name^='email']").index(this);
				var emailval =$("input[name^='email']:eq("+index+")").val(); 
				
				
				var indexTable = $("input[name^='student']").index(this);
				var groupTableName =$(this).parent().attr('id');
				var name = $(this).text(),
					order = index;
				
				console.log("email: " + emailval + " | " + "name: " + name+ " | " + "position: " + order + " | "+ "groupTable : " + groupTableName)
				email += emailval+',';
				name += name+',';
				position += order +',';
				groupTable += groupTableName +',';

			});
			//ajaxEvent();
			//head div에 값이 없을 때  sava ajax 태우기
			/*if($('div[class="alternative"]:empty')){
				alert('조편성을 완료한 후에 sava 해주세요!');
			}else{
				
				 ajaxEvent();
			}*/
			if($.trim($('div[class="head"]').html())==''){
				ajaxEvent();
			}else{
				alert('조편성을 완료한 후에 sava 해주세요!');
			}
		});
		//ajax 함수
		function ajaxEvent(){

			$.ajax({
				url: "sgroup.htm",
				type: "post",
				data : {"email":email, "position":position, "groupTable":groupTable, "classCode": '151기' },
				dataType : 'html',
				success : function(data){
					//console.log(data);
					alert('select ajax 태웁니다');
					//저장된 위치값 다시 뿌려봅시다
					//ajax in ajax start
					$.ajax({
						url: "callgroup.htm",
						type: "POST",
						data : {"classCode": '151기'},
						dataType : 'html',
						success : function(data){
							//console.log(data);
							alert('2번째 ajax 태웠네요');
							console.log(data);
							$('.tier').html(data);
						},
						error:function(request, status, error){
							//console.log(error);
							alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
						}
					});
					//ajax in ajax end
				},
				
				error:function(request, status, error){
					//console.log(error);
					alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n"+ "error: " +error )
				}
			});
			}//fucntion end
		
	});