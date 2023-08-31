í
dE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\ExampleClient\Controllers\WeatherForecastController.cs
	namespace 	
ExampleClient
 
. 
Controllers #
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class %
WeatherForecastController *
:+ ,
ControllerBase- ;
{ 
private		 
readonly		 
IHttpClientFactory		 +
_httpClientFactory		, >
;		> ?
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str 
, 
$str '
,' (
$str) /
,/ 0
$str1 7
,7 8
$str9 ?
,? @
$strA H
,H I
$strJ O
,O P
$strQ ]
,] ^
$str_ j
} 
; 
private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
,R S
IHttpClientFactoryT f
httpClientFactoryg x
)x y
{ 	
_logger 
= 
logger 
; 
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
} 	
[ 	
HttpGet	 
] 
public 
IEnumerable 
< 
WeatherForecast *
>* +
Get, /
(/ 0
)0 1
{ 	
return 

Enumerable 
. 
Range #
(# $
$num$ %
,% &
$num' (
)( )
.) *
Select* 0
(0 1
index1 6
=>7 9
new: =
WeatherForecast> M
{ 
Date 
= 
DateTime 
.  
Now  #
.# $
AddDays$ +
(+ ,
index, 1
)1 2
,2 3
TemperatureC 
= 
Random %
.% &
Shared& ,
., -
Next- 1
(1 2
-2 3
$num3 5
,5 6
$num7 9
)9 :
,: ;
Summary 
= 
	Summaries #
[# $
Random$ *
.* +
Shared+ 1
.1 2
Next2 6
(6 7
	Summaries7 @
.@ A
LengthA G
)G H
]H I
}   
)   
.!! 
ToArray!! 
(!! 
)!! 
;!! 
}"" 	
}%% 
}&& ß
ME:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\ExampleClient\LoginViewModel.cs
	namespace 	
ExampleClient
 
{ 
public 

class 
LoginViewModel 
{ 
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public		 
string		 
UserName		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		* +
[ 	
Required	 
] 
[ 	
DataType	 
( 
DataType 
. 
Password #
)# $
]$ %
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}* +
} 
} ú'
FE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\ExampleClient\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. 
AddSwaggerGen 
( 
c  
=>! #
{ 
c 
. 

SwaggerDoc 
( 
$str 
, 
new 
OpenApiInfo &
{' (
Title) .
=/ 0
$str1 >
,> ?
Version@ G
=H I
$strJ N
}O P
)P Q
;Q R
} 
) 
; 
var 
handler 
= 
new 
HttpClientHandler #
(# $
)$ %
;% &
handler 
. 
ClientCertificates 
. 
Add 
( 
X509Certificate2 /
./ 0
CreateFromPemFile0 A
(A B
$strB i
,i j
$str	k ’
)
’ “
)
“ ”
;
” •
handler 
. 5
)ServerCertificateCustomValidationCallback 1
=2 3
(4 5
message5 <
,< =
cert> B
,B C
chainD I
,I J
errorsK Q
)Q R
=>S U
{ 
var 
chainPolicy 
= 
new 
X509ChainPolicy )
{ 
RevocationMode 
= 
X509RevocationMode +
.+ ,
NoCheck, 3
,3 4
VerificationFlags 
= !
X509VerificationFlags 1
.1 2,
 AllowUnknownCertificateAuthority2 R
,R S
	TrustMode 
= 
X509ChainTrustMode &
.& '
CustomRootTrust' 6
,6 7
VerificationTime!! 
=!! 
DateTime!! #
.!!# $
Now!!$ '
,!!' (
}"" 
;"" 
var%% 
rootcert%% 
=%% 
new%% 
X509Certificate2%% '
(%%' (
$str%%( K
)%%K L
;%%L M
chainPolicy&& 
.&& 
CustomTrustStore&&  
.&&  !
Clear&&! &
(&&& '
)&&' (
;&&( )
chainPolicy'' 
.'' 
CustomTrustStore''  
.''  !
Add''! $
(''$ %
rootcert''% -
)''- .
;''. /
chain** 	
??=**
 
new** 
	X509Chain** 
(** 
)** 
;** 
chain++ 	
.++	 

ChainPolicy++
 
=++ 
chainPolicy++ #
;++# $
var.. 
certificateIsValid.. 
=.. 
chain.. "
..." #
Build..# (
(..( )
cert..) -
)..- .
;... /
return// 

certificateIsValid// 
;// 
}00 
;00 
varAA 
appAA 
=AA 	
builderAA
 
.AA 
BuildAA 
(AA 
)AA 
;AA 
varCC 
envCC 
=CC 	
appCC
 
.CC 
ServicesCC 
.CC 

GetServiceCC !
<CC! "
IWebHostEnvironmentCC" 5
>CC5 6
(CC6 7
)CC7 8
;CC8 9
ifGG 
(GG 
envGG 
.GG 
IsDevelopmentGG 
(GG 
)GG 
)GG 
{HH 
appII 
.II 

UseSwaggerII 
(II 
)II 
;II 
appJJ 
.JJ 
UseSwaggerUIJJ 
(JJ 
cJJ 
=>JJ 
{KK 
cLL 	
.LL	 

SwaggerEndpointLL
 
(LL 
$strLL 4
,LL4 5
$strLL6 A
)LLA B
;LLB C
}MM 
)MM 
;MM 
appNN 
.NN 
UseExceptionHandlerNN 
(NN 
$strNN 0
)NN0 1
;NN1 2
}OO 
elsePP 
{QQ 
appRR 
.RR 
UseExceptionHandlerRR 
(RR 
$strRR $
)RR$ %
;RR% &
}SS 
appUU 
.UU 
UseHttpsRedirectionUU 
(UU 
)UU 
;UU 
appYY 
.YY 
UseAuthenticationYY 
(YY 
)YY 
;YY 
appZZ 
.ZZ 
UseAuthorizationZZ 
(ZZ 
)ZZ 
;ZZ 
app]] 
.]] 
MapControllers]] 
(]] 
)]] 
;]] 
app__ 
.__ 
Run__ 
(__ 
)__ 	
;__	 
ä
NE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\ExampleClient\WeatherForecast.cs
	namespace 	
ExampleClient
 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} 