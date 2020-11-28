<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}
.container{
  padding: 16px;
  background-color: white;
  margin: auto;
  width : 800px;
}
/* board */
#Input {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#Board {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#Board th, #Board td {
  padding: 12px;
}

#Board tr {
  border-bottom: 1px solid #ddd;
}

#Board tr.header{
  text-align: center;
}

#Board tr.header, #Board tr:hover {
  background-color: #f1f1f1;
}

/* pagination */
.center {
  text-align: center;
}
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>
</head>
<body>
<div class="container">
<h2>board</h2>

<input type="text" id="Input" onkeyup="myFunction()" placeholder="Search for numbers.." title="Type in a name">

<table id ="Board">
	<tr class ="header">
		<td class="header" style="width:60%">번호</td>
		<td class="header" style="width:40%">제목</td>
	</tr>
	<tr>
		<td>1</td>
		<td>1</td>
	</tr>
	<tr>
		<td>2</td>
		<td>2</td>
	</tr>
	<tr>
		<td>3</td>
		<td>3</td>
	</tr>
	<tr>
		<td>4</td>
		<td>4</td>
	</tr>
	<tr>
		<td>5</td>
		<td>5</td>
	</tr>
</table>

<!-- pagination -->
<div class="center">
	<div class="pagination">
 		<a href="#">&laquo;</a>
  		<a href="#">1</a>
  		<a href="#" class="active">2</a>
  		<a href="#">3</a>
  		<a href="#">4</a>
  		<a href="#">5</a>
  		<a href="#">6</a>
  		<a href="#">&raquo;</a>
	</div>
</div>
</div>
<!-- search function-->
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("Input");
  filter = input.value.toUpperCase();
  table = document.getElementById("Board");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>
