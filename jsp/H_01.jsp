<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*,javafx.scene.web.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@
	String page = request.getParameter("p");
	if (page != null) {
		page = page.replaceAll("&", "&amp")
			.replaceAll("<", "&lt;")
                        .replaceAll(">", "&gt;")
                        .replaceAll("\"", "&quot;")
                        .replaceAll("'", "&#x27;")
                        .replaceAll("/", "&#x2F;");
	} else {
		page = "1"
	}
%>
<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>





<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<!-- Main page -->
<html>
<head>
  <!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet" type="text/css" />
<link href="/oss/oss/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
//-->
</script>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>

<script type="text/JavaScript">
<!--
var testMode = 'false';

function getMethod()
{
	return 'GET';	
}

function getPostParams()
{
    var params = "";    
   
   return params;
}

function isConnectingPage()
{
    var isConnecting = '';
    return (isConnecting == 'true');
}

function initPageCommon()
{
	var isShoppingManualEnabled = "true";
    	if (ecSupportsSession()) {
        	isShoppingManualEnabled = ec.getSessionValue("isShopManEnabled");
    	}
    
    	if (isShoppingManualEnabled != "true") {
    		hideElement("tophelpshadow");
	    	hideElement("help");
    	}
    	
	var ecsUrl = null;
	var iasUrl = null;
	var ccsUrl = null;
	var ucsUrl = null;
	var currBalance = null;

    // js file loading check
	var shopErrCheck = new wiiShop();
	if (shopErrCheck != null && "error" in shopErrCheck) {
		// shopErrCheck.error(209620, 1);
		if (!ecCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!errorCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!buttonsCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!imagesCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!soundCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!shopCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!ossCheck) {
			shopErrCheck.error(209620, 1);
		}
	}

	init();
	
	// Cancel any ongoing async ops
	ec.cancelOperation();
	

	ecsUrl = 'https://ecs.blinklab.com/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.blinklab.com/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.blinklab.com/oss/serv/";
	secureOssPath = "https://oss-auth.blinklab.com/oss/serv/";	

	ecTimeout = new ECTimeout(parseInt("60000"));
	
	
	currBalance = document.getElementById("currentBalance");
	if(currBalance) {
		currBalance.innerHTML = getBalance();
	}		
	
	setLogUrl("Log.jsp");

    if(shop.isCompatibleMode)
    {
        setEulaUrl("L_01.jsp");
    }
    else
    {
        setEulaUrl("L_03_UA_1.jsp");
    }

	
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_a.gif');
	var supportsCreditCard = 'false';
	if (ecSupportsSession()) {
        	ec.setSessionValue("supportsCreditCard", supportsCreditCard);
    	}

    updateHistory();
	var isConnecting = isConnectingPage();
    setConnectingToServer(isConnecting);
    
    if (isHRPDisablePage()) {
	   	wiiDisableHRP();
	} else {
	   	wiiEnableHRP();
	}
}

<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->


// Takes a progress object and returns the OSS error message to be displayed to the user
function getOssErrorMsg(progress)
{
	if (progress.status >= 0) { return ""; }
	
    var status = progress.status;
    var errCode = progress.errCode;
    var errInfo = progress.errInfo;

    var msg;	

	var a = new Array();	
	// EC lib Errors
	//a[-(EC_ERROR_CANCELED)] = "???OSS_ERROR_NETWORK_TIMEOUT???";
	a[-(EC_ERROR_NET_NA)] = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ECARD)] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_REGISTER)] = "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	msg = a[-status];

    if (status == EC_ERROR_WS_REPORT) {
    	 msg = getWebServiceErrorMsg(errCode, errInfo);
    } else if (status == EC_ERROR_NET_CONTENT ||
               status == EC_ERROR_FAIL ||
    	       status == EC_ERROR_WS_RECV) {
    	if (errCode != null && errCode < 0) {
    	    var httpStatus = errCodeToHTTPStatus(errCode);
    	    var nhttpStatus = errCodeToNHTTPStatus(errCode);    
      	    if (nhttpStatus == 0 && shop.isCompatibleMode) {
    		    msg = "There was a network error. Check your settings under the Internet option in System Settings on the Wii U Menu.";
    		} else if (nhttpStatus == 0) {
    		    msg = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
    		} else if (nhttpStatus != 0) {
    		    msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Error Code: <span id='errorCode'></span></span>"
		+ '<BR><span class="contentsRedM">' + errorMsg + '</span>';
	elem.innerHTML = html;
	document.getElementById("errorCode").innerHTML = errorCode;
}

function setErrorHtml(elem, progress)
{
	if (elem != null) {
	    var errorCode = getOssErrorCode(progress);
    	var errorMsg = getOssErrorMsg(progress);
    	setErrorHtmlMsg(elem, errorCode, errorMsg);
	}
}


// Web service error messages 
// (only include message that may potentially be displayed to user)
// (errCode is progress.errCode from a web service)
// (errInfo is progress.errInfo from a web service)
function getWebServiceErrorMsg(errCode, errInfo)
{
	var a = new Array();
	
	// ECS Errors
	a[617] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[618] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot redownload it.<BR><BR>Visit support.nintendo.com for assistance.";
	a[642] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[643] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[644] = "Credit cards cannot be used on this console.<BR><BR>Please visit support.nintendo.com for assistance.";
	a[645] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[626] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[625] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ETS Errors
	a[705] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[706] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[707] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// PAS Errors
	a[810]	= "An error has occurred while redeeming your Wii Download Ticket.<BR><BR>Visit support.nintendo.com for assistance.";
	a[811]	= "The Wii Points Card you entered has expired.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "This Wii Points Card has already been redeemed.<BR><BR>Visit support.nintendo.com for assistance.";
	a[819]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	
	a[826]	= "The server is busy.<BR><BR>Please try again later.";
	a[829]	= "The server is busy.<BR><BR>Please try again later.";
	a[830]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[831] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";

	// IAS Errors 
	a[901]	= "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[903]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[928] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[958]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[942] = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[943]	= "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";

	a[941] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	
	// More IAS Errors
	a[1401] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	a[1402] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
        a[1403] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the Username at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1612] = "This Wii Download Ticket cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check that you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the WiiMart. Please check your Parental Controls settings.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "County is required.<BR><BR>Please try again.";
	a[NOA_ERROR_FoundOnBlacklist]				= "Unable to process.<BR><BR>For more information, visit support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "The information you&rsquo;ve entered regarding your credit-card billing address is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCardType]                            = "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidVfyValue]                            = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidExpDate]				= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidPostalCode]                          = "The postal code does not match the country settings entered in your Wii Settings.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";
	a[NOA_ERROR_TryAgainLater]				= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "The credit-card expiration date is invalid.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "Billing zip/postal code is invalid. Please verify the information and try again. ";

	a[NOA_ERROR_EmptyVfyValue]				= "Please enter the three-digit security code.";

	var msg = a[code];
	return msg;
}

// IAS errors
function isLoyaltyError(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode >= 1400 && 
		     progress.errCode <= 1499) ||
			(progress.errCode == 942) ||
			(progress.errCode == 943) ||
			(progress.errCode == 941)) {
			return true;
		}
	}
	return false;
}	

function needCheckRegistration(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode == 903) ||
		     (progress.errCode == 642) ||
		     (progress.errCode == 625)) {
			return true;
		}
	}
	return false;		
}

function needSyncEticket(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if (progress.errCode == 621) {
			return true;
		}
	}
	return false;		
}



//-->

</script>
<title>WiiMart</title>
<style type="text/css">

#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:545px;
	height:28px;
	z-index:27;
}
	    #title {
        position: absolute;
        left: 29px;
        top: 28px;
        width: 442px;
        height: 28px;
        z-index: 28;
        /*align="left"; looks like somebody gave up trying to align this to the left*/
    }

    #arrowLshadow {
        position: absolute;
        left: 388px;
        top: 373px;
        width: 71px;
        height: 72px;
        z-index: 1;
    }

    #arrowRshadow {
        position: absolute;
        left: 516px;
        top: 373px;
        width: 71px;
        height: 72px;
        z-index: 2;
    }

    #header01 {
        position: absolute;
        left: 30px;
        top: 100px;
        width: 80px;
        height: 16px;
        z-index: 71;
        text-align: center;
    }

    #header02 {
        position: absolute;
        left: 119px;
        top: 100px;
        width: 132px;
        height: 16px;
        z-index: 72;
        text-align: center;
    }

    #header03 {
        position: absolute;
        left: 259px;
        top: 100px;
        width: 141px;
        height: 16px;
        z-index: 73;
        text-align: center;
    }

    #header04 {
        position: absolute;
        left: 407px;
        top: 100px;
        width: 82px;
        height: 16px;
        z-index: 74;
        text-align: center;
    }

    #header05 {
        position: absolute;
        left: 495px;
        top: 84px;
        width: 80px;
        height: 16px;
        z-index: 75;
        text-align: center;
    }

    #row01 {
        position: absolute;
        left: 27px;
        top: 139px;
        width: 555px;
        height: 42px;
        z-index: 82;
    }

    #row02 {
        position: absolute;
        left: 27px;
        top: 198px;
        width: 555px;
        height: 42px;
        z-index: 81;
    }

    #row03 {
        position: absolute;
        left: 27px;
        top: 257px;
        width: 555px;
        height: 42px;
        z-index: 80;
    }

    #row04 {
        position: absolute;
        left: 27px;
        top: 316px;
        width: 555px;
        height: 42px;
        z-index: 79;
    }

    #date {
        position: absolute;
        left: -2px;
        top: 12px;
        width: 90px;
        height: 18px;
        z-index: 83;
    }

    #type {
        position: absolute;
        left: 89px;
        top: 12px;
        width: 136px;
        height: 18px;
        z-index: 82;
    }

    #content {
        position: absolute;
        left: 229px;
        top: 12px;
        width: 147px;
        height: 18px;
        z-index: 80;
        overflow: hidden;
    }

    #content div {
        position: relative;
        top: -2px;
        text-align: center;
        overflow: hidden;
    }

    #cost {
        position: absolute;
        left: 392px;
        top: 12px;
        width: 63px;
        height: 18px;
        z-index: 78;
    }

    #balance {
        position: absolute;
        left: 479px;
        top: 12px;
        width: 63px;
        height: 18px;
        z-index: 77;
    }

    #aabanner {
        position: absolute;
        left: 227px;
        top: 0px;
        width: 151px;
        height: 42px;
        z-index: 79;
    }

    #aabannerspace {
        position: absolute;
        left: 227px;
        top: 0px;
        width: 151px;
        height: 42px;
        z-index: 81;
    }

    #pageTotal {
        position: absolute;
        left: 440px;
        top: 385px;
        width: 92px;
        height: 36px;
        z-index: 20;
        text-align: center;
    }

    .contentsBlackVS {
        font-family: "Wii NTLG PGothic JPN Regular";
        font-size: 13px;
        color: #323232;
        font-weight: normal;
    }

    #msg {
        position: absolute;
        left: 36px;
        top: 88px;
        width: 540px;
        height: 277px;
        z-index: 37;
    }

    #statusMessage {
        position: absolute;
        left: 104px;
        top: 125px;
        width: 400px;
        height: 195px;
    }

</style>
<script type="text/javascript">
<!--
function initPage()
{
	initPageCommon();
    <%
        boolean credsCorrect = false;
        if (request.getParameter("accountId") != null || 
            request.getParameter("deviceId") != null || 
            request.getParameter("serialNo") != null ||
            request.getParameter("token") != null) {
                String accountId = request.getParameter("accountId");
                String deviceId = request.getParameter("deviceId");
                String serialNo = request.getParameter("serialNo");
                String token = request.getParameter("token");
                String region = request.getParameter("region") == null ? "USA" : request.getParameter("region");
                String body = "{\"accountId\": \"" + accountId + "\", \"deviceId\": \"" + deviceId + "\", \"serialNo\": \"" + serialNo + "\", \"token\": \"" + token + "\", \"region\": \"" + region + "\"}";
                String targetURL = "http://127.0.0.1:8082/checkAccountCreds";
                StringBuilder res = new StringBuilder();

                try {
                    URL url = new URL(targetURL);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    // Forward request body
                    try (OutputStream output = connection.getOutputStream()) {
                        output.write(body.getBytes());
                    }
                    int responseCode = connection.getResponseCode();
                    BufferedReader reader;

                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    } else {
                        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
                    }

                    String line;
                    while ((line = reader.readLine()) != null) {
                        res.append(line);
                    }
                    reader.close();
                } catch (Exception e) {
                    out.println("'There was an error: '" + e.getMessage());
                    //e.printStacktrace();
                }
                credsCorrect = Boolean.parseBoolean(res.toString());
                %>
                console.log(<%= credsCorrect %>);
                <% if (credsCorrect) { %>
                    shop.endWaiting();
    if (ecSupportsSession()) {
    // possibly set session variables in B_24, clear it in H_01 in case of Back button pressed.
        ec.setSessionValue("giftStatus", null);
        trace("clear giftStatus in H_01. ");
        ec.setSessionValue("redownloadFlag", null);
        trace("clear redownloadFlag in H_01. ");
        ec.setSessionValue("senderIndex", null);
        trace("clear senderIndex in H_01. ");
        ec.setSessionValue("transId", null);
        trace("clear transId in H_01. ");
        ec.setSessionValue("transType", null);
        trace("clear transType in H_01. ");
    }
    
                <% } else { %>
                    var errorMsg;
                    errorMsg = '???OSS_ERROR_TWL_REFUND_PASSWORD???';
                    setErrorMsg('205903', errorMsg);
                <% } %>
                
           <% } else { %>
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');

	var next = '';
	if (next == null || next == '') {
		if (isPageJump() || isFatalError()) {
	   		setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound()");
	   	} else {	
	 		setUnderButton(true, 'OK', "javascript:showBack()", "snd.playSE( cSE_Cancel );");
	 	}
	} else {
	 	setUnderButton(true, 'OK', "javascript:showPage(next)", "snd.playSE( cSE_Decide );");
	}
    var errorMsg;
                errorMsg = '???OSS_ERROR_TWL_REFUND_PASSWORD???';
    setErrorMsg('205903', errorMsg);
         <% } %>
}
//-->
</script>
</head>

<body onload="initPage()">

<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<script language="JavaScript">MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');</script>
<div id="underButtonL">
    <div id="underbannershadowL" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerL" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgL" />
    </div>
    <div id="underspacerL" class="buttonSpacer">
	  <a href="javascript:showBack()" id="underlinkL">
    	<img id="underimageL" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgL','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordL" align="center" class="buttonTextBlackM buttonWord"><table width="100%" height="100%"><tr><td align="center" valign="middle">Back</tr></td></table></div>
</div>

<div id="underButtonR" style="display:none">
    <div id="underbannershadowR" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerR" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgR" />
    </div>
    <div id="underspacerR" class="buttonSpacer">
	  <a href="" id="underlinkR">
    	<img id="underimageR" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgR','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus ); " 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordR" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButton" style="display:none">
    <div id="underbannershadow" class="buttonBannerShadow">
    	<img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
    <div id="underbanner" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImg" /></div>
    <div id="underspacer" class="buttonSpacer">
	<a href="" id="underlink">
    	<img id="underimage" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
    	onmouseover="MM_swapImage('underImg','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()">
    	</a>
    </div>
    <div id="underword" align="center" class="buttonTextBlackM buttonWord"></div>
</div>


<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<% if (credsCorrect) { %>  
<div class="titleBlackL" id="text01-01">
<div align="left">Account Activity</div>
</div>
<div id="pageTotal" class="buttonTextBlackM"><%@ out.println(page); %>/1</div>

<div id="header01">
      <span id="dateHeader" style="line-height:16px" class="headerBlueS">Date</span>
    </div>
    <div id="header02">
      <span id="typeHeader" style="line-height:16px" class="headerBlueS">Type</span>
    </div>
    <div id="header03">
      <span id="contentHeader" style="line-height:16px" class="headerBlueS">Content</span>
    </div>
    <div id="header04">
      <span id="pointHeader" style="line-height:16px" class="headerBlueS">Wii Points</span>
    </div>
    <div id="header05">
      <span id="balanceHeader" style="line-height:16px" class="headerBlueS">Current Point Balance</span>
    </div>
    <div id="row01">
        <div class="contentsBlack" id="date">
          <div align="center">
            01/01/70</div> <!-- first date -->
        </div>

        <div class="contentsBlack" id="type01" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM01" align="center">typeofactivitiy</div> <!-- first typeofactivity -->
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM01">
            title01</div> <!-- first tn -->
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image1" 
           onmouseover="MM_swapImage('Image11','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image11" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">points+or-</div></div> <!-- first removedBalance -->
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div> <!-- first balanceAfterPurchase -->
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:132px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
      <div id="row02">
        <div class="contentsBlack" id="date">
          <div align="center">
            <?=date("m/d/y")?></div>
        </div>

        <div class="contentsBlack" id="type02" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM02" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM02">
            title02</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image2" 
           onmouseover="MM_swapImage('Image12','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image12" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:191px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
      <div id="row03">
        <div class="contentsBlack" id="date">
          <div align="center">
            dateofactivity</div>
        </div>

        <div class="contentsBlack" id="type03" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM03" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM03">
            title03</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image3" 
           onmouseover="MM_swapImage('Image13','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image13" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:250px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
    <div id="row04">
        <div class="contentsBlack" id="date">
          <div align="center">
            dateofactivity</div>
        </div>

        <div class="contentsBlack" id="type03" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM03" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM03">
            title04</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image4" 
           onmouseover="MM_swapImage('Image14','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image14" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:309px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>   
</div>
<% } else { %>
<div class="titleBlackL" id="text01-01">
<div align="left">Account Activity</div>
</div>
<div id="pageTotal" class="buttonTextBlackM"><%@ out.println(page); %>/1</div>

<div id="header01">
      <span id="dateHeader" style="line-height:16px" class="headerBlueS">Date</span>
    </div>
    <div id="header02">
      <span id="typeHeader" style="line-height:16px" class="headerBlueS">Type</span>
    </div>
    <div id="header03">
      <span id="contentHeader" style="line-height:16px" class="headerBlueS">Content</span>
    </div>
    <div id="header04">
      <span id="pointHeader" style="line-height:16px" class="headerBlueS">Wii Points</span>
    </div>
    <div id="header05">
      <span id="balanceHeader" style="line-height:16px" class="headerBlueS">Current Point Balance</span>
    </div>
    <div id="row01">
        <div class="contentsBlack" id="date">
          <div align="center">
            01/01/70</div> <!-- first date -->
        </div>

        <div class="contentsBlack" id="type01" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM01" align="center">typeofactivitiy</div> <!-- first typeofactivity -->
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM01">
            title01</div> <!-- first tn -->
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image1" 
           onmouseover="MM_swapImage('Image11','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image11" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">points+or-</div></div> <!-- first removedBalance -->
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div> <!-- first balanceAfterPurchase -->
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:132px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
      <div id="row02">
        <div class="contentsBlack" id="date">
          <div align="center">
            <?=date("m/d/y")?></div>
        </div>

        <div class="contentsBlack" id="type02" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM02" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM02">
            title02</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image2" 
           onmouseover="MM_swapImage('Image12','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image12" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:191px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
      <div id="row03">
        <div class="contentsBlack" id="date">
          <div align="center">
            dateofactivity</div>
        </div>

        <div class="contentsBlack" id="type03" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM03" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM03">
            title03</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image3" 
           onmouseover="MM_swapImage('Image13','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image13" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:250px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>    
    <div id="row04">
        <div class="contentsBlack" id="date">
          <div align="center">
            dateofactivity</div>
        </div>

        <div class="contentsBlack" id="type03" style="position:absolute;left:89px;top:12px;width:136px;height:18px;z-index:82;">
           <div id="typeM03" align="center">typeofactivitiy</div>
        </div>
       
        <div class="contentsBlack" id="content">
          <div id="contentM03">
            title04</div>
        </div>

    <div id="aabannerspace">
        <a href="#" onmouseover="snd.playSE( cSE_Forcus );" onclick="snd.playSE(cSE_Decide);">
          <img src="/oss/oss/common/images/banner//spacer.gif" width="151" height="42" border="0" id="Image4" 
           onmouseover="MM_swapImage('Image14','','/oss/oss/common/images/banner/aa_banner_b.gif',1)" 
           onmouseout="MM_swapImgRestore()" />
        </a>
      </div>
      <div id="aabanner">
        <img src="/oss/oss/common/images/banner/aa_banner_a.gif" width="151" height="42" id="Image14" />
      </div>
    <div id="cost">
          <div align="right" class="contentsBlack">
            <div align="center">
                  
                    points+or-</div>
          </div>
        </div>
        <div id="balance">
          <div align="right" class="contentsBlack">
            <div align="center">null</div>
          </div>
        </div>
    <img src="/oss/oss/common/images/banner/account_activity.png" width="555" height="42" />
      </div>
      <div id="aabannershadow" style="position:absolute; left:245px; top:309px; width:170px; height:58px; z-index:78">
      <img src="/oss/oss/common/images/banner/under_banner_shadow.gif" width="170" height="58" />
    </div>   
</div>
<% } %>


<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<div id="errCodeBlockDiv">
<div align="left" class="warningRed" id="errorCodeText" style="display:none">
    Error Code: <span id="errorCodePlaceholder"></span></div>

<div align="left" class="contentsRedM" id="errorText" style="display:none">
     <span id="errorTextPlaceholder"></span>
</div>
</div>
</body>
</html>
