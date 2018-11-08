var server_url = "http://greyboxerp.in/fin/backend.php";
var modal = document.getElementsByClassName('modal');
var modal1 = document.getElementsByClassName('modal1');
var modal_index = 0;
var modal1_index = 0;

function show_modal(x){ 
	var indx = $(x).closest('table tr').index();
	modal_index = indx - 1;
	modal[indx -1].style.visibility = "visible";
	modal[indx -1].style.display = "block";
}
function show_modal1(x){ 
	var indx = $(x).closest('table tr').index();
	modal1_index = indx - 1;
	modal1[indx -1].style.visibility = "visible";
	modal1[indx -1].style.display = "block";
}
function hide_modal(flag){ 
	if(flag == 0){
		modal[modal_index].style.visibility = "hidden";
	}else if(flag==1){
		modal1[modal1_index].style.visibility = "hidden";
	}
}

function delete_modal(indx){ 
	var list = document.getElementsByClassName('modal');  
	$('.modal').eq(indx -1).remove();
}	
function delete_modal1(indx){ 
	var list = document.getElementsByClassName('modal1');  
	$('.modal1').eq(indx -1).remove();
}	
	
function insert_modal(flag){
	if(flag==0){
		var original = document.getElementsByClassName('modal')[0];
	}else if(flag==1){
		var original = document.getElementsByClassName('modal1')[0];
		
	}
	var clone = original.cloneNode(true); // "deep" clone
	original.parentNode.appendChild(clone);
}
    

function item_property(x,flag){
	var bu = "Sample";
	if(flag==1){
		bu = document.getElementById("s_company").value;
	}
	if(bu!==""){
		$.ajax({
			url: server_url,
			method: "POST",
			data: {
				jsondata: x.value,
				bu: bu,
				flag:23
			},
			success: function (data) {
				var indx = $(x).closest('table tr').index();
				if(flag==0){
					$(".purchaseBox").eq(indx-1).html(data);
				}else if(flag==1){
					$(".purchaseBox1").eq(indx-1).html(data);
				}
			}
		});
	}else{
		alert("Please Select appropriate Company first!!");
	}
}

function sundry_sub_total(x,flag){
	var index = $(x).closest('table tr').index();
	var basic = document.getElementsByName("basic_amt[]");
	var ttl_cbk = document.getElementsByName("ttl_cbk[]");
	var p = document.getElementsByName("sundry1_percent[]");
	var a = document.getElementsByName("sundry1_amt[]");
	
	
	var amt = new Array();
	var percent = new Array();
	
	var basic_amt = 0;
	var cumulative_amt = 0;
	
	for(var i = 0; i< basic.length ; i++){
		basic_amt = Number(basic_amt) + Number( basic[i].value);
	}
	for(i = 0; i< ttl_cbk.length ; i++){
		if(ttl_cbk[i].checked){
			amt[i] = p[i].value * (basic_amt + cumulative_amt) /100;
			var n = basic_amt + cumulative_amt;
			if(n!==0){
				percent[i]=a[i].value*100 / (basic_amt + cumulative_amt) ;
			}
		}else{//alert("percent = "+ p[i].value);
			amt[i] = p[i].value * (basic_amt ) /100;
			if(basic_amt!==0){
				percent[i]=a[i].value*100 / (basic_amt) ;
			}
		}
		cumulative_amt = cumulative_amt + amt[i];
	}
	if(flag==1){
		a[index -1].value =  amt[index -1];
	}else if (flag==0){
		p[index -1].value =  percent[index -1];
	}else{
		for(i = 0; i< a.length ; i++){
			a[i].value = amt[i];
		}
	}
	
}
function sundry_sub_total2(x,flag){ 
	var index = $(x).closest('table tr').index();
	var basic = document.getElementsByName("basic_amt2[]");
	var ttl_cbk = document.getElementsByName("ttl_cbk2[]");
	//var ttl_cbk = new Array();
	var p = document.getElementsByName("sundry2_percent[]");
	var a = document.getElementsByName("sundry2_amt[]");
	
	var amt = new Array();
	var percent = new Array();
	
	var basic_amt = 0;
	var cumulative_amt = 0;
	
	for(var i = 0; i< basic.length ; i++){
		basic_amt = Number(basic_amt) + Number( basic[i].value);
	}
	
	for(i = 0; i< a.length ; i++){
		//ttl_cbk.push(false);
		if(ttl_cbk[i].checked){
			amt[i] = p[i].value * (basic_amt + cumulative_amt) /100;
			var n = basic_amt + cumulative_amt;
			if(n!==0){
				percent[i]=a[i].value*100 / (basic_amt + cumulative_amt) ;
			}
		}else{//alert("percent = "+ p[i].value);
			amt[i] = p[i].value * (basic_amt ) /100;
			if(basic_amt!==0){
				percent[i]=a[i].value*100 / (basic_amt) ;
			}
		}
		cumulative_amt = cumulative_amt + amt[i];
	}
	if(flag==1){
		a[index -1].value =  amt[index -1];
	}else if (flag==0){
		p[index -1].value =  percent[index -1];
	}else{
		for(i = 0; i< a.length ; i++){
			a[i].value = amt[i];
		}
	}
	
}

function clear_value(name){
		document.getElementById(name).value = "";
}

function property_list(){
	var temp = new Array();
	var desc = document.getElementById("purchase_desc").value;
	var grp = document.getElementById("groupname").value;
	var bu = document.getElementById("company").value;
	var pl = document.getElementsByName("prop_list[]");
	for(var i = 0; i<pl.length; i=i+6){
		if(pl[i].value!==""){
			temp.push(pl[i].value + "~" +pl[i+1].value + "~" + pl[i+2].value+ "~" + pl[i+3].value+ "~" + pl[i+4].value+ "~" + pl[i+5].value);
		}
	}
	//alert(temp);
	var prop = JSON.stringify(remove_duplicate(temp));
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			jsondata: prop,
			bu: bu,
			desc: desc,
			grp: grp,
			flag:21
		},
		success: function (data) {
			alert(data);
		}
	});
}

function showOptions(x){ 
	var indx = $(x).closest('table tr').index() -1; 
	if(x.value=="Select"){
		document.getElementsByClassName("optns")[indx].style.display = "block";
		//document.getElementsByClassName("optns")[indx].style.visibility = "visible";
	}else{
		document.getElementsByClassName("optns")[indx].style.display = "none";
	}
		
}
function showOptionsNew(x){ 
	var indx = $(x).closest('table tr').index(); 
	if(x.value=="Select"){
		document.getElementsByClassName("optns")[indx].style.display = "block";
		//document.getElementsByClassName("optns")[indx].style.visibility = "visible";
	}else{
		document.getElementsByClassName("optns")[indx].style.display = "none";
	}
		
}

function show_product_properties(){
	var grp = document.getElementById("groupname").value;
	var bu 	= document.getElementById("company").value;
	
	if(grp!==""){
		//alert(document.getElementById('groupname').value);
		$.ajax({
		url: server_url,
		method: "POST",
		data: {
			grp:grp,
			bu:bu,
			flag:22
		},
		success: function (data) {
			//alert(data);
			$("#nav-placeholder3").html(data);
			
		}
	});
	}else{
		alert("Please Select Valid Item Group first!!!");
	}
}

function get_vno_from_url(){
	var url_parameters = {};
	var i = 0;
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        url_parameters[i] = value;
		i++;
	});
	if(url_parameters[0]){
		return url_parameters; 
	}else{
		return 0;
	}
}

function remove_duplicate(a){
	var prims = {"boolean":{}, "number":{}, "string":{}}, objs = [];

    return a.filter(function(item) {
        var type = typeof item;
        if(type in prims)
            return prims[type].hasOwnProperty(item) ? false : (prims[type][item] = true);
        else
            return objs.indexOf(item) >= 0 ? false : objs.push(item);
    });
}

function print_inv(){
	var vno = get_vno_from_url();
	if(vno.length==1){
		vno[1] =0;
		vno[2] =0;
	} else if(vno.length==2){
		vno[2] =0;
	} 
	
	$.ajax({  
			url:server_url,  
			method:"POST",  
			data:{flag:16,vno:vno[0],len:vno[1],con:vno[2]},
			success:function(data)
			{
				//alert(data);
				$("#sale_html").html(data);
				window.print();
			}  
		});
}

function print_sales(){
	var v_no = get_vno_from_url(); 
	if(v_no){
		var con = 0;
		var len = document.getElementsByClassName("sale_detail1").length  / document.getElementsByName("item_links1[]").length;
		window.open("sale_print.html?vno="+v_no[0]+"&len="+len+"&con="+con);
	}
}
function get_item_2(x){
	var index = $(x).closest('table td').index();
	var temp = $(x).closest('table').find('.select1');
	return temp[index-1].value;
}
function get_item(x){
	var index = $(x).closest('table tr').index();
	var temp = $(x).closest('table').find('.select1');
	return temp[index -1].value;
}

function sundry_selection(){
	var val_m = document.getElementsByName("val_m[]");
	var ttl = document.getElementsByName("ttl[]");
	var ttl2 = document.getElementsByName("ttl2[]");
	var tax_cbk = document.getElementsByName("tax_cbk[]");
	var val_cbk = document.getElementsByName("val_cbk[]");
	var ttl_cbk = document.getElementsByName("ttl_cbk[]");
	var ttl_cbk2 = document.getElementsByName("ttl_cbk2[]");
	for(var i = 0; i< ttl2.length ; i++){
		if(ttl_cbk2[i].checked){
			subtotal_selection(ttl2[i]);
		}
	}
	for(var i = 0; i< ttl.length ; i++){
		if(val_cbk[i].checked){
			sundry_val_method(val_m[i]);
		}
		if(ttl_cbk[i].checked){
			subtotal_selection(ttl[i]);
		}
		
		if(tax_cbk[i].checked){ 
			toggle_sundry(tax_cbk[i],i);
		}
	}
}
function sundry_val_method(x){//alert("x = "+ x.innerHTML);
	if(x.innerHTML == "By Quantity"){
		x.innerHTML = "By Amount";
	}else{
		x.innerHTML = "By Quantity";
	}
}
function subtotal_selection(x){
	if(x.innerHTML == "Subtotal"){
		x.innerHTML = "Cumulative Total";
	}else{
		x.innerHTML = "Subtotal";
	}
}
function getlabel(x,flag){
	if(flag ==0){
		sundry_val_method(x);
	}else if(flag ==1){
		subtotal_selection(x);
	} 
}
function toggle_sundry(x,index){
	if(x.checked){
		$('[name="val_m[]"]').eq(index).hide();
		$('[name="tax[]"]').eq(index).show();
	}else{
		$('[name="tax[]"]').eq(index).hide();
		$('[name="val_m[]"]').eq(index).show();
	}	
}
function show_sundry(x){
	var index = $(x).closest('table tr').index() - 1;
	toggle_sundry(x,index);	
}

function get_basic_amount(flag){
	var qty =document.getElementsByName("qty[]");
	var price =document.getElementsByName("price[]");
	var disc =document.getElementsByName("discount[]");
	var basic =document.getElementsByName("basic_amt[]");

	if(flag==0){	
		for(var i = 0; i<price.length;i++){
			basic[i].value = (Number(qty[i].value) * Number(price[i].value)) * (100 - Number(disc[i].value))/100;
		}
	}else{
		for(var i = 0; i<price.length;i++){
			if(qty[i].value !==""&&qty[i].value !==0){
				price[i].value =  Number(basic[i].value)*100 / ((100 - Number(disc[i].value))*Number(qty[i].value));
			}
		}
	}

	sundry_sub_total(basic[0],2);
}

function get_basic_amount2(flag){
	var qty =document.getElementsByName("qty2[]");
	var price =document.getElementsByName("price2[]");
	var disc =document.getElementsByName("discount2[]");
	var basic =document.getElementsByName("basic_amt2[]");
	if(flag==0){	
		for(var i = 0; i<price.length;i++){
			basic[i].value = (Number(qty[i].value) * Number(price[i].value)) * (100 - Number(disc[i].value))/100;
		}
	}else{
		for(var i = 0; i<price.length;i++){
			if(qty[i].value !==""&&qty[i].value !==0){
				price[i].value =  Number(basic[i].value)*100 / ((100 - Number(disc[i].value))*Number(qty[i].value));
			}
		}
	}
	sundry_sub_total2(basic[0],2);
}

function hide_table2(){
	if($("#xconsignee").val()==""){
		$('#table2').hide();
	}else{
		$('#table2').show();
	}
}

/*
function delete_column(tblClass)
{
	var allRows = document.getElementsByClassName(tblClass)[0].rows;
	for (var i=0; i<allRows.length; i++) {
		if (allRows[i].cells.length > 1) {
			allRows[i].deleteCell(-1);
		}
	}
}
function add_column(tblClass){
var table = document.getElementsByClassName(tblClass)[0];

for (var i=0; i<table.rows.length; i++) {
		var newCell = table.rows[i].insertCell(-1);
		newCell.innerHTML = table.rows[i].cells[0].innerHTML;
	}
}
*/

function delete_row(tblClass){
	var table = document.getElementsByClassName(tblClass)[0];
	if(table.rows.length>2){
		table.deleteRow(table.rows.length-1);
		//set_tab();
	}else{
		add_row(tblClass);
		table.deleteRow(table.rows.length-2);
	}
}

function delete_row_index(tblClass,x){
	var index = $(x).closest('table tr').index();	
	var table = document.getElementsByClassName(tblClass)[0];
	if(table.rows.length>2){
		table.deleteRow(index);
		//set_tab();
	}else{
		add_row(tblClass);
		table.deleteRow(index);
	}
	return index;
}
function add_row(tblClass){ 
		var table = document.getElementsByClassName(tblClass)[0];
		var rowcount = table.rows.length ;
		var row = table.insertRow(rowcount);
		var colCount = table.rows[0].cells.length;
		for(var i=0;i<colCount;i++){
			var newcell=row.insertCell(i);
			newcell.innerHTML=table.rows[1].cells[i].innerHTML;
			table.rows[rowcount].cells[i].className = table.rows[0].cells[i].className;
			
		}
		//show_fields();
		//document.getElementsByName(document.getElementsByClassName(element)[0].name)[rowcount-1].focus();
		//set_tab();
 }
function get_instant_data(){
	var element = document.getElementsByName("instant[]");
	for(var i = 0;i<element.length;i++){
		get_options(element[i],10,element[i].id);
	}
}
function find_bu(){
	var bu = document.getElementById("company").value;
	//alert("bu = "+bu);
	
	return JSON.stringify(bu);
}
function get_bu(flag){
	var temp = new Array();
	temp.push(document.getElementById("s_company").value);
	temp.push(flag);
	temp.push(document.getElementById("consignee").value);
	
	return JSON.stringify(temp);
}
function get_bu2(flag){//alert("bu");
	var temp = new Array();
	temp.push("Sample");
	temp.push(flag);
	temp.push(document.getElementById("xconsignee").value);
	
	return JSON.stringify(temp);
}
function get_bu_consignee(){
	var temp = new Array();
	temp.push(document.getElementById("s_company").value);
	temp.push(document.getElementById("consignee").value);
	return JSON.stringify(temp);
}
function save_permission_fields(){
	var fields = document.getElementsByName("p_fields[]");
	var values = new Array();
	for(var i = 0; i< fields.length;i++){
		values[i] = fields[i].className;
	}
	alert(values);
	var jsondata = JSON.stringify(values);
	
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			jsondata: jsondata,
			flag:3
		},
		success: function (data) {
			//alert(data);
		}
	});
}

function submit_sales(){//Obsolete function
	if(confirm("Do you really want to submit the data ?")){
		var vno = new Array();
		
		if(!get_vno_from_url()){
			vno[0]=0;
		}else{
			vno = get_vno_from_url();
		}
		
		var sale_flag = 0;
		var hdr1 = document.getElementsByClassName("sale_header1");
		var hdr2 = document.getElementsByClassName("sale_header2");
		var item1 = document.getElementsByClassName("item1");
		var item2 = document.getElementsByClassName("item2");
		var qty1 = document.getElementsByClassName("quantity1");
		var basic1 = document.getElementsByClassName("basic1");
		var basic2 = document.getElementsByClassName("basic2");
		var detail1 = document.getElementsByClassName("sale_detail1");
		var detail2 = document.getElementsByClassName("sale_detail2");
		var sundry1 =  document.getElementsByClassName("sale_sundry1"); 
		var sundry2 =  document.getElementsByClassName("sale_sundry2"); 
		var hdr1_ary = new Array();
		var hdr2_ary = new Array();
		var item_ary = new Array();
		var item2_ary = new Array();
		var qty_ary = new Array();
		var basic_ary = new Array();
		var basic2_ary = new Array();
		var dtl1_ary = new Array();
		var dtl2_ary = new Array();
		var sundry1_ary = new Array();
		var sundry2_ary = new Array();
		var instant_ary = new Array();
		
		for(var i=0;i<hdr1.length;i++){
			hdr1_ary.push(hdr1[i].value);
			if(hdr1[i].getAttribute( "list" )){
				instant_ary.push(hdr1[i].getAttribute( "list" ));
				instant_ary.push(hdr1[i].value);
			}
		}
		
		for(var i=0;i<hdr2.length;i++){
			hdr2_ary.push(hdr2[i].value);
		}
		
		for(var i=0;i<detail1.length;i++){
			dtl1_ary.push(detail1[i].value);
		}
		
		for(var i=0;i<item1.length;i++){
			if(item1[i].value!=="" && item1[i].value!== "select item"){
				item_ary.push(item1[i].value);
				qty_ary.push(qty1[i].value);
				basic_ary.push(basic1[i].value);
			}
		}
		
		for(var i=0;i<basic2.length;i++){
			if(basic2[i].value!=="" ){
				item2_ary.push(item2[i].value);
				basic2_ary.push(basic2[i].value);
			}
		}
		
		for(var i=0;i<detail2.length;i++){
			dtl2_ary.push(detail2[i].value);
		}
		
		for(var i=0;i<sundry1.length;i++){
			if(sundry1[i].tagName== "INPUT" && sundry1[i].type=="checkbox"){
				if(sundry1[i].checked){
					sundry1_ary.push('on');
				}else{
					sundry1_ary.push('off');
				}
			}else{
				sundry1_ary.push(sundry1[i].value);
			}
		}
		
		for(var i=0;i<sundry2.length;i++){
			if(sundry2[i].tagName== "INPUT" && sundry2[i].type=="checkbox"){
				if(sundry2[i].checked){
					sundry2_ary.push('on');
				}else{
					sundry2_ary.push('off');
				}
			}else{
				sundry2_ary.push(sundry2[i].value);
			}
		}
		//alert(sundry2_ary);
		//alert(hdr1_ary);alert(hdr2_ary);alert(dtl1_ary);alert(dtl2_ary);alert(sundry1_ary);alert(sundry2_ary);
		var hdr1_json = JSON.stringify(hdr1_ary);
		var hdr2_json = JSON.stringify(hdr2_ary);
		var item_json = JSON.stringify(item_ary);
		var item2_json = JSON.stringify(item2_ary);
		var qty_json = JSON.stringify(qty_ary);
		var basic_json = JSON.stringify(basic_ary);
		var basic2_json = JSON.stringify(basic2_ary);
		var dtl1_json = JSON.stringify(dtl1_ary);
		var dtl2_json = JSON.stringify(dtl2_ary);
		var sundry1_json = JSON.stringify(sundry1_ary);
		var sundry2_json = JSON.stringify(sundry2_ary);
		var instant_json = JSON.stringify(instant_ary);
		if (sale_flag==0){
			$.ajax({ 
			    url:server_url,  
                method:"POST",  
                data:{basic:basic_json,basic2:basic2_json,item2:item2_json,item:item_json,qty:qty_json,instant:instant_json,hdr1:hdr1_json,hdr2:hdr2_json,dtl1:dtl1_json,dtl2:dtl2_json,sundry1:sundry1_json,sundry2:sundry2_json,flag:13,vno:vno[0]},
				success:function(data){  
                     alert(data);
					$("#mydiv").html(data);
					 //reset_table(); 
					
                }				
           });
		}
	}
}
function submit_purchase(flag){
	if(confirm("Do you really want to submit the data ?")){
		var vno = new Array();
		
		if(!get_vno_from_url()){
			vno[0]=0;
		}else{
			vno = get_vno_from_url();
		}
		
		var sale_flag = 0;
		var hdr1 = document.getElementsByClassName("sale_header1");
		var hdr2 = document.getElementsByClassName("sale_header2");
		var item1 = document.getElementsByClassName("item1");
		var item2 = document.getElementsByClassName("item2");
		var qty1 = document.getElementsByClassName("quantity1");
		var basic1 = document.getElementsByClassName("basic1");
		var basic2 = document.getElementsByClassName("basic2");
		var detail1 = document.getElementsByClassName("sale_detail1");
		var detail2 = document.getElementsByClassName("sale_detail2");
		var sundry1 =  document.getElementsByClassName("sale_sundry1"); 
		var sundry2 =  document.getElementsByClassName("sale_sundry2"); 
		var hdr1_ary = new Array();
		var hdr2_ary = new Array();
		var item_ary = new Array();
		var item2_ary = new Array();
		var qty_ary = new Array();
		var basic_ary = new Array();
		var basic2_ary = new Array();
		var dtl1_ary = new Array();
		var dtl2_ary = new Array();
		var sundry1_ary = new Array();
		var sundry2_ary = new Array();
		var instant_ary = new Array();
		var modal_ary = new Array();
		var modal1_ary = new Array();
		var m = [];
		var m1 = [];
		
		for(var i=0;i<hdr1.length;i++){
			hdr1_ary.push(hdr1[i].value);
			if(hdr1[i].getAttribute( "list" )){
				instant_ary.push(hdr1[i].getAttribute( "list" ));
				instant_ary.push(hdr1[i].value);
			}
		}
		
		for(var i=0;i<hdr2.length;i++){
			hdr2_ary.push(hdr2[i].value);
		}
		
		for(var i=0;i<detail1.length;i++){
			dtl1_ary.push(detail1[i].value);
		}
		
		for(var i=0;i<item1.length;i++){
			if(item1[i].value!=="" && item1[i].value!== "select item"){
				item_ary.push(item1[i].value);
				qty_ary.push(qty1[i].value);
				basic_ary.push(basic1[i].value);
			}
		}
		
		for(var i=0;i<basic2.length;i++){
			if(basic2[i].value!=="" ){
				item2_ary.push(item2[i].value);
				basic2_ary.push(basic2[i].value);
			}
		}
		
		for(var i=0;i<detail2.length;i++){
			dtl2_ary.push(detail2[i].value);
		}
		
		for(var i=0;i<sundry1.length;i++){
			if(sundry1[i].tagName== "INPUT" && sundry1[i].type=="checkbox"){
				if(sundry1[i].checked){
					sundry1_ary.push('on');
				}else{
					sundry1_ary.push('off');
				}
			}else{
				sundry1_ary.push(sundry1[i].value);
			}
		}
		
		for(var i=0;i<sundry2.length;i++){
			if(sundry2[i].tagName== "INPUT" && sundry2[i].type=="checkbox"){
				if(sundry2[i].checked){
					sundry2_ary.push('on');
				}else{
					sundry2_ary.push('off');
				}
			}else{
				sundry2_ary.push(sundry2[i].value);
			}
		}
		//Modals
		for(i = 0;i<$(".modal1").length;i++){
			m1=[];
			for(var j=0;j<$(".modal1").eq(i).find('.input-field').length;j++){ //alert($(".modal1").eq(i).find('.input-field').eq(j).tagName());
				m1.push($(".modal1").eq(i).find('.ilabel').eq(j).html(),$(".modal1").eq(i).find('.input-field').eq(j).val(),$(".modal1").eq(i).find('.input-field').eq(j).prop("tagName"));
			}
			modal1_ary.push(m1)
		}
		for(i = 0;i<$(".modal").length;i++){alert("klleo");
			m=[];
			for(var j=0;j<$(".modal").eq(i).find('.input-field').length;j++){
				m.push($(".modal").eq(i).find('.ilabel').eq(j).html(),$(".modal").eq(i).find('.input-field').eq(j).val(),$(".modal").eq(i).find('.input-field').eq(j).prop("tagName"));
			}
			modal_ary.push(m)
		}
		
		//alert(modal1_ary);
		var hdr1_json = JSON.stringify(hdr1_ary);
		var hdr2_json = JSON.stringify(hdr2_ary);
		var item_json = JSON.stringify(item_ary);
		var item2_json = JSON.stringify(item2_ary);
		var qty_json = JSON.stringify(qty_ary);
		var basic_json = JSON.stringify(basic_ary);
		var basic2_json = JSON.stringify(basic2_ary);
		var dtl1_json = JSON.stringify(dtl1_ary);
		var dtl2_json = JSON.stringify(dtl2_ary);
		var sundry1_json = JSON.stringify(sundry1_ary);
		var sundry2_json = JSON.stringify(sundry2_ary);
		var instant_json = JSON.stringify(instant_ary);
		var modal1_json = JSON.stringify(modal1_ary);
		var modal_json = JSON.stringify(modal_ary);
		
		if (sale_flag==0){
			$.ajax({ 
			    url:server_url,  
                method:"POST",  
                data:{pflag:flag,modal2:modal_json,modal1:modal1_json,basic:basic_json,basic2:basic2_json,item2:item2_json,item:item_json,qty:qty_json,instant:instant_json,hdr1:hdr1_json,hdr2:hdr2_json,dtl1:dtl1_json,dtl2:dtl2_json,sundry1:sundry1_json,sundry2:sundry2_json,flag:13,vno:vno[0]},
				success:function(data){  
                     alert(data);
					//$("#mydiv").html(data);
					 //reset_table(); 
					
                }				
           });
		}
	}
}

function retrive_sales(){
	var vno = get_vno_from_url();
	//alert("url = "+vno[0]);
	if(vno[0]){ //alert("now here");
		$.ajax({  
			url:server_url,  
			method:"POST",  
			data:{vno:vno[0],flag:14},  
			success:function(data){	
			flag_tax=1;
					var response = JSON.parse(data);//alert(response);
					///////////////////////////////////////////////////////////////
					var hdr1 = document.getElementsByClassName("sale_header1");
					var hdr2 = document.getElementsByClassName("sale_header2");
					var dtl1 = document.getElementsByClassName("sale_detail1");
					var dtl2 = document.getElementsByClassName("sale_detail2");
					var sundry1 =  document.getElementsByClassName("sale_sundry1"); 
					var sundry2 =  document.getElementsByClassName("sale_sundry2"); 
					var row1 = JSON.parse(response[2]).length/dtl1.length;
					var row2 = JSON.parse(response[3]).length/dtl2.length;
					var row3 = JSON.parse(response[4]).length/sundry1.length;
					var row4 = JSON.parse(response[5]).length/sundry2.length;
					var temp = new Array();
					
					for (var i = 0;i<row1-1;i++){
						
							add_row('sale_detail');
					}
					for (i = 0; i<row2-1;i++){
						add_row('sale_detail_2');
					}
					for (i = 0; i<row3-1;i++){
						add_row('sale_sundry_1');
					}
					for (i = 0; i<row4-1;i++){
						add_row('sale_sundry_2');
					}
					for(i=0;i<JSON.parse(response[0]).length;i++){
						if(check_input(hdr1[i],JSON.parse(response[0])[i])){
							hdr1[i].value = JSON.parse(response[0])[i];
						}
					}
					for(i=0;i<JSON.parse(response[1]).length;i++){
						if(check_input(hdr2[i],JSON.parse(response[1])[i])){
							hdr2[i].value = JSON.parse(response[1])[i];
						}
					}
					for(i=0;i<JSON.parse(response[2]).length;i++){
						if(check_input(dtl1[i],JSON.parse(response[2])[i])){
							dtl1[i].value = JSON.parse(response[2])[i];
						}
					}
					for(i=0;i<JSON.parse(response[3]).length;i++){
						if(check_input(dtl2[i],JSON.parse(response[3])[i])){	
							dtl2[i].value = JSON.parse(response[3])[i];
						}
					}
					for(i=0;i<JSON.parse(response[4]).length;i++){
						if(check_input(sundry1[i],JSON.parse(response[4])[i])){
							sundry1[i].value = JSON.parse(response[4])[i];
						}
					}
					for(i=0;i<JSON.parse(response[5]).length ;i++){
						if(check_input(sundry2[i],JSON.parse(response[5])[i])){
							sundry2[i].value = JSON.parse(response[5])[i];
						}
					}
					show_fields();	
					sundry_selection();
					//get_totals();
			}
		});
	}else{
		show_fields();
		
	}		///////////////////////////////////////////////////////////////
}

function retrive_purchase(){
	var vno = get_vno_from_url();
	//alert("url = "+vno[0]);
	if(vno[0]){ //alert("now here");
		$.ajax({  
			url:server_url,  
			method:"POST",  
			data:{vno:vno[0],flag:24},  
			success:function(data){	
				var response = JSON.parse(data);//alert(response);
				///////////////////////////////////////////////////////////////
				var hdr1 = document.getElementsByClassName("sale_header1");
				var hdr2 = document.getElementsByClassName("sale_header2");
				var dtl1 = document.getElementsByClassName("sale_detail1");
				var dtl2 = document.getElementsByClassName("sale_detail2");
				var sundry1 =  document.getElementsByClassName("sale_sundry1"); 
				var sundry2 =  document.getElementsByClassName("sale_sundry2"); 
				var row1 = JSON.parse(response[2]).length/dtl1.length;
				var row2 = JSON.parse(response[3]).length/dtl2.length;
				var row3 = JSON.parse(response[4]).length/sundry1.length;
				var row4 = JSON.parse(response[5]).length/sundry2.length;
				var temp = new Array();
				
				for (var i = 0;i<row1-1;i++){
					add_row('sale_detail');
					insert_modal(1);
				}
					insert_modal(1);
				for (i = 0; i<row2-1;i++){
					add_row('sale_detail_2');
					insert_modal(0);
				}
					insert_modal(0);
				for (i = 0; i<row3-1;i++){
					add_row('sale_sundry_1');
				}
				for (i = 0; i<row4-1;i++){
					add_row('sale_sundry_2');
				}
				for(i=0;i<JSON.parse(response[0]).length;i++){
					if(check_input(hdr1[i],JSON.parse(response[0])[i])){
						hdr1[i].value = JSON.parse(response[0])[i];
					}
				}
				for(i=0;i<JSON.parse(response[1]).length;i++){
					if(check_input(hdr2[i],JSON.parse(response[1])[i])){
						hdr2[i].value = JSON.parse(response[1])[i];
					}
				}
				for(i=0;i<JSON.parse(response[2]).length;i++){
					if(check_input(dtl1[i],JSON.parse(response[2])[i])){
						dtl1[i].value = JSON.parse(response[2])[i];
					}
				}
				for(i=0;i<JSON.parse(response[3]).length;i++){
					if(check_input(dtl2[i],JSON.parse(response[3])[i])){	
						dtl2[i].value = JSON.parse(response[3])[i];
					}
				}
				for(i=0;i<JSON.parse(response[4]).length;i++){
					if(check_input(sundry1[i],JSON.parse(response[4])[i])){
						sundry1[i].value = JSON.parse(response[4])[i];
					}
				}
				for(i=0;i<JSON.parse(response[5]).length ;i++){
					if(check_input(sundry2[i],JSON.parse(response[5])[i])){
						sundry2[i].value = JSON.parse(response[5])[i];
					}
				}
				for(i=0;i<JSON.parse(response[6]).length ;i++){
					var str = '<table class="modal_table">';
					var optns='';
					
					for(var j = 0;j<JSON.parse(response[6])[i].length ;j = j + 3){
						if(JSON.parse(response[6])[i][j + 2]=="SELECT"){
							optns='<select class="input-field" style="width:100%"><option>'+JSON.parse(response[6])[i][j + 1]+'</option></select>';
						}else{
							optns='<input type="text" class="input-field" value="'+ JSON.parse(response[6])[i][j + 1] +'"/>';	
						}
						str += '<tr style="padding-bottom: 20px" class="'+ JSON.parse(response[6])[i][j]+'" name ="p_fields[]">';
						str += '<td style="width: 50% "  ><label class="ilabel">'+ JSON.parse(response[6])[i][j]+' :</label></td>';
						str += '<td style="">'+optns+' </td>';
						str += '</tr>';
					}
					str += '</table>';
					$(".purchaseBox1").eq(i).html(str);
				}
				for(i=0;i<JSON.parse(response[7]).length ;i++){ alert("jello");
					var str = '<table class="modal_table">';
					var optns='';
					
					for(var j = 0;j<JSON.parse(response[7])[i].length ;j = j + 3){
						if(JSON.parse(response[7])[i][j + 2]=="SELECT"){
							optns='<select class="input-field" style="width:100%"><option>'+JSON.parse(response[7])[i][j + 1]+'</option></select>';
						}else{
							optns='<input type="text" class="input-field" value="'+ JSON.parse(response[7])[i][j + 1] +'"/>';	
						}
						str += '<tr style="padding-bottom: 20px" class="'+ JSON.parse(response[7])[i][j]+'" name ="p_fields[]">';
						str += '<td style="width: 50% "  ><label class="ilabel">'+ JSON.parse(response[7])[i][j]+' :</label></td>';
						str += '<td style="">'+optns+' </td>';
						str += '</tr>';
					}
					str += '</table>';
					$(".purchaseBox1").eq(i).html(str);
				}
				show_fields();	
				sundry_selection();
				//get_totals();
			}
		});
	}else{
		show_fields();
		
	}		///////////////////////////////////////////////////////////////
}

function purchasebox(data){
	var str = '<table class="modal_table">';/*
	for(var i = 0; i<data.length; i++){
			var opt="";
			var dd = explode("~",data[i]);
			if(explode("~",data[i])[1]=="Input"){
				var s='<input type="text" class="input-field" />';
			}else{
				if(dd.length>2){
					
					var temp =explode(",",dd[2]);
					for($i=0;$i<sizeof($temp);$i++){
						$opt .= '<option>'.$temp[$i].'</option>';
					}
				}
				$s='<select class="input-field" style="width:100%">'.$opt.'</select>';
			}
//									<td style="text-align: right;width: 50% "  ><label class="ilabel">'.explode("~",$d)[0].' :</label></td>
//									<td style="margin-bottom:20px;border: 1px solid grey;">'.$s.' </td>
									
			$str .=' 				<tr style="padding-bottom: 20px" class="'.explode("~",$d)[0].'" name ="p_fields[]">
									<td style="width: 50% "  ><label class="ilabel">'.explode("~",$d)[0].' :</label></td>
									<td style="">'.$s.' </td>
									</tr>';
		}
		*/
	str = str + '</table>';
}

function check_input(e,val){
	if( e.tagName== "SELECT"){
		var temp=[];
		temp.push(val);
		add_option(e,temp);
		e.value = val;
		return 0;
	}else if(e.tagName== "INPUT" && e.type=="checkbox"){
		if(val=="on"){
			e.checked = true; 
			
		}else{
			e.checked = false;
		}
	}else{
		return 1;
	}
}

function forget_password(){
	alert("Please Contact your Admin.");
}

function show_side_menu(){
	$("#nav-placeholder").load("side-menu-html.html");
}
function save_permission_values(){ 
	var username = document.getElementById('username').value;
	var pagename = document.getElementById('pagename').value; 
	var values = document.getElementsByName("checkbox[]");
	var text_value = document.getElementsByName("txt[]");
	var json_array = new Array();
	for(var i = 0; i< values.length;i++){
		if(values[i].checked){
			json_array.push(text_value[i].innerHTML); 
		}
	}
	var jsondata = JSON.stringify(json_array);
	if (username == "") {
		alert("Please select username");
		document.getElementById('username').focus();
		return false;
	}
	if (pagename == "") {
		alert("Please select pagename");
		document.getElementById('pagename').focus();
		return false;
	} //alert("page ="+jsondata);
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			username: username,
			jsondata: jsondata,
			pagename: pagename,
			flag:5
		},
		success: function (data) {alert(data);
			//$("#nav-placeholder2").html(data);		
		}
	});
}
function check_all_checkboxes(){
	var cbk = document.getElementsByName("checkbox[]");
	for(var i = 0; i<cbk.length;i++){
		cbk[i].checked = true ;
	}	
}
function uncheck_all_checkboxes(){
	var cbk = document.getElementsByName("checkbox[]");
	for(var i = 0; i<cbk.length;i++){
		cbk[i].checked = false ;
	}	
}
function get_options_pre(mySelect,flag,jsondata){
	//if(flag==8){alert("data");}
	if(mySelect.options.length ==0){
		get_options(mySelect,flag,jsondata);
	}	
}
function get_options(mySelect,flag,jsondata){
	//if(flag==12){alert("going");}
	var initial_value = mySelect.value;
	if(mySelect.length>0){ 
		for (var i=0; i<mySelect.length; i++){
			mySelect.removeChild(mySelect.getElementsByTagName('OPTION')[i]);
		}
		mySelect.length=0;
	}
	mySelect.innerHTML = '';
	
	$.ajax({  
		url:server_url,  
		method:"post",  
		data:{flag:flag, jsondata:jsondata},  
		success:function(data){//if(flag==12){alert(data );}
			var unit_array = JSON.parse(data);
			add_option(mySelect,unit_array);
			//mySelect.value = initial_value;
			
		}
	});
}	
function add_option(mySelect,unit_array){
	for(i = 0; i< unit_array.length; i++){
		var	newOption = document.createElement('option');
		newOption.value = unit_array[i];

		// Not all browsers support textContent (W3C-compliant)
		if (typeof newOption.textContent === 'undefined')
		{
			newOption.innerText = unit_array[i];
		}
		else
		{
			newOption.textContent = unit_array[i];
		}
		mySelect.appendChild(newOption);
	}
}
function show_permission_values(){
	var username = document.getElementById('username').value;
	var pagename = document.getElementById('pagename').value; 
	if (username == "") {
		alert("Please select username");
		document.getElementById('username').focus();
		return false;
	}
	if (pagename == "") {
		alert("Please select pagename");
		document.getElementById('pagename').focus();
		return false;
	}
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			username: username,
			pagename: pagename,
			flag:4
		},
		success: function (data) {//alert(data);
			$("#nav-placeholder2").html(data);		
		}
	});
}
function sign_up() {
	var sign_up_values =  document.getElementsByClassName("signup");
	var temp_array = new Array();
	for(var i = 0; i <sign_up_values.length;i++){
		if(sign_up_values[i].value==""){
			alert("Please enter the " + sign_up_values[i].placeholder );
			sign_up_values[i].focus();
			return false;
		}
		
		if(sign_up_values[2].value!==sign_up_values[3].value){
			alert("password do NOT match");
			return false;
		}
		temp_array.push(sign_up_values[i].value);
	}
	var json_data = JSON.stringify(temp_array);
	
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			jsondata: json_data,
			flag:1
		},
		success: function (data) {
			alert(data);
			reset_login();
		}
	});
}

$("body").keydown(function(event) {
        if(event.which == 113) { //F2
            if(document.getElementById("login")){
				if(document.getElementById("login").hidden==false){
					login();
				}else if(document.getElementById("signup").hidden==false){
					sign_up();
				}
			}else if(document.getElementById("sale_f2")){
				$("#sale_f2").click();
			}else if(document.getElementById("permission2_f2")){
				$("#permission2_f2").click();
			}else if(document.getElementById("permission1_f2")){
				$("#permission1_f2").click();
			}else if(document.getElementById("f2")){ 
				$("#f2").click();
			}
				
			
			return false;			
		} 
        else if(event.which == 114) { //F3
            if(document.getElementById("f3")){ 
				$("#f3").click();
			}
            return false;
        }
 });
function reset_login(){
$('.centre').find('input').val('');
}
function hide_all(){
	var fields = document.getElementsByName("p_fields[]");
	for(var i = 0; i<fields.length;i++){
		$('.'+fields[i].className).hide();
	}
}
function show_fields(){
	hide_all();
	$.ajax({
		url: server_url,
		method: "POST",
		data: {flag:2},
		success: function (mydata) {//alert("mydata = "+ mydata);
			if(mydata!=="*"){
				if(mydata !== ""){		
					var data = JSON.parse(mydata);
					for(var i = 0 ; i<data.length;i++){
						for(var j = 0 ; j<document.getElementsByClassName(data[i]).length;j++){
							$('.'+document.getElementsByClassName(data[i])[j].className).show();
						}
					}
				}else{
					window.location = "dashboard.html";
					console.log("you are not authorised to view the requested page.");
				}
			}else{
				window.location = "login.html";
				console.log("you are not authorised to view this page. Please login");
			}
		}
	});	
}
function login() {
	var username = document.getElementById('username').value;
	var password = document.getElementById('password').value;
	
	if (username == "") {
		alert("Please enter your username");
		document.getElementById('username').focus();
		return false;
	}
	if (password == "") {
		alert("Please enter your password");
		return false;
	}
	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			username: username,
			password: password,
			flag:0
		},
		success: function (data) {alert(data);
			if(data==0){
				alert("Incorrect username or password !!!");
				
			}
			else{
				var u = document.URL.substr(0,document.URL.lastIndexOf('/'));
				window.open(u+data,"_self");
			}
			reset_login();
			
		}
	});
}

function hide_signin(){
	var div_class = document.getElementsByClassName("signin"); 
	for(var i =0;i<div_class.length;i++){
		div_class[i].hidden = true;
	}
}

function sign_in(id){
	hide_signin();
	document.getElementById(id).hidden=false;
	document.getElementsByClassName(id)[0].focus();
}


function fetch_data(){
//show_fields();
   $.ajax({  
		url:server_url,  
		method:"POST",  
		data:{flag:15},
		success:function(data)
		{
			//alert(data);
			if(data == "*"){
				window.location = "login.html";
			}else{
				showDB(data);
			}
		}  
	});  
   }
function open_voucher(vno){
	$.ajax({  
		url:server_url,  
		method:"POST",  
		data:{flag:17,vno:vno},
		success:function(page)
		{
			alert(JSON.parse(page)+"?vno="+vno);
			window.open(JSON.parse(page)+"?vno="+vno);
		}  
	});  
	
	
}   
function showDB(data){
	var tblElement=document.getElementById("datatable");
	var tbodyData="";
	var dataArray=JSON.parse(data);
	
	var voucher = dataArray["voucher"];
	var puser = dataArray["puser"];
	var uname = dataArray["uname"];
	var curr_dt = dataArray["curr_dt"];
	//alert(curr_dt);
	var usr = "";
	// create user list
	for (var i = 0; i < puser.length; i++) {
		usr += "<option>" + puser[i]['USERNAME'] + "</option>";//alert(puser[i]['USERNAME']);
	}	
	
	for (var i = 0; i < voucher.length; i++) { //alert(voucher[i]["vno"]);
		tbodyData += "<tr>";
		tbodyData += "<td style='color: blue'><a  target='_blank' onclick='open_voucher(this.innerHTML);'>"+voucher[i]['vno']+"</a></td>";
		tbodyData += "<td>"+ voucher[i]['eff_date'] + "</td>";
		tbodyData += "<td >"+ voucher[i]['v_detail'] + "</td>";
		tbodyData += "<td >"+ voucher[i]['forwarded_by'] + "</td>";
		
		tbodyData += "<td ><select  style='border : 0 ; width:100% '  ><option>"+ voucher[i]['assign_to']+"</option>'";
		tbodyData += usr;
		tbodyData += "</select></td>";
		
		tbodyData += "<td ><input type='date'  value='"+ curr_dt + "'  style='border : 0 ; width:100% '/></td>";
		tbodyData += "<td ><i class='fa fa-check' aria-hidden='true'  >  </i></td>";
		tbodyData += "<td ><i class='fa fa-times' >  </i></td>";
		 
	
		tbodyData += "</tr>";
	}
	tblElement.innerHTML = tbodyData;
	
 }

$( document ).ready(function() {
/*	$.ajax({
		url: server_url,
		method: "POST",
		data: {
			flag:19
		},
		success: function (data) {
			alert(data);
			//window.location = data;
		}
	});
    //console.log( "ready!" );
	*/
});