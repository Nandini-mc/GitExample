<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#mdlDrpDwn {
	display: none;
}

#vrntDrpDwn {
	display: none;
}

#brndDrpDwn {
	display: none;
}

.mainFormDiv {
	z-index: 800;
	margin-bottom: 15px;
}

.error_message {
	color: red;
}

input[type="radio"] {
	display: none;
}

body {
	background-color: #cdd1dd;
}

*[role="form"] {
	max-width: 530px;
	padding: 15px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 0.3em;
	align-items: center;
}

}
.h1Tag {
	font-weight: 800;
}
</style>
</head>
<body onload="getYear()">
	<div class="container">
		<h1 align="center"
			style="font-weight: 800; margin-top: 80px; margin-bottom: 20px">Loan
			Eligibility Forecast</h1>
	</div>
	<div class="container">
		<div class="col-sm-3"></div>
		<div class=" col-sm-6 mainFormDiv">

			<form action="./saveVehicleLoanData.do" method="post" role="form"
				class="form-horizontal"
				style="box-shadow: 1px 7px 9px 5px grey; margin-bottom: 15px;">

				<div class="vehicle_details">
					<div class="form-group">
						<label for="isUsedVehicle" class="col-sm-6">Vehicle</label>
						<div class="col-sm-12">
							<div class="btn btn-primary btn-block">
								<input type="hidden" id="isUsedVehicle" name="isUsedVehicle"
									checked="checked" value="1"><label for="isUsedVehicle">Used</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="vehicleType" class="col-sm-6">Vehicle Type</label>
						<div class="col-sm-12">
							<div class="btn-group btn-group-justified btn-group-toggle "
								data-toggle="buttons">
								<div class="btn btn-primary  ">
									<input type="radio" name="vehicleType" id="vehTypePrivate"
										style="" value="1"><label
										onclick="vehicleTypeFunc('private')">Private</label>
								</div>
								<div class="btn btn-primary ">
									<input type="radio" name="vehicleType" id="vehTypeTexi"
										style="" value="2"><label
										onclick="vehicleTypeFunc('texi')">Taxi</label>
								</div>
							</div>
							<script type="text/javascript">
								function vehicleTypeFunc(vehType) {
									//alert('hi...');
									/* $( "#vehTypeTexi" ).prop( "checked", true ); */

									if (vehType == 'private') {
										$("#vehTypeTexi")
												.prop("checked", false);
										$("#vehTypePrivate").prop("checked",
												true);
									} else {
										$("#vehTypeTexi").prop("checked", true);
										$("#vehTypePrivate").prop("checked",
												false);
									}
								}
							</script>
						</div>
					</div>

					<div class="form-group">
						<label for="loanType" class="col-sm-6">Loan Type</label>
						<div class="col-sm-12">
							<div class="btn btn-primary btn-block">
								<input type="radio" id="loanType" name="isPurchased"
									checked="checked" value="1"><label for="loanType">purchased</label>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="mfgYear" class="col-sm-6">Manufacture Year</label>
						<div class="col-sm-12">
							<select class="form-control" id="mfgYear" name="mfgYear"
								onchange="changeYear()">
								<option disabled selected>mfg year</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
							</select>
						</div>
					</div>

					<div class="form-group" id="brndDrpDwn">
						<label for="brand" class="col-sm-6">Brand</label>
						<div class="col-sm-12">
							<select class="form-control" id="brand" name="brand"
								onchange="changeBrand()">
								<option disabled selected>select brand</option>
								<option value="bmw">BMW</option>
								<option value="audi">Audi</option>
								<option value="honda">Honda</option>
								<option value="toyata">Toyata</option>
								<option value="skoda">Skoda</option>
							</select>

						</div>
					</div>

					<div class="form-group" id="mdlDrpDwn">
						<label for="model" class="col-sm-6">Model</label>
						<div class="col-sm-12">
							<select class="form-control" id="model" name="model"
								onchange="changeModel()">
								<option disabled selected>select model</option>
								<option value="x5">x5</option>
								<option value="r8">r8</option>
								<option value="Civc">Civc</option>
								<option value="Innova">Innova</option>
								<option value="Rapid">Rapid</option>
							</select>
						</div>
					</div>

					<div class="form-group" id="vrntDrpDwn">
						<label for="variant" class="col-sm-6">Variant</label>
						<div class="col-sm-12">
							<select class="form-control" id="variant" name="variant">
								<option disabled selected>variant</option>
								<option value="a">a</option>
								<option value="b">b</option>
								<option value="c">c</option>
								<option value="d">d</option>
								<option value="e">e</option>
								<option value="f">f</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="location" class="col-sm-6">Location</label>
						<div class="col-sm-12">
							<select class="form-control" id="location" name="location">
								<option disabled selected>location</option>
								<option value="banglore">Banglore</option>
								<option value="chennai">Chennai</option>
								<option value="mumbai">Mumbai</option>
								<option value="delhi">Delhi</option>
								<option value="kerala">Kerala</option>
								<option value="pune">Pune</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="ownerShip" class="col-sm-6">Ownership</label>
						<div class="col-sm-12" id="ownerShip">
							<div class="btn-group btn-group-justified btn-group-toggle"
								data-toggle="buttons">

								<div class="btn btn-primary">
									<input type="radio" name="ownerShip" value="1"
										id="firstOwnership"><label
										onclick="ownershipFun('first')">1st</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="ownerShip" value="2"
										id="secondOwnership"><label
										onclick="ownershipFun('second')">2nd</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="ownerShip" value="3"
										id="thirdOwnership"><label
										onclick="ownershipFun('third')">3rd</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="ownerShip" value="4"
										id="otherOwnership"><label
										onclick="ownershipFun('other')">3+</label>
								</div>
							</div>
							<script type="text/javascript">
								function ownershipFun(ownerType) {
									if (ownerType == 'first') {
										$("#firstOwnership").prop("checked",
												true);
										$("#secondOwnership").prop("checked",
												false);
										$("#thirdOwnership").prop("checked",
												false);
										$("#otherOwnership").prop("checked",
												false);
									} else if (ownerType == 'second') {
										$("#firstOwnership").prop("checked",
												false);
										$("#secondOwnership").prop("checked",
												true);
										$("#thirdOwnership").prop("checked",
												false);
										$("#otherOwnership").prop("checked",
												false);

									} else if (ownerType == 'third') {
										$("#firstOwnership").prop("checked",
												false);
										$("#secondOwnership").prop("checked",
												false);
										$("#thirdOwnership").prop("checked",
												true);
										$("#otherOwnership").prop("checked",
												false);

									} else if (ownerType == 'other') {
										$("#firstOwnership").prop("checked",
												false);
										$("#secondOwnership").prop("checked",
												false);
										$("#thirdOwnership").prop("checked",
												false);
										$("#otherOwnership").prop("checked",
												true);

									}
								}
							</script>
						</div>
					</div>


					<div class="form-group">
						<label for="vehicleCondition" class="col-sm-6">Condition</label>
						<div class="col-sm-12" id="vehicleCondition">
							<div class="btn-group btn-group-justified btn-group-toggle"
								data-toggle="buttons">
								<div class="btn btn-primary">
									<input type="radio" name="vehicleCondition" value="1"
										id="excellentCondition"><label
										onclick="vehCondition('excellent')">Excellent</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="vehicleCondition" value="2"
										id="goodCondition"><label
										onclick="vehCondition('good')">Good</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="vehicleCondition" value="3"
										id="averageCondition"><label
										onclick="vehCondition('average')">Average</label>
								</div>
								<div class="btn btn-primary">
									<input type="radio" name="vehicleCondition" value="4"
										id="badCondition"><label onclick="vehCondition('bad')">Bad</label>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						function conditionFun(condition) {
							alert('hi...');

							if (condition == 'excellent') {
								$("#excellentCondition").prop("checked", true);
								$("#goodCondition").prop("checked", false);
								$("#averageCondition").prop("checked", false);
								$("#badCondition").prop("checked", false);
							} else if (condition == 'good') {
								$("#excellentCondition").prop("checked", false);
								$("#goodCondition").prop("checked", true);
								$("#averageCondition").prop("checked", false);
								$("#badCondition").prop("checked", false);

							} else if (condition == 'average') {
								$("#excellentCondition").prop("checked", false);
								$("#goodCondition").prop("checked", false);
								$("#averageCondition").prop("checked", true);
								$("#badCondition").prop("checked", false);

							} else if (condition == 'bad') {
								$("#excellentCondition").prop("checked", false);
								$("#goodCondition").prop("checked", false);
								$("#averageCondition").prop("checked", false);
								$("#badCondition").prop("checked", true);

							}
						}
					</script>
					<div class="form-group">
						<label for="vehiclePrice" class="col-sm-6">Vehicle Price</label>
						<div class="col-sm-12">
							<input type="number" name="vehiclePrice"
								placeholder="enter vehicle price" id="vehiclePrice"
								class="form-control">
						</div>
					</div>


				</div>
				<div class="profile_details">
					<div>
						<div class="form-group">
							<label for="personAge" class="col-sm-6">Age</label>
							<div class="col-sm-12">
								<input type="number" name="personAge" id="personAge"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="customerProfile" class="col-sm-6">Customer
								Profile</label>
							<div class="col-sm-12">
								<select class="form-control" id="customerProfile"
									name="customerProfile">
									<option>select profile</option>
									<option value="1">Salaried</option>
									<option value="1">Professional</option>
									<option value="2">Business</option>
									<option value="2">Self Employed</option>
									<option value="2">Agriculture</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="monthlyIncome" class="col-sm-6">Monthly
								Income</label>
							<div class="col-sm-12">
								<select class="form-control" id="monthlyIncome"
									name="monthlyIncome">
									<option>select income</option>
									<option value="1">15000-20000</option>
									<option value="2">20000-25000</option>
									<option value="3">25000-30000</option>
									<option value="4">30000-40000</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="loanAmount" class="col-sm-6">Loan Amount</label>
							<div class="col-sm-12">
								<select class="form-control" id="loanAmount" name="loanAmount">
									<option>select loan amount</option>
									<option value="1000000">1000000-1200000</option>
									<option value="1200000">1200000-1400000</option>
									<option value="1400000">1400000-1600000</option>
									<option value="1600000">1600000-1800000</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="maxDownPayment" class="col-sm-6">Down Payment</label>
							<div class="col-sm-12">
								<input type="number" name="maxDownPayment" id="maxDownPayment"
									class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label for="existEmi" class="col-sm-6">Existing EMI </label>
							<div class="col-sm-12">
								<select class="form-control" id="existEmi" name="existEmi">
									<option>select emi</option>
									<option value="5000">0-5000</option>
									<option value="10000">5000-10000</option>
									<option value="15000">10000-15000</option>
									<option value="20000">15000-20000</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="affordability" class="col-sm-6">EMI
								Affordability</label>
							<div class="col-sm-12">
								<select class="form-control" id="affordability"
									name="affordability">
									<option>select emiAffordability</option>
									<option value="1">0-5000</option>
									<option value="2">5000-10000</option>
									<option value="3">10000-15000</option>
									<option value="4">15000-20000</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="customerHouseType" class="col-sm-6">House
								Type</label>
							<div class="col-sm-12">
								<select class="form-control" id="customerHouseType"
									name="customerHouseType">
									<option>select houseType</option>
									<option value="1">Rented House</option>
									<option value="2">Self Owned</option>
									<option value="3">Parent Owned</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="isHaveIncomeProof" class="col-sm-6">Income
								Proof</label>
							<div class="col-sm-12">
								<select class="form-control" id="isHaveIncomeProof"
									name="isHaveIncomeProof">
									<option>select IncomeProof</option>
									<option value="1">Yes</option>
									<option value="0">No</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="guarantor" class="col-sm-6">Guarantor</label>
							<div class="col-sm-12">
								<select class="form-control" id="guarantor" name="guarantor">
									<option>select guarantor</option>
									<option value="1">No guarantor</option>
									<option value="2">Family</option>
									<option value="3">Blood Relative</option>
									<option value="4">Friends</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="cusLocationName" class="col-sm-6">Location</label>
							<div class="col-sm-12">
								<select class="form-control" name="cusLocationName"
									id="cusLocationName">
									<option>location</option>
									<option value="banglore">Banglore</option>
									<option value="chennai">Chennai</option>
									<option value="mumbai">Mumbai</option>
									<option value="delhi">Delhi</option>
									<option value="kerala">Kerala</option>
									<option value="pune">Pune</option>
								</select>
							</div>
						</div>



						<div class="row form-group text-center justify-content-between">
							<div class="col-sm-6">
								<button type="reset" class="btn btn-danger col-sm-12 btn-lg">Clear</button>
							</div>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success btn-lg col-sm-12">Loan
									Check</button>
							</div>
							<!-- <button type="submit" class="btn btn-success btn-lg">Loan
								Check</button> -->
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-3"></div>
	</div>

	<script type="text/javascript">
		function getYear() {
			var request = new XMLHttpRequest();

			request.open('GET', './getAllDistYear.do', true);
			request.onload = function() {
				// Begin accessing JSON data here
				var data = JSON.parse(this.response)

				if (request.status >= 200 && request.status < 400) {
					console.log(data);
					var x = "<option>Select MFG Year</option>";
					for (i = 0; i < data.length; i++) {
						x += "<option>" + data[i] + "</option>"
					}
					document.getElementById('mfgYear').innerHTML = x;
				} else {
					console.log('error')
				}
			}

			request.send()
		}

		function changeYear() {
			var request = new XMLHttpRequest();
			var mfgYear = document.getElementById('mfgYear').value;
			request.open('GET',
					'./getAllDistBrandByYear.do?mfgYear=' + mfgYear, true);
			request.onload = function() {
				// Begin accessing JSON data here
				var data = JSON.parse(this.response)

				if (request.status >= 200 && request.status < 400) {
					console.log(data);
					var x = "<option>Select Brand</option>";
					for (i = 0; i < data.length; i++) {
						x += "<option>" + data[i] + "</option>"
					}
					document.getElementById('brand').innerHTML = x;
					document.getElementById('brndDrpDwn').style.display = "block";
				} else {
					console.log('error')
				}
			}

			request.send()
		}

		function changeBrand() {
			var request = new XMLHttpRequest();
			var mfgYear = document.getElementById('mfgYear').value;
			var brand = document.getElementById('brand').value;
			request.open('GET', './getAllDistinctModelByBrandNYear.do?mfgYear='
					+ mfgYear + '&brand=' + brand, true);
			request.onload = function() {
				// Begin accessing JSON data here
				var data = JSON.parse(this.response)

				if (request.status >= 200 && request.status < 400) {
					console.log(data);
					var x = "<option>Select Model</option>";
					for (i = 0; i < data.length; i++) {
						x += "<option>" + data[i] + "</option>"
					}
					document.getElementById('model').innerHTML = x;
					document.getElementById('mdlDrpDwn').style.display = "block";
				} else {
					console.log('error')
				}
			}

			request.send()

		}

		function changeModel() {
			var request = new XMLHttpRequest();
			var mfgYear = document.getElementById('mfgYear').value;
			var brand = document.getElementById('brand').value;
			var model = document.getElementById('model').value;
			request.open('GET',
					'./getAllDistinctVariantByBrandNYearNModel.do?mfgYear='
							+ mfgYear + '&brand=' + brand + '&model=' + model,
					true);
			request.onload = function() {
				// Begin accessing JSON data here
				var data = JSON.parse(this.response)

				if (request.status >= 200 && request.status < 400) {
					console.log(data);
					var x = "<option>Select Variant</option>";
					for (i = 0; i < data.length; i++) {
						x += "<option>" + data[i] + "</option>"
					}
					document.getElementById('variant').innerHTML = x;
					document.getElementById('vrntDrpDwn').style.display = "block";
				} else {
					console.log('error')
				}
			}

			request.send();

		}
	</script>
</body>
</html>