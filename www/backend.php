<?php
include_once("DBConnection.php");

$sql9 = "Select DISTINCT USERNAME from profile where delete_flag = 0 and verified = 'Y' ";
$sql10 = "SELECT DISTINCT pagename from page_permission_table ";
$sql11 = "SELECT DISTINCT BU_Name from bu_details where delete_flag = 0 and status = 1 ";

if (!isset($_SESSION['username'])) {
		session_start();
}

if($_POST['flag']==0){
	login();
}else if($_POST['flag']==1){
	signup();
}elseif($_POST['flag']==2){
	permission();
}elseif($_POST['flag']==3){
	permission_fields();
}elseif($_POST['flag']==4){
	page_field_list();
}elseif($_POST['flag']==5){
	save_permission();
}elseif($_POST['flag']==6){
	echo get_names($sql9);
}elseif($_POST['flag']==7){
	echo get_names($sql10);
}elseif($_POST['flag']==8){
	echo get_names($sql11);
}elseif($_POST['flag']==9){
	echo consignee_options(json_decode($_POST['jsondata']));
}elseif($_POST['flag']==10){
	$fieldname= $_POST['jsondata'];
	$sql13 = "Select DISTINCT value from index_table where field_name = '$fieldname' ";
	echo get_names($sql13);
}elseif($_POST['flag']==11){
	$buname= json_decode($_POST['jsondata']);
	$sql14 = "Select item_name from item_table where bu = (select bu from bu_details where BU_Name = '$buname[0]') and delete_flag = 0 and status = 1 ";
	//echo $sql14;
	echo get_names($sql14);
}elseif($_POST['flag']==12){
	$buname= $_POST['jsondata'];
	$sql18 = "Select unit1,unit2,unit3 from item_table where item_name = '$buname' and delete_flag = 0 and status = 1 ";
	//echo $sql18;
	echo get_names($sql18);
}elseif($_POST['flag']==13){
	if($_POST['pflag']== 0){
		sales();
	}else{
		purchase();
	}
}elseif($_POST['flag']==14){
	//$sql20="SELECT DISTINCT hdr1,hdr2,dtl1,dtl2,sundry1,sundry2 from sale_table where vno = '".$_POST['vno']."'";
	$sql20="SELECT DISTINCT hdr1,hdr2,dtl1,dtl2,sundry1,sundry2 from sale_table where 
	id=(select 	max(id) from sale_table WHERE
					eff_date = ( select max(eff_date) from sale_table WHERE  
										vno = '".$_POST['vno']."'   ) Limit 1 ) " ;
	echo get_names($sql20);
}elseif($_POST['flag']==15){
	dashboard_load();
}elseif($_POST['flag']==16){
	echo print_invoice($_POST['vno'],$_POST['len']);
}elseif($_POST['flag']==17){
	$vtype = explode('/',$_POST['vno'])[2];
	$sql40 ="select page_name from page_voucher_table where v_type = '$vtype'";
	echo get_names($sql40);
}elseif($_POST['flag']==18){
	$fieldname= json_decode($_POST['jsondata']);
	$sql41 = "Select DISTINCT account_name from accounts_table where parent_group =(select GroupName from group_table where group_id =  'Billing Sundry' and bu = (select bu from bu_details where BU_Name ='$fieldname[0]')) ";
	echo get_names($sql41);
	//echo $sql41;
}elseif($_POST['flag']==19){//9649313372 - laxman
	$x=0;
	$pagename = basename(explode("?",$_SERVER['HTTP_REFERER'])[0]);
	if(isset($_SESSION['username'])){
		if($x==0){
			echo $_SERVER['HTTP_REFERER'];
		}else{
			echo "dashboard.html";
		}
	}else{
		echo "login.html";
	}

}elseif($_POST['flag']==20){
	$fieldname= json_decode($_POST['jsondata']);
	$sql43 = " Select Distinct item_group from item_group_table where delete_flag = 0 and bu = (select bu from bu_details where BU_Name = '$fieldname ') ";
	//echo $sql43;
	echo get_names($sql43);
}elseif($_POST['flag']==21){
	add_prod_prop();
}elseif($_POST['flag']==22){
	echo prod_property($_POST['grp'],$_POST['bu']);
}elseif($_POST['flag']==23){
	$bu  = $_POST['bu'];
	$sql45 = "Select property from item_group_table where bu = (select bu from bu_details where BU_Name = '$bu') and item_group = (select item_group from item_table where bu = (select bu from bu_details where BU_Name = '$bu') and item_name = '".$_POST['jsondata']."') ";
	echo purchaseBox(json_decode(json_decode(get_names($sql45))[0]));
}elseif($_POST['flag']==24){
	//$sql20="SELECT DISTINCT hdr1,hdr2,dtl1,dtl2,sundry1,sundry2 from sale_table where vno = '".$_POST['vno']."'";
	$sql20="SELECT DISTINCT hdr1,hdr2,dtl1,dtl2,sundry1,sundry2, modal1, modal2 from purchase_table where 
	id=(select 	max(id) from purchase_table WHERE
					eff_date = ( select max(eff_date) from purchase_table WHERE  
										vno = '".$_POST['vno']."'   ) Limit 1 ) " ;
	echo get_names($sql20);
}elseif($_POST['flag']==25){
	$sql46 ="SELECT Distinct Description from item_group_table";
	echo get_names($sql46);
}elseif($_POST['flag']==26){
	$bu  = $_POST['bu'];
	$desc  = $_POST['ptype'];
	$sql47 = "Select property from item_group_table where bu = (select bu from bu_details where BU_Name = '$bu') and Description = '$desc' ";
	$str ='<center><div class="sale_head1"><span class="sale_head2">'.$desc .'</span></div></center>';
	
	$str .= purchase_header();
	$str .= build_fields(json_decode(json_decode(get_names($sql47))[0]));			
	$str .= purchase_footer();
	//print_r($str);
	echo $str;
}

function purchaseBox($data){
	$str = '<table class="modal_table">';
	if($data){						
		$str .= build_fields($data);
		$str .='
								
								</table>';
		return $str;
	}else{
		return "Set Parameters from Product_Properties.html";
	}		
							
}

function purchase_footer(){
	$str = '				
				</table>
					<div>
					
					<div class="remark" name="p_fields[]">
					<div style="float:left;display:inline-table;margin-left:25px;width:100%">
						<label style="float:left;width:12.8%" >Remark :</label><input  class = "sale_header1" tabindex="13" id="remark" style="float:left;width:79.5% " list="r_list" /> <datalist name="instant[]" id="r_list"></datalist>
						<br/><hr>
					</div></div></div>
					';
		return $str;			
}
function purchase_header(){
$str ='';	
$str .='
			<table class = "sale_head" style="float:left;margin-left:20px">
					<tr class="date" name="p_fields[]">
						<td><b>Date :</b></td>
						<td ><input type="text" class="sale_header1" name="date" id="date"  tabindex = "1" required="required" /> </td>
					</tr>
					
					<tr class="consignee" name="p_fields[]">
						<td><b>Consignor :</b></td>
						<td><input list="consignee_list" name="company_links[]" class = "sale_header1"  name="account_master" id="consignee" tabindex="3"  onfocus="get_options(document.getElementById("consignee_list"),9,get_bu(0))" /><datalist id = "consignee_list"></datalist></td>
					</tr>
					<tr class="xconsignee" name="p_fields[]">
						<td><b>X Consignor :</b></td>
						<td><input  list="consignee_list2" name="company_links[]" class = "sale_header2" onblur="hide_table2()" name="account_master" id="xconsignee" tabindex="12"  onfocus="get_options(document.getElementById("consignee_list2"),9,get_bu2(0))" /><datalist id = "consignee_list2"></datalist></td>
					</tr>
					
					<tr class="invoice" name="p_fields[]">
						<td><b>Bill No :</b></td>
						<td><input id="bill_no" tabindex="-1"  class = "sale_header1" readonly align="left"  />  </td>
					</tr>
					<tr class="invoice" name="p_fields[]">
						<td><b>Invoice :</b></td>
						<td><input id="invoice_no" tabindex="-1"  class = "sale_header1" readonly align="left"  />  </td>
					</tr>
					<tr class="transport" name="p_fields[]">
						<td><b>Transport :</b></td>
						<td><input id="transport"  class = "sale_header1" list="instant1" tabindex="4"  /> <datalist id="instant1" name="instant[]"> </datalist>  </td>
					</tr>
					<tr class="gr" name="p_fields[]">
					  <td><b>GR No. :</b></td>
					  <td><input class = "sale_header1"  list="instant2" tabindex="5"/> <datalist id="instant2" name="instant[]"></datalist> </td>
					</tr>
					
					<tr class="vechicle" name="p_fields[]">
						<td><b>Vehicle No. :</b></td>
						<td><input id="vehicle_no" class = "sale_header1"  list="instant3"  tabindex="6"/> <datalist id="instant3" name="instant[]"></datalist> </td>
					</tr>
					<tr class="mobile" name="p_fields[]">
						<td><b>Driver Mobile :</b></td>
						<td><input value="" type="text"  class = "sale_header1" tabindex="8" id="driver" list="driver_instant"/><datalist name="instant[]" id="driver_instant"></datalist></td>
					</tr>
					<tr class="billed_freight" name="p_fields[]">
						<td><b>Billed Frt (Rs) :</b></td>
						<td> <input id="billed_frt"  class = "sale_header1" list="billed_instant" tabindex="11"  /><datalist name="instant[]" id="billed_instant"></datalist> </td>
					</tr>
					<tr class="actual_freight"  name="p_fields[]">
						<td><b>Actual Frt (Rs) :</b> </td>
						<td><input id="act_frt" class = "sale_header1"  list="actual_instant" tabindex="9"  /><datalist name="instant[]" id="actual_instant"></datalist> </td>
					</tr>
					<tr class="item_1" name="p_fields[]"  >
						<td>Item :</td>
						<td class="item_1" >
							<select name="company_links[]"  style="width:100%" class = "sale_detail1 select1 item1" onblur="item_property(this,1);"  onfocus="get_options(this,11,get_bu(0))"><option>select item</option></select></td>
					</tr>
					<tr  class="qty1" name="p_fields[]" >
						<td >Quantity</td>
						<td class="qty1" >
							<input class = "sale_detail1 quantity1" onblur="get_basic_amount(0)" name="qty[]"  style="width:100%"  type="text" placeholder="quantity" />
						</td>
					</tr>
					<tr class="unit1" name="p_fields[]" >
						<td>Unit</td>
						<td class="unit1" >
							<select name="item_links1[]" class = "sale_detail1"  style="width:100%"  onfocus="get_options(this,12,get_item_2(this))" ><option>Select Unit</option></select>
						</td>
					</tr>
					<tr  class="price1" name="p_fields[]">
						<td>Price</td>
						<td class="price1">
							<input  class = "sale_detail1" onblur="get_basic_amount(0)" name="price[]" style="width:100%"  placeholder="price" />
						</td>
					</tr>
					<tr  class="discount1" name="p_fields[]">
						<td>Discount</td>
						<td class="discount1" >
							<input  class = "sale_detail1" onblur="get_basic_amount(0)" name="discount[]" style="width:100%" type="text" placeholder="%" />
						</td>
					</tr>
					<tr  class="basic_amt1" name="p_fields[]">
						<td>Amount</td>
						<td class="basic_amt1"  >
							<input  class = "sale_detail1 basic1" onblur="get_basic_amount(1)" name="basic_amt[]" style="width:100%" type="text" placeholder="Basic Amount" />
						</td>
					</tr>';
		return $str;			
}
function build_fields($data){
	$str = '';
	foreach($data as $d){
			$opt="";
			$dd = explode("~",$d);
			if(explode("~",$d)[4]=="Input"){
				$s='<input type="text" class="input-field" />';
			}else{
				if(sizeof($dd)>2){
					
					$temp =explode(",",$dd[5]);
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
		return $str;
}

function add_prod_prop(){
	$sql44 = "UPDATE item_group_table SET Description = '".$_POST['desc']."', property = '".$_POST['jsondata']."' WHERE item_group = '".$_POST['grp']."' and BU = (select bu from bu_details where BU_Name = '".$_POST['bu']."')";
	$connect = $GLOBALS['connect'];
	$result = mysqli_query( $connect, $sql44 );
	if($result==1){
		echo "Data updated";
	}else{
		echo "Data Not updated";	
		}
}

function prod_property($grp,$bu){
	$sql45 = "Select property, Description from item_group_table where item_group = '$grp' and BU = (select bu from bu_details where BU_Name = '$bu')";
	$values = json_decode(get_names($sql45));
	$prop = json_decode($values[0]);
	//$prop = json_decode(get_names($sql45))[1];
	//print_r($values[1]);
	$del ='delete_row_index("product_detail",this)';
	$add = 'add_row("product_detail");showOptionsNew(this)';
	$str = "<div style='overflow-x:auto;'> 
				<div style='margin-left:5%'>
					<label>
						Purchase Description :
					</label>
					<input type='text' id='purchase_desc'placeholder='eg. Stone Purchase' value='$values[1]'/>
				</div>
				<div >
					<table class = 'product_detail' >
							<tr>
								<th>Field Name</th>
								<th>Unit</th>
								<th>Lower Limit</th>
								<th>Upper Limit</th>
								<th>Field Type</th>
								<th></th>
								<th></th>
							</tr>";
	if($prop){
		foreach($prop as $p){
			$v =explode("~",$p);
			$st = 'Select';
			$disp='hidden';
			if($v[4]!=="Input"){
				$disp='visible';
				$st="Input";
			}
			$str .="	
								<tr>
									<td><input name='prop_list[]' type='text' value='$v[0]' /></td>
									<td><input name='prop_list[]' type='text' value='$v[1]' /></td>
									<td><input name='prop_list[]' type='text' value='$v[2]' /></td>
									<td><input name='prop_list[]' type='text' value='$v[3]' /></td>
									<td><select onblur='showOptions(this)' name='prop_list[]'><option>$v[4]</option><option>$st </option></select>
									<td>
										<i class='fa fa-times' onclick='$del' ></i>
										<i class='btn-xs d_modal1 fa fa-plus-square' onclick='$add'  ></i>
									</td>
									<td><input class='optns' value='$v[5]' name='prop_list[]' placeholder='Enter options seperates by comma' type='text' $disp style='width:130%' /></td>  
									
								</tr>";
		}
	}else{
		$str .="	
								<tr>
									<td><input name='prop_list[]' type='text'  /></td>
									<td><input name='prop_list[]' type='text'  /></td>
									<td><input name='prop_list[]' type='text'  /></td>
									<td><input name='prop_list[]' type='text'  /></td>
									<td><select onblur='showOptions(this)' name='prop_list[]'><option>Input</option><option>Select</option></select>
									<td><i class='fa fa-times' onclick='$del' ></i>
										<i class='btn-xs d_modal1 fa fa-plus-square' onclick='$add'  ></i>
									</td>
									<td><input class='optns'  placeholder='Enter options seperates by comma'  name='prop_list[]' type='text'  hidden style='width:130%'  /></td>
									
								</tr>";
	}
	$str .="	
						</table>
							
						
					<div style='margin-left:3%'>
						<button id='f3' onclick='property_list()'>Save</button>
					</div>
					<br>
					
				</div>
				
					
			</div>";
			
	return $str;		
}

function print_invoice($vno,$len){
$connect = $GLOBALS['connect'];

$sql38 ="select hdr1,dtl1,sundry1 from sale_table where 
		id=(select 	max(id) from sale_table WHERE
					eff_date = ( select max(eff_date) from sale_table WHERE  
										vno = '$vno'   ) Limit 1) " ;

$result3 = mysqli_query( $connect, $sql38 );
$row3 = mysqli_fetch_array( $result3 ) ;

$dtl = json_decode($row3['dtl1']);	
$hdr = json_decode($row3['hdr1']);	
$sndry = json_decode($row3['sundry1']);	

$sql36 = "Select * from bu_details where BU_Name = '$hdr[1]'";
$sql37 = "Select * from accounts_table where account_name = '$hdr[3]'";

$result = mysqli_query( $connect, $sql36 );
$result2 = mysqli_query( $connect, $sql37 );

$row = mysqli_fetch_array( $result ) ;
$row2 = mysqli_fetch_array( $result2 ) ;

$hsn= array();
$qty= array();
$basic = array();
$item_array = array();

for($j=0;$j<sizeof($dtl);$j = $j + $len){
	array_push($item_array,$dtl[$j]);
	array_push($qty,$dtl[$j + 6]);
	array_push($basic,$dtl[$j+10]);
	
	
}

$hsn = json_decode(get_hsn($item_array));
$y = add_sundry(get_tax_amount(json_decode(calculate_tax($hdr,$item_array)),$basic,$qty),$sndry);

$qty_ttl = 0;
$bsc_ttl = 0;
$tax_ttl = 0;
$amt_ttl = 0;
$k=1;

$values[1]="GST";
$values[2] = "Original/Duplicate/Triplicate"; 
$grand_total = 0;

if(!empty($_POST['con'])){
	if($_POST['con']==0){
		$con = "Consignee";
	}else{
		$con = "Consignor";
	}
}else{
	$con = "Consignee";
}

if(sizeof($sndry)>0){
	if($sndry[sizeof($sndry) - 1] == "on"){
		$roundoff = 0;
	}else{
		$roundoff = 2;
	}
}else{
	$roundoff = 0;
}


$str = '<div id="content" class="container" style="width:100%;border: 1px solid;padding-left: 3px;padding-right: 3px;margin-top: 0px" >

<div class="page-header" style="margin: 0px;padding: 0px;margin-top:  0px;margin-bottom: 10px;padding-bottom: 5px" >
   <center><small style="float: left"><strong>GST : '. $row['gst'].'</strong></small> <small><strong>'.  $values[1].' Invoice</strong></small> <small style="float: right"><strong>'.  $values[2].' Copy</strong></small></center>
</div>

<div class="container" style="width:100%" >
    <div class="row" >
        <div class="col-xs-12" >
            <div class="text-center"  >
                <h2 style="padding: 0px;margin: 0px">'. $row['BU_Name'].'<br/><h4><small>'. $row['a1'].',' .$row['a2'].',' .$row['a3'].", ".$row['state'].'<br> email: '.$row['email'].', mobile: '.$row['mobile'].'</small></h4></h2>
            </div>
            <hr>
			<h4>
            <div class="row" >
                <div class="col-xs-12 col-md-3 col-lg-3 pull-left" style="width: 31%">
                    <div class="panel panel-default height">
                        <div class="panel-heading" >Billing Details</div>
                        <div class="panel-body">
							<table  style="width: 100%">
								<tr>
									<td colspan=2><strong><input type = "text" style="border:0px" value="'. $row2['account_name'].'"/></strong></input></td>
								</tr>
								<tr>
									<td colspan=2><input type = "text" style="border:0px" value="'. $row2['a1_billing'].'"/></td>
								</tr>
								<tr>
									<td colspan=2><input type = "text" style="border:0px" value="'. $row2['a2_billing'].'"/></td>
								</tr>
								<tr><td><input type = "text" style="border:0px" value="'. $row2['a3_billing'].'"/></td></tr>
								<tr>
									<td><strong>STATE : </strong>'. $row2['state'].'</td>
								</tr>
								<tr>
									<td><strong>GST :&nbsp;&nbsp;&nbsp;&nbsp; </strong><input type = "text" style="border:0px" value="'. $row2['gst'].'"/></td>
								</tr>
							</table>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3 col-lg-3" style="width: 38%">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Invoice Details</div>
                        <div class="panel-body">
							<table  style="width: 100%">
								<tr>
									<td  style="width: 30%"><strong><small>Invoice No. :</small></strong></td>
									<td  style="width: 70%">'. $hdr[2].'</td>
								</tr>
								<tr>
									<td><strong><small>Dated :</small></strong></td>
									<td>'. $hdr[0].'</td>
								</tr>
								<tr>
									<td><strong><small>GR/RR No. :</small></strong></td>
									<td>'. $hdr[5].' / '. $hdr[0].'</td>
								</tr>
								<tr>
									<td><strong><small>Transport :</small></strong></td>
									<td>'. $hdr[4].'</td>
								</tr>
								<tr>
									<td><strong><small>Vehicle No. :</small></strong></td>
									<td>'. $hdr[6].'</td>
								</tr>
								<tr>
									<td><strong><small>Station :</small></strong></td>
									<td>'. $hdr[7].'</td>
								</tr><tr>
									<td><strong><small>Reference No :</small></strong></td>
									<td><input type = "text" style="border:0px"/></td>
								</tr>
							</table>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3 col-lg-3 pull-right" style="width: 31%">
                    <div class="panel panel-default height">
                        <div class="panel-heading">Shipping Details</div>
                        <div class="panel-body">
                            <table  style="width: 100%">
								<tr>
									<td colspan=2><strong><input type = "text" style="border:0px" value="'. $row2['account_name'].'"/></strong></td>
								</tr>
								<tr>
									<td colspan=2><input type = "text" style="border:0px" value="'. $row2['a1_shipping'].'"/></td>
								</tr>
								<tr>
									<td colspan=2><input type = "text" style="border:0px" value="'. $row2['a2_shipping'].'"/></td>
								</tr>
								<tr><td><input type = "text" style="border:0px" value="'. $row2['a3_shipping'].'"/></td></tr>
								<tr>
									<td><strong>STATE : </strong>'. $row2['state'].'</td>
								</tr>
								<tr>
									<td><strong>GST : </strong><input type = "text" style="border:0px" value="'. $row2['gst'].'"/></td>
								</tr>
							</table>
                        </div>
                    </div>
                </div>
            </div></h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
			<strong>Other Details[if any] : </strong>'. $hdr[12].'
			
<div class="panel panel-default">
                <div class="panel-heading">
					
                    <h4 class="text-center"><strong>Invoice Details</strong></h4>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed" >
                            <thead>
                                <tr>
									<td><strong>S.N.</strong></td>
                                    <td><strong>Description Of Goods</strong></td>
									<td><strong>HSN Code</strong></td>
									<td ><strong>Qty.</strong></td>
									<td><strong>Unit</strong></td>
									<td ><strong>Price</strong></td>
									<td ><strong>Discount</strong></td>
									<td ><strong>Basic Amt(Rs)</strong></td>
									<td ><strong>Tax</strong></td>
									<td ><strong>Amount(Rs)</strong></td>
								</tr>
                            </thead>
                            <tbody>';

for($j=0;$j<sizeof($dtl);$j = $j + $len){
	if($dtl[$j + 10] > 0){	
		$row_total = 0;	
		$str .= '						
								<tr  >
									<td >'.   $k  .'</td>
                                    <td><input type = "text" style="border:0px" value="'.$dtl[$j].'"/><br><sub>';
									if($dtl[$j+2]!==''){
										$str .= '
										Packing: '.$dtl[$j+2].' Kg<br><br><br>';
									}
									if($dtl[$j+3]!==''){
										$str .= '
										Print : '. $dtl[$j+3].'<br><br><br>
									';}
									if($dtl[$j+4]!==''){
										$str .= '
										Bags: '. $dtl[$j+4].'<br><br><br>
									';}
									if($dtl[$j+2]!==''){
										$str .= '
										No. Of Bags : '. $dtl[$j+1].'
									';}
									$str .= '</sub></td>
                                    <td ><input type = "text" style="border:0px" value="'. $hsn[ $k - 1].'"/></td>
                                    <td >'. $dtl[$j + 6].'</td>
									<td >'. $dtl[$j + 7].'</td>
									<td >'. number_format($dtl[$j + 8],2).'</td>
									<td >'. $dtl[$j + 9].' %</td>
									<td >'. number_format($dtl[$j + 10],2).'</td>
									<td ><table>';
									$row_total = $row_total + $dtl[$j + 10];
									for($x=0;$x<3;$x++){
										if($y->tax_matrix[2 *  $x + 6 * $k - 5 ]!=0){	
											$row_total = $row_total + $y->tax_matrix[2 *  $x + 6 * $k - 5 ];
											$tax_ttl = $tax_ttl + $y->tax_matrix[2 *  $x + 6 * $k - 5 ] ;
											$str .='
													<tr style="height:20px"><td><strong>'. number_format($y->tax_matrix[2 *  $x + 6 * $k - 5 ],2) .'</strong></td></tr>
													<tr style="height:20px"><td><sup>'. $y->tax_matrix[2 *  $x + 6 * $k - 6 ] .'</sup></td></tr>';
										}
									}
										$str .='		
										</table></td>
                                    <td class="text-center">'. number_format($row_total,2).'</td>
                                </tr>
								';	
								$k = $k + 1;
								$qty_ttl = $qty_ttl + $dtl[$j + 6] ;
								$bsc_ttl = $bsc_ttl + $dtl[$j + 10] ;
	}
}			
								$amt_ttl = $bsc_ttl + $tax_ttl ;
								$grand_total = $grand_total + $amt_ttl;
								$str .='
                                <tr>
                                    <td class="highrow"></td>
									<td class="highrow"><strong>Total</strong></td>
									<td class="highrow"></td>
									<td class="highrow"><strong>'. number_format($qty_ttl,2).'</strong></td>
									<td class="highrow"></td>
									<td class="highrow"></td>
									<td class="highrow"></td>
									<td class="highrow"><strong>'. number_format($bsc_ttl,2).'</strong></td>
									<td  class="highrow"><strong>'. number_format($tax_ttl,2).'</strong></td>
                                    <td class="highrow text-center"><strong>'. number_format($amt_ttl,2).'</strong></td>
                                </tr>';
for($j=0;$j<sizeof($sndry)-1;$j = $j + 8){	
	if($sndry[$j + 7] >0){
								$grand_total = $grand_total + $sndry[$j + 7];	
								$str .= ' 
								<tr>
                                    <td class="emptyrow" colspan=4></td>
                                    <td colspan=1 class="text-right"><strong><small>'. $sndry[$j + 4].' </small></strong></td>
									<td colspan=4 class="text-left"><strong><small> for <input type = "text" style="border:0px" value="'.$sndry[$j + 5].' @ '.$sndry[$j + 6].'%"/> </small></strong></td>
									<td class="text-center"><strong><small>'. number_format($sndry[$j + 7],2).'</small></strong></td>
								</tr>';
	}
}
								
for($q=0;$q<sizeof($y->sundry_tax);$q=$q+2){								
	if($y->sundry_tax[1 + $q  ] >0){							
							$grand_total = $grand_total + $y->sundry_tax[1 + $q  ];
								$str .= ' 
								<tr>
                                    <td class="emptyrow" colspan=7></td>
                                    <td colspan=2 class="text-left"><strong><small> for '.$y->sundry_tax[$q].'</small></strong></td>
									<td class="text-center"><strong><small>'. number_format($y->sundry_tax[1 + $q  ],2).'</small></strong></td>
								</tr>';
	}
}
								$str .= '
								<tr>
                                    <td colspan=6 class="emptyrow"></td>
									<td colspan=4 class="text-left emptyrow"><strong><small>Note: Freight to be Paid by : '.$con.'</small></strong></td>
									
                                </tr>
								<tr>
                                    <td class="emptyrow"></td>
                                    <td class="" colspan=1><strong><small>Total CGST : '. number_format($y->total_cgst,2).'</small></strong></td>
                                    <td class="" colspan=3><strong><small>Total SGST : '. number_format($y->total_sgst,2).'<br></strong></td>
                                    <td class="" colspan=2></td>
                                    <td class="" colspan=2><strong><small>GRAND TOTAL (Rs) : </small></strong></td>
									<td class="text-center" ><strong><small>'. number_format(round($grand_total,$roundoff),2) .'</small></strong></td>
								</tr>
                                <tr>
                                    <td class="emptyrow"></td>
                                    <td class="emptyrow"><strong><small>Total IGST : '. $y->total_igst.'<br></strong></td>
                                    <td class="emptyrow" colspan=2></td>
									<td class="text-right emptyrow"  colspan=6><strong><small>In Word : Rupees '. to_words(round($grand_total,$roundoff)).' Only</small></strong></td>
								</tr>
                                <tr>
									<td colspan=7 class=""><strong>Terms & Conditions </strong><br><br><small>E. & O.E.<br><sub>1. Goods once sold will not be taken back.<br><br><br>2. Interest @18% p.a. will be charged if the payment is not made with in the stipulated time.<br><br><br>3. Subject to Alwar Jurisdiction only.</sub></small></td>
                                    <td colspan=3 class="text-right"><strong><br>For '. $row['BU_Name'].'<br><img style="width:130px;height:60px;" src="img/sign1.bmp" alt=""><br>Authorised Signatory</strong></td>
								</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


';

return $str;
}

function to_words($number){ 
	if(is_numeric ($number)){
		$str="";
		$num = explode('.',$number );
		if(sizeof($num)>1){
			$str .= hundreds(100 * (float)number_format($number - floor($number),2));
			return in_words(floor($number)) . " And Paise " . $str;
		}else{
			return in_words($num[0]);
		}
	}else{
		return;
	}	
} 
function in_words($number){ 
	if(is_numeric ($number)){	
		if($number>0){
				
			if($number<10000000){
				return crores($number);
			}else { 
				return in_words((int)($number/10000000))." Crore " . crores($number - 10000000*(int)($number/10000000)) ;
			}
		}else if ($number ==0){
			return "Zero";
		}else{
			return "Minus ". in_words($number * -1);;
		}
	}
}
function crores($number){ 
if($number!==0){	
	if($number<100000){
		return lakhs($number);
	}else if($number<10000000){ 
			return thousands((int)($number/100000))." Lakhs ".lakhs($number%100000); 
	}
}	
}
function lakhs($number){
if($number!==0){	
	if((int)$number<1000){
		return thousands($number); 
	}else if($number<100000){ 
			return hundreds((int)($number/1000))." Thousand ".thousands($number%1000); 
	}
}
}
function thousands($number){ 
if($number!==0){
	if($number<100){
		return hundreds($number); 
	}else if($number<1000){ 
			return hundreds((int)($number/100))." Hundred ". hundreds($number%100); 
	}
}
}
function hundreds($number){
if($number!==0){
	if($number<19){
		return units($number); 
	}else if($number>19){
		return tens((int)($number/10))." ".units($number%10); 
	}
}
}
function units($number){
if($number!==0){
	if($number==0){
		return "Zero";
	}if($number==1){
		return "One";
	}else if($number==2){
		return "Two";
	}else if($number==3){
		return "Three";
	}else if($number==4){
		return "Four";
	}else if($number==5){
		return "Five";
	}else if($number==6){
		return "Six";
	}else if($number==7){
		return "Seven";
	}else if($number==8){
		return "Eight";
	}else if($number==9){
		return "Nine";
	}else if($number==10){
		return "Ten";
	}else if($number==11){
		return "Eleven";
	}else if($number==12){
		return "Twelve";
	}else if($number==13){
		return "Thirteen";
	}else if($number==14){
		return "Fourteen";
	}else if($number==15){
		return "Fifteen";
	}else if($number==16){
		return "Sixteen";
	}else if($number==17){
		return "Seventeem";
	}else if($number==18){
		return "Eighteen";
	}else if($number==19){
		return "Nineteen";
	} 
}
}
function tens($number){
if($number!==0){
	if($number==1){
		return "";
	}else if($number==2){
		return "Twenty";
	}else if($number==3){
		return "Thrirty";
	}else if($number==4){
		return "Fourty";
	}else if($number==5){
		return "Fifty";
	}else if($number==6){
		return "Sixty";
	}else if($number==7){
		return "Seventy";
	}else if($number==8){
		return "Eighty";
	}else if($number==9){
		return "Ninety";
	} 
}
}

function get_hsn($item_array){
	$temp = array();
	$sql39 = "Select item_name, item_code from item_table where item_name IN (".explode(']',explode('[',json_encode($item_array))[1])[0].")";
	
	$x = json_decode(get_names($sql39));
	
	foreach($item_array as $it){
		for($i = 0; $i<sizeof($x); $i=$i + 2){
			if($it== $x[$i]){
				array_push($temp,$x[$i+1]);
			}
		}
	}
	
	return json_encode($temp);
}

function dashboard($vno,$bu,$username,$remark,$vtype){
	
	$assign_to = set_assign_to($username,$vtype);
	
	$sql27 = "INSERT INTO `voucher_table`(`delete_flag`, `vno`, `bu`, `eff_date`, `follow_up_date`, `assign_to`, `forwarded_by`, `status`,`v_detail`) VALUES 
	(0,'$vno','$bu',CURRENT_TIMESTAMP(),CURDATE(),'$assign_to','$username',0,'New SALE Voucher Created!!!') ON  DUPLICATE KEY UPDATE
	`delete_flag` = 0, `bu` = '$bu', `eff_date` = CURRENT_TIMESTAMP(), `follow_up_date` = CURDATE(), `assign_to` ='$assign_to', `forwarded_by` = '$username', `status` = 0 ";
	
	if(mysqli_query( $GLOBALS['connect'], $sql27 )){
		//echo "task updated";
	}else{
		echo "dashboard Error!!";
	}
}

function set_assign_to($login_user,$v_type){
	$connect = $GLOBALS['connect'];
	$assign_to = "";	
	$ap_type= "";	
	$v_status="";
	
	$sql28 = "Select DISTINCT approver,approver_type from approval_table where login_user='$login_user' and voucher_type='$v_type' and delete_flag =0 limit 1 ";
	$sql29 = "Select approver from approval_table where approver_type=1 and voucher_type='$v_type' and delete_flag = 0 limit 1";
			
	$result = mysqli_query( $connect, $sql28 );
	$row = mysqli_fetch_array( $result ) ;
	
	if( mysqli_num_rows($result) >0){
		 return $row[ "approver" ];		
	}else{
		$result = mysqli_query( $connect, $sql29 );		
		$row = mysqli_fetch_array( $result ) ;
		return	$row[ "approver" ];		
	}
}


function dashboard_load(){
	if(isset($_SESSION['username'])){
	
		$connect = $GLOBALS['connect'];
		$login_user = $_SESSION['username'];
		
		$sql15="SELECT vno,eff_date,v_detail,forwarded_by, assign_to,follow_up_date FROM voucher_table where assign_to='$login_user' and follow_up_date <=CURRENT_TIMESTAMP() and delete_flag = 0 and status = 0";
		$result = mysqli_query($connect, $sql15);

		$data = array();
		$query_array = array();

		if ($result->num_rows > 0) {
				while($row = $result->fetch_assoc()) {
					array_push($data,$row);
				}
			} else {
				echo "0 results";
		}
			
		$sql26= "Select USERNAME from profile where priority <=(SELECT priority  FROM profile where USERNAME ='$login_user' ) and username <> '$login_user' and delete_flag = 0 and verified = 'Y'";
		$result1 = mysqli_query($connect,$sql26);

		if ($result1->num_rows > 0) {
				while($row = $result1->fetch_assoc()) {
					array_push($query_array,$row);
				}
			} 
		
		$myObj = new stdClass();
		$myObj->voucher = $data;
		$myObj->puser = $query_array;
		$myObj->uname = $login_user;
		$myObj->curr_dt = date("Y-m-d");
		echo json_encode($myObj );
	
	}else{
		echo "*";
	}
	
}

function sales(){
	$fieldname = json_decode($_POST['hdr1']);
	$fieldname2 = json_decode($_POST['hdr2']);
	$username =$_SESSION[ 'username' ];
	$pgnm ='SALE';
	
	$sql24 = "select bu from bu_details where BU_Name = '$fieldname[1]' ";
	$sql42 = "select bu from bu_details where BU_Name = 'Sample' ";
	$sql25="select fy from fy_table where 
	id=(select max(id) from fy_table WHERE
    eff_date = ( select max(eff_date) from fy_table WHERE  
	  username = '$username' and 
      eff_date <=CURRENT_TIMESTAMP()  ) ) ";
	
	$sql30 = "select DISTINCT approver_type from approval_table where voucher_type = '$pgnm' and login_user = '$username' limit 1";
	
	$bu =json_decode(get_names($sql24))[0];
	$bu2 =json_decode(get_names($sql42))[0];
	
	if($bu==""&& $_POST['hdr2'] == '[""]'){
		echo "Please enter correct values";
	}else{ 
	
		$fy =json_decode(get_names($sql25))[0];
		$typ =json_decode(get_names($sql30))[0];
		
		if($bu==""){
			$vno = autogenerate_voucher_number($_POST['vno'],$pgnm,$fy,$bu2);
		}else{
			$vno = autogenerate_voucher_number($_POST['vno'],$pgnm,$fy,$bu);
		}
		
		$fieldname[2] = $vno;
		$hdr=json_encode($fieldname);
		
		save_instant_data(json_decode($_POST['instant']),$vno);
		
		if($typ == 3){
			$status =1;
		}else{
			$status =0;
		}
		
		$sql19 = "INSERT INTO `sale_table`( `status`, `delete_flag`, `BU`, `vno`, `eff_date`, `user`, `hdr1`, `hdr2`, `dtl1`, `dtl2`, `sundry1`, `sundry2`) values(
		0,0,'$bu','".$vno."',CURRENT_TIMESTAMP(),'".$_SESSION[ 'username' ]."','".$hdr."','".$_POST['hdr2']."','".$_POST['dtl1']."','".$_POST['dtl2']."','".$_POST['sundry1']."','".$_POST['sundry2']."') ";
		
		$y = get_tax_amount(json_decode(calculate_tax($fieldname,json_decode($_POST['item']))),json_decode($_POST['basic']),json_decode($_POST['qty']));
		$x = add_sundry($y,json_decode($_POST['sundry1']));
		
		if(mysqli_query( $GLOBALS['connect'], $sql19 )){
			dashboard($vno,$bu,$username,"New ".$pgnm." Voucher Created!!!",$pgnm);
			$sundry1= json_decode($_POST['sundry1']);
			$sundry2= json_decode($_POST['sundry2']);
		
			if($typ == 3){ //echo $fieldname[0];
				$item_account1 = item_account_list(json_decode($_POST['item']),$bu,"account");
				$item_account2 = item_account_list(json_decode($_POST['item2']),$bu2,"account");
		
				$str = "";
				$stri = "";
				$dtl1 = json_decode($_POST['dtl1']);
				$dtl2 = json_decode($_POST['dtl2']);
				
				if($dtl1[10]!==""){
					for($i=0 ; $i< sizeof($dtl1); $i= $i + 11){
						$str = insert_into_transaction_table($str,$vno,$bu,$fieldname[3],$item_account1[$i / 11],$dtl1[$i + 10],date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[12]);
						$stri = insert_into_item_transaction_table($stri,$vno,date_format(date_create($fieldname[0]),"Y-m-d"),$bu,$dtl1[$i],$dtl1[$i +7],0,$dtl1[$i +6],$pgnm);
					}
				}
				
				if($dtl2[10]!==""){
					for($i=0 ; $i< sizeof($dtl2); $i= $i + 12){
						$str = insert_into_transaction_table($str,$vno,$bu2,json_decode($_POST['hdr2'])[0],$item_account2[$i / 11],$dtl2[$i + 11],date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[12]);
						$stri = insert_into_item_transaction_table($stri,$vno,date_format(date_create($fieldname[0]),"Y-m-d"),$bu2,$dtl2[$i],$dtl2[$i +8],0,$dtl2[$i +7],$pgnm);
					}
				}
				
				for($i=0 ; $i< sizeof($sundry1) - 1; $i= $i + 8){
					if($sundry1[ $i + 7] !==0){
						$str = insert_into_transaction_table($str,$vno,$bu,$fieldname[3],$sundry1[$i + 4],$sundry1[ $i + 7],date_format(date_create($fieldname[0]),"Y-m-d"),$sundry1[$i + 5]);
					}
				}
				
				for($i=0;$i< sizeof($sundry2) - 1;$i = $i = $i + 5){
					if($sundry2[ $i + 4] !==0){
						$str = insert_into_transaction_table($str,$vno,$bu2,json_decode($_POST['hdr2'])[0],$sundry2[ $i +1 ],$sundry2[ $i + 4],date_format(date_create($fieldname[0]),"Y-m-d"),$sundry2[ $i + 2]);
					}
				}
				
				if(!empty($x)){ 
					foreach($x->taxwise_amt as $tax ){
						$str = insert_into_transaction_table($str,$vno,$bu,$fieldname[3],$tax->id,$tax->amt,date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[12]);
						$str = insert_into_transaction_table($str,$vno,$bu2,json_decode($_POST['hdr2'])[0],$tax->id,$tax->amt,date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[12]);
					}
				}
				
				$sql34 = "INSERT INTO `transaction_record`(`vno`, `bu`, `account_name`, `t_date`, `credit`, `debit`, `details`) VALUES"  . $str;
				$sql35 = "INSERT INTO `item_transaction_record`( `vno`, `t_date`, `bu`, `item_name`, `unit`, `qty_in`, `qty_out`, `details`) VALUES"  . $stri;
								
				$connect = $GLOBALS['connect'];
					
				mysqli_query( $connect, $sql34 );
				mysqli_query( $connect, $sql35 );
				
			}
		}else{
			echo "Error saving data. Please try again!!";
		}
	}
}
function purchase(){
	$fieldname = json_decode($_POST['hdr1']);
	$fieldname2 = json_decode($_POST['hdr2']);
	$username =$_SESSION[ 'username' ];
	$pgnm ='PURC';
	
	$sql24 = "select bu from bu_details where BU_Name = '$fieldname[1]' ";
	$sql42 = "select bu from bu_details where BU_Name = 'Sample' ";
	$sql25="select fy from fy_table where 
	id=(select max(id) from fy_table WHERE
    eff_date = ( select max(eff_date) from fy_table WHERE  
	  username = '$username' and 
      eff_date <=CURRENT_TIMESTAMP()  ) ) ";
	
	$sql30 = "select DISTINCT approver_type from approval_table where voucher_type = '$pgnm' and login_user = '$username' limit 1";
	
	$bu =json_decode(get_names($sql24))[0];
	$bu2 =json_decode(get_names($sql42))[0];
	
	if($bu==""&& $_POST['hdr2'] == '[""]'){
		echo "Please enter correct values";
	}else{ 
	
		$fy =json_decode(get_names($sql25))[0];
		$typ =json_decode(get_names($sql30))[0];
		
		if($bu==""){
			$vno = autogenerate_voucher_number($_POST['vno'],$pgnm,$fy,$bu2);
		}else{
			$vno = autogenerate_voucher_number($_POST['vno'],$pgnm,$fy,$bu);
		}
		
		$fieldname[5] = $vno;
		$hdr=json_encode($fieldname);
		
		save_instant_data(json_decode($_POST['instant']),$vno);
		
		if($typ == 3){
			$status =1;
		}else{
			$status =0;
		}
		
		$sql19 = "INSERT INTO `purchase_table`( `status`, `delete_flag`, `BU`, `vno`, `invoiceNo`, `eff_date`, `user`, `hdr1`, `hdr2`, `dtl1`, `dtl2`, `sundry1`, `sundry2`, `modal1`, `modal2`) values(
		0,0,'$bu','".$vno."','".$fieldname[3]."',CURRENT_TIMESTAMP(),'".$_SESSION[ 'username' ]."','".$hdr."','".$_POST['hdr2']."','".$_POST['dtl1']."','".$_POST['dtl2']."','".$_POST['sundry1']."','".$_POST['sundry2']."','".$_POST['modal1']."','".$_POST['modal2']."') ";
		
		$y = get_tax_amount(json_decode(calculate_tax($fieldname,json_decode($_POST['item']))),json_decode($_POST['basic']),json_decode($_POST['qty']));
		$x = add_sundry($y,json_decode($_POST['sundry1']));
		
		if(mysqli_query( $GLOBALS['connect'], $sql19 )){
			dashboard($vno,$bu,$username,"New ".$pgnm." Voucher Created!!!",$pgnm);
			$sundry1= json_decode($_POST['sundry1']);
			$sundry2= json_decode($_POST['sundry2']);
		
			if($typ == 3){ 
				$item_account1 = item_account_list(json_decode($_POST['item']),$bu,"purchase_account");
				$item_account2 = item_account_list(json_decode($_POST['item2']),$bu2,"purchase_account");
		
				$str = "";
				$stri = "";
				$dtl1 = json_decode($_POST['dtl1']);
				$dtl2 = json_decode($_POST['dtl2']);
				
				if($dtl1[5]!==""){
					for($i=0 ; $i< sizeof($dtl1); $i= $i + 6){//$str,$vno,$bu1,$dr_name1,$cr_name1,$amt1,$dt,$details
						$str = insert_into_transaction_table($str,$vno,$bu,$item_account1[$i / 6],$fieldname[2],$dtl1[$i + 5],date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[11]);
																	//$str,$vno,$tdate,										  $bu,$item    ,$unit       ,$dr         ,$cr,$details
						$stri = insert_into_item_transaction_table($stri,$vno,date_format(date_create($fieldname[0]),"Y-m-d"),$bu,$dtl1[$i],$dtl1[$i +2],$dtl1[$i +1],0, $pgnm);
					}
				}
				
				if($dtl2[5]!==""){
					for($i=0 ; $i< sizeof($dtl2); $i= $i + 6){
						$str = insert_into_transaction_table($str,$vno,$bu2,json_decode($_POST['hdr2'])[0],$item_account2[$i / 6],$dtl2[$i + 5],date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[11]);
						$stri = insert_into_item_transaction_table($stri,$vno,date_format(date_create($fieldname[0]),"Y-m-d"),$bu2,$dtl2[$i],$dtl2[$i +2],$dtl2[$i +1],0,$pgnm);
					}
				}
				
				for($i=0 ; $i< sizeof($sundry1) - 1; $i= $i + 8){
					if($sundry1[ $i + 7] !==0){
						$str = insert_into_transaction_table($str,$vno,$bu,$sundry1[$i + 4],$fieldname[2],$sundry1[ $i + 7],date_format(date_create($fieldname[0]),"Y-m-d"),$sundry1[$i + 5]);
					}
				}
				
				for($i=0;$i< sizeof($sundry2) ;$i = $i = $i + 5){
					if($sundry2[ $i + 4] !==0){
						$str = insert_into_transaction_table($str,$vno,$bu2,$sundry2[ $i +1 ],json_decode($_POST['hdr2'])[0],$sundry2[ $i + 4],date_format(date_create($fieldname[0]),"Y-m-d"),$sundry2[ $i + 2]);
					}
				}
				
				if(!empty($x)){ 
					foreach($x->taxwise_amt as $tax ){
						$str = insert_into_transaction_table($str,$vno,$bu,$tax->id,$fieldname[2],$tax->amt,date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[11]);
						$str = insert_into_transaction_table($str,$vno,$bu2,$tax->id,json_decode($_POST['hdr2'])[0],$tax->amt,date_format(date_create($fieldname[0]),"Y-m-d"),$fieldname[11]);
					}
				}
				
				$sql34 = "INSERT INTO `transaction_record`(`vno`, `bu`, `account_name`, `t_date`, `credit`, `debit`, `details`) VALUES"  . $str;
				$sql35 = "INSERT INTO `item_transaction_record`( `vno`, `t_date`, `bu`, `item_name`, `unit`, `qty_in`, `qty_out`, `details`) VALUES"  . $stri;
								
				$connect = $GLOBALS['connect'];
				
				
				mysqli_query( $connect, $sql34 );
				mysqli_query( $connect, $sql35 );
				
			}
		}else{
			echo "Error saving data. Please try again!!";
		}
	}
}

function add_sundry($tax,$sundry){
	if(sizeof($tax->taxwise_amt)>0){
		$amt_sum = 0;
		$stax = array();
		$t_array = array();
		$sundry_tax = array();
		$_SESSION['unique_node_list'] = array();
		if(max(array_column($tax->taxwise_amt, 'type'))==1){
			$factor = 2;
		}else{
			$factor = 1;
		}
		$qty_sum = array_sum(array_column($tax->taxwise_amt, 'qty')) / $factor;
		
		
		foreach($tax->taxwise_amt as $t){ //echo $t->amt;
			$amt_sum =  $amt_sum  +	100 * $t->amt / (float)explode('%',explode('@',$t->id)[1])[0] ;
			array_push($_SESSION['unique_node_list'],$t);
		}
		
		
		for($i = 0; $i<sizeof($sundry)-1;$i = $i + 8){
			$flag = 0; 
			foreach($tax->taxwise_amt as $t){
				if($sundry[$i +2] =='off'){
					if($sundry[$i +1] =='on'){
						array_push($sundry_tax,$t->id,$t->amt * $sundry[$i +7] / $amt_sum);
						$t->amt = $t->amt * ( 1 + $sundry[$i +7] / $amt_sum );
					}else{
						array_push($sundry_tax,$t->id,(float)explode('%',explode('@',$t->id)[1])[0] * $sundry[$i +7] * $t->qty / (100 * $qty_sum ));
						$t->amt = $t->amt  + (float)explode('%',explode('@',$t->id)[1])[0] * $sundry[$i +7] * $t->qty / (100 * $qty_sum );
					}
				}else{
					$flag=1;
				}
			}
			if($flag==1){ 
				$sundry_tax = get_sundry_tax($sundry_tax,$sundry[$i +7] , $sundry[$i +3] , $factor);
				array_push($t_array,$sundry[$i +7] , $sundry[$i +3] , $factor) ;
			}
		}
		
		$s_tax = unique($sundry_tax);//print_r($stax);print_r($s_tax);
		$tnode = add_tax($t_array);
		$total = array_sum(array_column($tnode, 'amt'));
		
		if($factor == 1){
			$cgst = 0;
			$sgst = 0;
			$igst = $total;
		}else{
			$cgst = $total/2;
			$sgst = $total/2;
			$igst = 0;
		}
		
		$x =  new tax_array($tax->itemwise_tax,$tax->tax_matrix,$tnode,$total,$cgst,$sgst,$igst,$s_tax);
		
		return $x;
	
	}else{
		return null;
	}
}
function unique($array){
	$temp = array();
	$flag=0;
	for($i=0;$i<sizeof($array);$i=$i+2){
		if($flag==0){
			for($j=0;$j<sizeof($temp);$j=$j+2){
				if($temp[$j] == $array[$i]){
					$temp[$j+1] = $temp[$j+1] + $array[$i+1];
					$j=sizeof($temp);
					$flag=0;
				}else{
					$flag=1;
				}
			}
			if($flag==1 || sizeof($temp) == 0){
				array_push($temp,$array[$i],$array[$i+1]);
				$flag=0;
			}
		}
	}
	return $temp;
}
function get_sundry_tax($sundry_tax,$basic,$rate,$flag){
	for($i = 0;$i<$flag;$i++){
		if($flag ==1){
			$type = "IGST@";
		}else if($i==0){
			$type = "CGST@";
		}else{
			$type = "SGST@";
		}
			array_push($sundry_tax,$type.$rate/$flag."%", $rate*$basic /(100 * $flag));
	}
	
	return $sundry_tax;
}
function add_tax($array){//$basic,$rate,$flag
	//$_SESSION['unique_node_list'] = array();
	for($j = 0;$j<sizeof($array);$j=$j+3){//print_r(sizeof($array));
		$basic = $array[$j];//echo "\n basic = ".$basic."\n";	
		$rate = $array[$j+1];//echo "\n rate = ".$rate."\n";	
		$flag = $array[$j+2];//echo "\n flag = ".$flag."\n";	
		for($i = 0;$i<$flag;$i++){
			$temp = new Tnode($rate/$flag , type($flag,$i));
			addToList($temp);
			$parentnode = getNode($temp->id); 
			$amt =$rate*$basic /(100 * $flag);
			$parentnode->amount($amt);
		}
	}
	return $_SESSION['unique_node_list'];
}
function type($flag,$i){
	if($flag == 2){
		return $i;
	}else{
		return 2;
	}
}
function insert_into_item_transaction_table($str,$vno,$tdate,$bu,$item,$unit,$dr,$cr,$details){
	
	//check for accounts if not exist create new!!
	
	if(!empty($tdate) && !empty($bu) && !empty($item) && !empty($unit)  ){
		if($str ==""){
			$str .= "('$vno','$tdate','$bu','$item','$unit','$dr','$cr','$details')";
		}else{
			$str .= ",
				('$vno','$tdate','$bu','$item','$unit','$dr','$cr','$details')";
		}
	}
	return $str;
}
function insert_into_transaction_table($str,$vno,$bu1,$dr_name1,$cr_name1,$amt1,$dt,$details){
	
	//check for accounts if not exist create new!!
	//echo "\n".$cr_name1."--".$bu1."--".$dr_name1."--".$amt1;
	if(!empty($cr_name1) && !empty($bu1) && !empty($dr_name1) ){
		if($str ==""){
			$str .= "('$vno','$bu1','$dr_name1','$dt',   0   ,'$amt1','$details'),
					 ('$vno','$bu1','$cr_name1','$dt','$amt1',  0    ,'$details')";
		}else{
			$str .= ",
				('$vno','$bu1','$dr_name1','$dt',   0   ,'$amt1','$details'),
				('$vno','$bu1','$cr_name1','$dt','$amt1',  0    ,'$details')";
		}
	}
	return $str;
}

function get_taxwise_amount($tax,$basic,$qty){
	$unique = array_unique($tax);
	$_SESSION['unique_node_list'] = array();

	foreach($unique as $t){
		if($t!==0){
			for($i=0;$i<sizeof($tax);$i=$i+3){
				for($j=0;$j<3;$j++){
					if($t == $tax[$i+$j]){
						$temp = new Tnode($t,$j);
						addToList($temp);
						$parentnode = getNode($temp->id); 
						$amt =$t*$basic[$i/3] /100;
						$parentnode->amount($amt);
						$parentnode->quantity($qty[$i/3]);
					}
			    }
			}
		}
	}
	return $_SESSION['unique_node_list'];
}

function get_tax_amount($tax,$basic,$qty){
	error_reporting(E_ALL ^ E_WARNING);
	$itemwise =array();
	$csi_gst =array();
	$cgst = 0;
	$sgst = 0;
	$igst = 0;
	$total = 0;
	
	for($i=0;$i<sizeof($tax);$i=$i+3){
		array_push( $itemwise ,  ((float)$tax[$i] + (float)$tax[$i+1] + (float)$tax[$i+2]) * (float)$basic[$i/3] /100 );
		
		array_push( $csi_gst ,"CGST@".$tax[$i]."%", $tax[$i]   * $basic[$i/3] /100 );
		array_push( $csi_gst ,"SGST@".$tax[$i+1]."%", $tax[$i+1] * $basic[$i/3] /100 );
		array_push( $csi_gst ,"IGST@".$tax[$i+2]."%", $tax[$i+2] * $basic[$i/3] /100 );
		
		$cgst = $cgst + $tax[$i]   * $basic[$i/3] /100;
		$sgst = $sgst + $tax[$i+1] * $basic[$i/3] /100;
		$igst = $igst + $tax[$i+2] * $basic[$i/3] /100;
		
		$total = $total + ($tax[$i] + $tax[$i+1] + $tax[$i+2])  * $basic[$i/3] / 100;
	}
	$x =  new tax_array($itemwise,$csi_gst,get_taxwise_amount($tax,$basic,$qty),$total,$cgst,$sgst,$igst,0);
	
	return $x;
}

function calculate_tax($hdr,$item1_array){
	$connect =$GLOBALS['connect'];
	$state = 0;
	$temp1 = array();
	
	$sql31 = "SELECT DISTINCT state FROM `bu_details` WHERE BU_Name = '".$hdr[1]."' LIMIT 1";
	$result = mysqli_query($connect,$sql31);
	$row = mysqli_fetch_array($result);
	
	$sql32 = "SELECT DISTINCT state FROM `accounts_table` WHERE delete_flag = 0 and status = 1 and account_name = '".$hdr[3]."' LIMIT 1";
	$result2 = mysqli_query($connect,$sql32);
	$row2 = mysqli_fetch_array($result2);
	
	if($row2['state']==""){
		$row2['state'] = $row['state']; 
	}	
	if($row['state']==$row2['state']){
		$state = 0; //echo "equal";
	}else{
		$state = 1;
	}	
	
	for($i = 0; $i<sizeof($item1_array);$i++){
		$sql33 = "SELECT DISTINCT gst , account FROM `item_table` WHERE item_name = '".$item1_array[$i]."' LIMIT 1";
		$result1 = mysqli_query($connect,$sql33);
		
		if( mysqli_num_rows($result1)>0 ){	
			while($row1=mysqli_fetch_array($result1)){
				if($state == 0){
					array_push($temp1,$row1['gst']/2,$row1['gst']/2,0);
				}else{
					array_push($temp1,0,0,$row1['gst']);
				}
			}
		}
	}
	return json_encode($temp1);
}

function item_account_list($item1_array,$bu,$acct){
	$connect =$GLOBALS['connect'];
	$temp = array();
	for($i = 0; $i<sizeof($item1_array);$i++){
		$sql33 = "SELECT DISTINCT  $acct as account FROM `item_table` WHERE item_name = '".$item1_array[$i]."' and bu = '$bu' LIMIT 1 ";
		$result1 = mysqli_query($connect,$sql33);
		
		if( mysqli_num_rows($result1)>0 ){	
			while($row1=mysqli_fetch_array($result1)){
				array_push($temp,$row1['account']);
			}
		}
	}
	return $temp;
}

function autogenerate_voucher_number($t_vno,$pagename,$fy,$bu){
	if(validate_voucher_number($t_vno)){
		return $t_vno;
	}else{
		$sql23="Select max(vno)+1 from voucher where bu ='$bu' and fy = '$fy' and v_type = '$pagename' ";
		
		$vno =json_decode(get_names($sql23))[0];
		
		if( str_pad($vno,4,'0',STR_PAD_LEFT) =='0000'){
			
			insert_vno($bu,$fy,$pagename,str_pad('1',4,'0',STR_PAD_LEFT));
			
			return $bu."/".$fy."/".$pagename."/".str_pad('1',4,'0',STR_PAD_LEFT);
		}
		
		insert_vno($bu,$fy,$pagename,str_pad($vno,4,'0',STR_PAD_LEFT));
		
		return $bu."/".$fy."/".$pagename."/".str_pad($vno,4,'0',STR_PAD_LEFT);
	}
}

function insert_vno($bu,$fy,$v_type,$vno){
	$sql12 = "INSERT INTO voucher(bu,fy,v_type,vno) values('$bu','$fy','$v_type','$vno')";
	return mysqli_query($GLOBALS['connect'], $sql12);
}
function validate_voucher_number($t_vno){
	$vno = explode("/",$t_vno);
	
	if(sizeof($vno)==4){
		$sql22="Select id from voucher where bu ='$vno[0]' and fy = '$vno[1]' and v_type = '$vno[2]' and vno = '$vno[3]'";
		$result = mysqli_query($GLOBALS['connect'], $sql22);
		//echo $sql22;
		return mysqli_num_rows($result);
	}else{
		return false;
	}
	
}

function save_instant_data($values,$vno){
	$connect = $GLOBALS['connect'];
	$sql21="INSERT IGNORE INTO index_table(vno,field_name,value) values (' ";
	for($i=0;$i<sizeof($values);$i=$i+2){
		$sql21 .= $vno ."','".$values[$i]."','".$values[$i+1]."'),('";
	}
	$sql21 = substr(trim($sql21), 0, -3);
	//echo $sql21;
	if(mysqli_query( $GLOBALS['connect'], $sql21 )){
		//echo "Instant data stored successfully \n";
	}else{
		echo "Error saving instant data. Please try again!! \n";
	}
}

class Tnode{
	public $type;
	public $id;
	public $qty = 0;
	public $amt = 0;
	
	public function __construct ( $id, $type ) {
		$this->type = $type;
		if($type == 0){
			$this->id = "CGST@".$id."%";
		}else if($type == 1){
			$this->id = "SGST@".$id."%";
		}if($type == 2){
			$this->id = "IGST@".$id."%";
		}
	}
	public function amount($amt){
		$this->amt = $this->amt + $amt;
	}
	public function quantity($qty){
		$this->qty = $this->qty + $qty;
	}
	
	public function getAmt(){
		return $this->amt;
	}
	public function getId(){
		return $this->id;
	}
}

class tax_array{
	public $itemwise_tax = array();
	public $tax_matrix = array();
	public $taxwise_amt = array();
	public $total_gst;
	public $total_cgst;
	public $total_sgst;
	public $total_igst;
	public $sundry_tax = array();
	
	public function __construct ( $v1,$v2,$v3,$v4,$v5,$v6,$v7,$v8 ) {
		$this->itemwise_tax = $v1;
		$this->tax_matrix 	= $v2;
		$this->taxwise_amt 	= $v3;
		$this->total_gst 	= $v4;
		$this->total_cgst 	= $v5;
		$this->total_sgst	= $v6;
		$this->total_igst 	= $v7;
		$this->sundry_tax 	= $v8;
	}
}

class Gnode{
	public $id;
	private $name;
	public $children= array();
	
	public function __construct ( $id, $name ) {
    $this->id = $id;
    $this->name = $name;
  }
	
	public function getName(){
		return $this->name;
	}
	public function getId(){
		//echo $this->id;
		return $this->id;
	}
	
	
	public function addChild($node){
		$isunique =0;
		$n_id = $node->getId();
		foreach($this->children as $child){
			$c_id = $child->getId();
			if(strcmp($c_id,$n_id)==0)
				$isunique = 1;
		}
		
		if($isunique==0)
			array_push($this->children,$node);
	}
}
function get_patentgroup_list($allnodes,$myParentGroup){
	// get child - parent table
	$uniqueparent = [];
	
	//calculate unique parent from allnodes
	foreach($allnodes as$nodes){
		array_push($uniqueparent,$nodes[1]);
	}
	$uniqueparent = array_unique($uniqueparent);
	
	//unique nod list
	$unique_node_list = array();
	$_SESSION['unique_node_list'] = $unique_node_list;

	// create nodes for all unique parents.
	$counter =1;
	foreach($uniqueparent as $p){
		$tmp = new Gnode($p,$p);
		// add this to $unique_node_list
		addToList($tmp);
	}

	/** now scan all node list
		and add child to parent
	**/
	foreach($allnodes as $pc){
		$child = $pc[0];
		$parent = $pc[1];
		
		$childnode = new Gnode($child,$child);
		addToList($childnode);
		$parentnode = getNode($parent);
		
		$parentnode->addChild($childnode);
	}

	// now get the root node or any node whose sum is required
	
	$_SESSION['str']='';
	for($i = 0;$i<sizeof($myParentGroup);$i++){	
		$root = getNode($myParentGroup[$i]);
		printLeaf($root);
		
		//echo $myParentGroup[$i];
	}
	//echo $_SESSION['str'];
	return "SELECT account_name from accounts_table where delete_flag=0 and status = 1 and parent_group IN ('".substr(trim($_SESSION['str']), 0, -2).")";
	

}

function consignee_options($buname){
	//$buname= json_decode($_POST['jsondata']);
	$connect = $GLOBALS['connect'];
	$tem =array();
	if($buname[1]==0){
		$gid = '"Sundry Creditors","Sundry Debtors"';
		$buname[1]="";
	}else if($buname[1]==1){
		$gid = '"Sundry Creditors","Sundry Debtors"';
	}
	$sql16=" select distinct GroupName, ParentGroup  from group_table where BU=(select bu from bu_details where BU_Name = '$buname[0]') and ParentGroup <> '' and delete_flag = 0 and status =1";
	$sql_result = mysqli_query($connect, $sql16);

	while($row=mysqli_fetch_array($sql_result)){	
		$tem[]=$row;
	}
	$sql17 ="select GroupName from group_table where BU=(select bu from bu_details where BU_Name = '$buname[0]') and group_id in( $gid)";
	return get_names(get_patentgroup_list($tem,json_decode(get_names($sql17)))."and account_name not in( '$buname[2]')");
	return $sql16;
}
function printLeaf($rt){
	error_reporting(E_ALL ^ E_WARNING);
	if( sizeof($rt)>0){	
		if(sizeof($rt->children)==0){//no child
			//echo "Account :".$rt->id."<br>";
			$_SESSION['str'] .= $rt->id."','";
		}else{
			//echo "Account :".$rt->id."<br>";
			$_SESSION['str'] .= $rt->id."','";
			// get all children and print leaf
			$r = $rt->children;
			foreach($r as $c){
				printLeaf(getNode($c->id));
			}
				
		}
	}else {
		$_SESSION['str'] .= "','";
	}
}

function addToList($node){
		$isunique =0;
		$n_id = $node->getId();
		
		//echo "<br>";print_r($_SESSION['unique_node_list']);echo "<br>";
		foreach($_SESSION['unique_node_list'] as $child){
			
			$c_id = $child->id;
			if(strcmp($c_id,$n_id)==0)
				$isunique = 1;		
		}
		if($isunique==0){
			array_push($_SESSION['unique_node_list'],$node);
			//echo "\n added " .  $node->getId();
			return true;
		}else {
			//echo "\n Not added";
			return false;
		}
	
}

function getNode($prnt){
	
	$u = 	$_SESSION['unique_node_list'];
	for ($x = 0; $x < sizeof($u); $x++) {
		if($u[$x]->id==$prnt)
			return $u[$x];
	}
	return null;
}	

function get_names($sql9){
	//echo $sql9;
	if (!isset($GLOBALS['connect'])) {
		include_once("DBConnection.php");
}
	$connect = $GLOBALS['connect'];
	$result = mysqli_query( $connect, $sql9 );
	if($result){
		$count = mysqli_num_rows( $result );
	}else{
		$count=0;
	}
	
	try{
		if ( $count > 0 ) {
			while($row=mysqli_fetch_array($result)){
				for($i=0;$i<sizeof($row)/2;$i++){
					$temp[]=$row[$i];
					//echo "  i = ".sizeof($row);
				}
			}
			return json_encode($temp);
		}
	}catch(Exception  $e)  {	  return "exception 4";  }
		finally{ 
			//mysqli_close($connect);
		}

	
}
function execute_sql($sql9){
	//echo $sql9;
	if (!isset($GLOBALS['connect'])) {
		include_once("DBConnection.php");
}
	$connect = $GLOBALS['connect'];
	$result = mysqli_query( $connect, $sql9 );
	$count = mysqli_num_rows( $result );
	
	try{
		if ( $count > 0 ) {
			while($row=mysqli_fetch_array($result)){
					$temp[]=$row;
				
			}
			return json_encode($temp);
		}
	}catch(Exception  $e)  {	  return "exception 4";  }
		finally{ 
			//mysqli_close($connect);
		}

	
}

function save_permission(){
	$connect = $GLOBALS['connect'];
	$json = $_POST[ "jsondata" ];
	$username = $_POST['username'];
	$pagename = $_POST[ "pagename" ];
	$sql6 = "INSERT INTO `permission_table`(`username`, `pagename`, `permission`,`eff_date`) values ('$username','$pagename','$json',CURDATE()) ";
	$result = mysqli_query( $connect, $sql6 );
	echo $sql6;
	echo "Data Saved";
}

function page_field_list(){
	//style="border:1px solid #d4d4d4;text-align:center;padding:8px;vertical-align:top;width:10%"
	$text='';
	$text0 = '<div style="float:left;width:100%">
					<center>
						<div class="sale_head1">
							<span class="sale_head2">
								Select Fields to allow Access
							</span>
						</div>  
					</center>
				</div><br><br><br>
						<div>
						<table style="width:100%" >
							<tr>';
	$text1 =					'<td class="style1" >
									<label>
										<input name="checkbox[]" type="checkbox" hidden ="true"/>
											<span name="txt[]" style="width:100%" >';
	$text2 =										'';
	$text3 =							'</span></label></td>';
	$text4 =						'</tr>';
	$text5 =				'</tr>
						</table>
						<br>
						<div style="float:left;width:50%;margin-left:300px">
							<button id="permission2_f2" onclick="save_permission_values();">Save Values</button>
							<button onclick="check_all_checkboxes();">Select All</button>
							<button onclick="uncheck_all_checkboxes();">Exclude All</button>
						</div><br>
					</div>';
	$connect = $GLOBALS['connect'];
	$pagename = $_POST['pagename'];
	$sql8 = "Select permission from page_permission_table where pagename = '$pagename'";
	$result = mysqli_query( $connect, $sql8 );
	$count = mysqli_num_rows( $result );
	//echo $sql8 ." - ".$count;
	try{
		if ( $count == 1 ) {
			$row=mysqli_fetch_array($result);
			$values = json_decode($row['permission']);
			//echo $sql8; 
			for($i = 0;$i<sizeof($values);$i++){
				$text  = $text . $text1 . $values[$i] . $text3 ;
				if(($i + 1) % 10 == 0){ // ten elements in a row
					$text  = $text . $text4;
				}	
			}
				$text  = $text0 . $text . $text5 ;
				echo $text;
				//echo "text";
		}
	}catch(Exception  $e)  {	  echo "exception 4";  }
		finally{ mysqli_close($connect); }
}

function permission_fields(){
	$connect = $GLOBALS['connect'];
	$json = $_POST[ "jsondata" ];
	$pagename = basename(explode('?',$_SERVER['HTTP_REFERER'])[0]);
	$sql7 = "INSERT INTO `page_permission_table` values('$pagename','$json') ON DUPLICATE KEY UPDATE `permission` = '$json'   ";
	$result = mysqli_query( $connect, $sql7 );
	//echo "data Inserted";
	echo $sql7;
}

function permission(){
	if(isset($_SESSION['username'])){
		$connect = $GLOBALS['connect'];
		$username = $_SESSION['username'];
		$pagename = basename(explode("?",$_SERVER['HTTP_REFERER'])[0]);
		$sql5 = "select permission from permission_table where 
		id=(select max(id) from permission_table WHERE
		eff_date = ( select max(eff_date) from permission_table WHERE  
		  username = '$username' and 
		  pagename = '$pagename' and 
		  eff_date <=CURRENT_TIMESTAMP()  ) ) " ;
		$result = mysqli_query( $connect, $sql5 );
		$row=mysqli_fetch_array($result);
		echo $row['permission'];
	}else{
		echo "*";
	}
}
	
function signup(){
	$connect = $GLOBALS['connect'];
	$values = json_decode($_POST[ "jsondata" ]);
	for($i=0;$i<sizeof($values);$i++){
		$values[$i]=stripslashes( $values[$i]);
		$values[$i]= mysqli_real_escape_string( $connect, $values[$i] );
	}
		
	$sql1 = "SELECT * FROM profile WHERE username = '$values[0]'   "; //Fetching all the records with input credentials
	$result = mysqli_query( $connect, $sql1 );
    $count = mysqli_num_rows( $result );		
	try{
		if ( $count < 1 ) {
			$sql2 = "INSERT INTO `profile`(`delete_flag`, `FULLNAME`, `verified`, `EMAIL`, `USERNAME`, `PASSWORD`) 
			VALUES (0,'$values[0]','N','$values[2]','$values[0]','$values[1]')"; // to maintain Logged-in Status
			$res = mysqli_query( $connect, $sql2 );
			
			echo "You will get your login details shortly!!";
		} else {
			echo "User Already Exists !!";;
		}
	}
	catch(Exception  $e)  {	  echo "exception 2";  }
	finally{ mysqli_close($connect); }

}

function login(){
	$connect = $GLOBALS['connect'];
	if ( $_SERVER[ 'REQUEST_METHOD' ] == 'POST' ) {
		if ( empty( $_POST[ 'username' ] ) || empty( $_POST[ 'password' ] ) ) //This is the way to validate inputs using PHP code but here we are using javascript validations so it is not necessary 
		{
			echo "Please enter the correct Username and Password";
			//header("location: LoginForm.php");//You will be sent to Login.php for re-login
		}
		$usernameLogn = $_POST[ "username" ]; // as the method type in the form is "post" we are using $_POST otherwise it would be $_GET[]
		$passwordLogin = $_POST[ "password" ];
		$myusername = stripslashes( $usernameLogn ); // stripslashes() is used to clean up data retrieved from an HTML form
		$mypassword = stripslashes( $passwordLogin );
		$myusername = mysqli_real_escape_string( $connect, $_POST[ 'username' ] ); // Escapes special characters in a string for use in an SQL statement
		$mypassword = mysqli_real_escape_string( $connect, $_POST[ 'password' ] );
		$sql3 = "SELECT * FROM profile WHERE username = '$myusername' and password = '$mypassword' and verified='Y' "; //Fetching all the records with input credentials
		$result = mysqli_query( $connect, $sql3 );
		$count = mysqli_num_rows( $result );
		try{
			if ( $count == 1 ) {
				if(!isset($_SESSION)){
					session_start(); //It is advised to open a session in the beginning
				}
				$row=mysqli_fetch_assoc($result);
				$_SESSION[ 'username' ] = $row['USERNAME']; //Storing the username value in session variable so that it can be retrieved on other pages 
				$_SESSION[ 'password' ] = $row['PASSWORD'];
				$_SESSION[ 'fullname' ] = $row['FULLNAME'];
				$_SESSION[ 'email' ] 	= $row['EMAIL'];
				$_SESSION[ 'role'] 		= $row['role'];
				//Optional code - if you want to maintain records of logged in users, use following two lines
				$sql4 = "UPDATE profile SET loggedin=1 WHERE username='$myusername'"; // to maintain Logged-in Status
				$res = mysqli_query( $connect, $sql4 );
				$user_info= array( 
									'username'=> $_SESSION['username'] ,
									'password'=> $_SESSION['password'] ,
									'email'   => $_SESSION['email'],
									'role'    => $_SESSION['role'],
									'fullname'=> $_SESSION['fullname']
								);
				$_SESSION['user_info'][]=$user_info;
				//header("location: statement.php"); // user will be taken to profile page
				
				echo "/dashboard.html";
			} else {
				if(isset($_SESSION)){ 
					session_destroy();
					echo "0";
				}
			}
		}catch(Exception  $e)  {	  echo "exception 1";  }
		finally{ mysqli_close($connect); }
	}
}
?>