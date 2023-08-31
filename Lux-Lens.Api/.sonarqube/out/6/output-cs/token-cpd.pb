∂9
gE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\Authentication\LoginController.cs
	namespace

 	
LuxLens


 
.

 
Api

 
.

 
Controllers

 !
.

! "
Authentication

" 0
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
LoginController  
:! "
ControllerBase# 1
{ 
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
SignInManager &
<& '
IdentityUser' 3
>3 4
_signInManager5 C
;C D
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
LoginController 
( 
SignInManager ,
<, -
IdentityUser- 9
>9 :
signInManager; H
,H I
UserManagerJ U
<U V
IdentityUserV b
>b c
userManagerd o
,o p
IUserServiceq }
userService	~ â
,
â ä
RoleManager
ã ñ
<
ñ ó
IdentityRole
ó £
>
£ §
roleManager
• ∞
,
∞ ±
IConfiguration
≤ ¿
configuration
¡ Œ
)
Œ œ
{ 	
_userManager 
= 
userManager &
;& '
_signInManager 
= 
signInManager *
;* +
_roleManager 
= 
roleManager &
;& '
_configuration 
= 
configuration *
;* +
_userService 
= 
userService &
;& '
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Login) .
(. /
[/ 0
FromBody0 8
]8 9
LoginDto: B
requestC J
)J K
{   	
var!! 
user!! 
=!! 
await!! 
_userManager!! )
.!!) *
FindByNameAsync!!* 9
(!!9 :
request!!: A
.!!A B
UserName!!B J
)!!J K
;!!K L
if## 
(## 
user## 
is## 
null## 
||## 
!##  !
await##! &
_userManager##' 3
.##3 4
CheckPasswordAsync##4 F
(##F G
user##G K
,##K L
request##M T
.##T U
Password##U ]
)##] ^
)##^ _
{$$ 
return%% 
Ok%% 
(%% 
new%% 
{&& 
hasError'' 
='' 
true'' #
,''# $
message(( 
=(( 
$str(( 1
,((1 2
model)) 
=)) 
new)) 
{))  !
title))" '
=))( )
$str))* `
}))a b
,))b c
	requestId** 
=** 
System**  &
.**& '
Diagnostics**' 2
.**2 3
Activity**3 ;
.**; <
Current**< C
?**C D
.**D E
Id**E G
}++ 
)++ 
;++ 
},, 
var.. 
roles.. 
=.. 
await.. 
_userManager.. *
...* +
GetRolesAsync..+ 8
(..8 9
user..9 =
)..= >
;..> ?
var11 
claims11 
=11 
new11 
List11 !
<11! "
Claim11" '
>11' (
{22 
new33 
Claim33 
(33 

ClaimTypes33 $
.33$ %
Sid33% (
,33( )
user33* .
.33. /
Id33/ 1
)331 2
,332 3
new44 
Claim44 
(44 

ClaimTypes44 $
.44$ %
Name44% )
,44) *
user44+ /
.44/ 0
UserName440 8
)448 9
}55 
;55 
foreach77 
(77 
var77 
role77 
in77  
roles77! &
)77& '
{88 
claims99 
.99 
Add99 
(99 
new99 
Claim99 $
(99$ %

ClaimTypes99% /
.99/ 0
Role990 4
,994 5
role996 :
)99: ;
)99; <
;99< =
}:: 
var<< 
securityKey<< 
=<< 
new<< ! 
SymmetricSecurityKey<<" 6
(<<6 7
Encoding<<7 ?
.<<? @
UTF8<<@ D
.<<D E
GetBytes<<E M
(<<M N
_configuration<<N \
[<<\ ]
$str<<] f
]<<f g
)<<g h
)<<h i
;<<i j
var== 
credentials== 
=== 
new== !
SigningCredentials==" 4
(==4 5
securityKey==5 @
,==@ A
SecurityAlgorithms==B T
.==T U
HmacSha256Signature==U h
)==h i
;==i j
var>> 
tokenDescriptor>> 
=>>  !
new>>" %
JwtSecurityToken>>& 6
(>>6 7
issuer?? 
:?? 
_configuration?? &
[??& '
$str??' 3
]??3 4
,??4 5
audience@@ 
:@@ 
_configuration@@ (
[@@( )
$str@@) 7
]@@7 8
,@@8 9
claimsAA 
:AA 
claimsAA 
,AA 
expiresBB 
:BB 
DateTimeBB !
.BB! "
NowBB" %
.BB% &

AddMinutesBB& 0
(BB0 1
$numBB1 4
)BB4 5
,BB5 6
signingCredentialsCC "
:CC" #
credentialsCC$ /
)CC/ 0
;CC0 1
varEE 
jwtEE 
=EE 
newEE #
JwtSecurityTokenHandlerEE 1
(EE1 2
)EE2 3
.EE3 4

WriteTokenEE4 >
(EE> ?
tokenDescriptorEE? N
)EEN O
;EEO P
returnGG 
OkGG 
(GG 
newGG 
{HH 
hasErrorII 
=II 
falseII  
,II  !
messageJJ 
=JJ 
$strJJ &
,JJ& '
modelKK 
=KK 
newKK 
{KK 
AccessTokenKK )
=KK* +
jwtKK, /
}KK0 1
,KK1 2
	requestIdLL 
=LL 
SystemLL "
.LL" #
DiagnosticsLL# .
.LL. /
ActivityLL/ 7
.LL7 8
CurrentLL8 ?
?LL? @
.LL@ A
IdLLA C
}MM 
)MM 
;MM 
}OO 	
}PP 
}QQ ¯N
fE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\Authentication\UserController.cs
	namespace 	
LuxLens
 
. 
Api 
. 
Controllers !
.! "
Authentication" 0
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
UserController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
public 
UserController 
( 
IUserService *
userService+ 6
,6 7
RoleManager8 C
<C D
IdentityRoleD P
>P Q
roleManagerR ]
,] ^
UserManager_ j
<j k
IdentityUserk w
>w x
userManager	y Ñ
)
Ñ Ö
{ 	
_userService 
= 
userService &
;& '
_roleManager 
= 
roleManager &
;& '
_userManager 
= 
userManager &
;& '
} 	
[ 	
HttpPost	 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (
Post) -
(- .
[. /
FromBody/ 7
]7 8

NewUserDto9 C
valueD I
)I J
{ 	
if!! 
(!! 

ModelState!! 
.!! 
IsValid!! "
)!!" #
{"" 
IdentityResult## 
result## %
=##& '
await##( -
_userService##. :
.##: ;
AddUserAsync##; G
(##G H
value##H M
)##M N
;##N O
if%% 
(%% 
result%% 
.%% 
	Succeeded%% $
)%%$ %
{&& 
return'' 
Ok'' 
('' 
new'' !
{(( 
hasError))  
=))! "
false))# (
,))( )
message** 
=**  !
$str**" 3
,**3 4
model++ 
=++ 
(++  !
List++! %
<++% &
UserDto++& -
>++- .
)++. /
await++/ 4
_userService++5 A
.++A B
GetUsersAsync++B O
(++O P
)++P Q
,++Q R
	requestId,, !
=,," #
System,,$ *
.,,* +
Diagnostics,,+ 6
.,,6 7
Activity,,7 ?
.,,? @
Current,,@ G
?,,G H
.,,H I
Id,,I K
}-- 
)-- 
;-- 
}.. 
else// 
{00 
foreach11 
(11 
var11  
error11! &
in11' )
result11* 0
.110 1
Errors111 7
)117 8
{22 

ModelState33 "
.33" #
AddModelError33# 0
(330 1
error331 6
.336 7
Code337 ;
,33; <
error33= B
.33B C
Description33C N
)33N O
;33O P
}55 
return66 
Ok66 
(66 
new66 !
{77 
hasError88  
=88! "
true88# '
,88' (
message99 
=99  !
$str99" /
,99/ 0
model:: 
=:: 
result::  &
.::& '
Errors::' -
,::- .
	requestId;; !
=;;" #
System;;$ *
.;;* +
Diagnostics;;+ 6
.;;6 7
Activity;;7 ?
.;;? @
Current;;@ G
?;;G H
.;;H I
Id;;I K
}<< 
)<< 
;<< 
}== 
}>> 
else?? 
{@@ 
returnAA 

BadRequestAA !
(AA! "
newAA" %
{BB 
hasErrorCC 
=CC 
trueCC #
,CC# $
messageDD 
=DD 
$strDD +
,DD+ ,
modelEE 
=EE 
newEE 
{EE  !
titleEE" '
=EE( )
$strEE* 7
,EE7 8
messageEE9 @
=EEA B
$strEEC i
}EEj k
,EEk l
	requestIdFF 
=FF 
SystemFF  &
.FF& '
DiagnosticsFF' 2
.FF2 3
ActivityFF3 ;
.FF; <
CurrentFF< C
?FFC D
.FFD E
IdFFE G
}GG 
)GG 
;GG 
}HH 
}II 	
[KK 	
HttpPostKK	 
(KK 
$strKK 
)KK  
]KK  !
[LL 	
	AuthorizeLL	 
(LL 
RolesLL 
=LL 
$strLL "
)LL" #
]LL# $
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (

CreateRoleMM) 3
(MM3 4
[MM4 5
FromBodyMM5 =
]MM= >
stringMM? E
roleNameMMF N
)MMN O
{NN 	
ifOO 
(OO 
!OO 
awaitOO 
_roleManagerOO #
.OO# $
RoleExistsAsyncOO$ 3
(OO3 4
roleNameOO4 <
)OO< =
)OO= >
{PP 
varQQ 
resultQQ 
=QQ 
awaitQQ "
_roleManagerQQ# /
.QQ/ 0
CreateAsyncQQ0 ;
(QQ; <
newQQ< ?
IdentityRoleQQ@ L
(QQL M
roleNameQQM U
)QQU V
)QQV W
;QQW X
ifRR 
(RR 
resultRR 
.RR 
	SucceededRR $
)RR$ %
{SS 
returnTT 
OkTT 
(TT 
$"TT  
$strTT  &
{TT& '
roleNameTT' /
}TT/ 0
$strTT0 F
"TTF G
)TTG H
;TTH I
}UU 
elseVV 
{WW 
returnXX 

BadRequestXX %
(XX% &
resultXX& ,
.XX, -
ErrorsXX- 3
)XX3 4
;XX4 5
}YY 
}ZZ 
else[[ 
{\\ 
return]] 

BadRequest]] !
(]]! "
$"]]" $
$str]]$ *
{]]* +
roleName]]+ 3
}]]3 4
$str]]4 D
"]]D E
)]]E F
;]]F G
}^^ 
}__ 	
[aa 	
HttpPostaa	 
(aa 
$straa 
)aa  
]aa  !
[bb 	
	Authorizebb	 
(bb 
Rolesbb 
=bb 
$strbb "
)bb" #
]bb# $
publiccc 
asynccc 
Taskcc 
<cc 
IActionResultcc '
>cc' (
AssignRoleToUsercc) 9
(cc9 :
stringcc: @
userIdccA G
,ccG H
stringccI O
roleNameccP X
)ccX Y
{dd 	
varee 
useree 
=ee 
awaitee 
_userManageree )
.ee) *
FindByIdAsyncee* 7
(ee7 8
userIdee8 >
)ee> ?
;ee? @
ifgg 
(gg 
usergg 
!=gg 
nullgg 
)gg 
{hh 
ifii 
(ii 
awaitii 
_roleManagerii &
.ii& '
RoleExistsAsyncii' 6
(ii6 7
roleNameii7 ?
)ii? @
)ii@ A
{jj 
ifkk 
(kk 
!kk 
awaitkk 
_userManagerkk +
.kk+ ,
IsInRoleAsynckk, 9
(kk9 :
userkk: >
,kk> ?
roleNamekk@ H
)kkH I
)kkI J
{ll 
varmm 
addToRoleResultmm +
=mm, -
awaitmm. 3
_userManagermm4 @
.mm@ A
AddToRoleAsyncmmA O
(mmO P
usermmP T
,mmT U
roleNamemmV ^
)mm^ _
;mm_ `
ifoo 
(oo 
addToRoleResultoo +
.oo+ ,
	Succeededoo, 5
)oo5 6
{pp 
returnqq "
Okqq# %
(qq% &
$"qq& (
$strqq( .
{qq. /
roleNameqq/ 7
}qq7 8
$strqq8 L
{qqL M
userqqM Q
.qqQ R
UserNameqqR Z
}qqZ [
$strqq[ i
"qqi j
)qqj k
;qqk l
}rr 
elsess 
{tt 
returnuu "

BadRequestuu# -
(uu- .
addToRoleResultuu. =
.uu= >
Errorsuu> D
)uuD E
;uuE F
}vv 
}ww 
elsexx 
{yy 
returnzz 

BadRequestzz )
(zz) *
$"zz* ,
$strzz, 2
{zz2 3
userzz3 7
.zz7 8
UserNamezz8 @
}zz@ A
$strzzA Y
{zzY Z
roleNamezzZ b
}zzb c
$strzzc d
"zzd e
)zze f
;zzf g
}{{ 
}|| 
else}} 
{~~ 
return 

BadRequest %
(% &
$"& (
$str( .
{. /
roleName/ 7
}7 8
$str8 H
"H I
)I J
;J K
}
ÄÄ 
}
ÅÅ 
else
ÇÇ 
{
ÉÉ 
return
ÑÑ 

BadRequest
ÑÑ !
(
ÑÑ! "
$str
ÑÑ" 2
)
ÑÑ2 3
;
ÑÑ3 4
}
ÖÖ 
}
ÜÜ 	
}
àà 
}ââ ‘
gE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\LensControllers\LensController.cs
	namespace		 	
LuxLens		
 
.		 
Api		 
.		 
Controllers		 !
.		! "
LensControllers		" 1
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
LensController 
:  !
ControllerBase" 0
{ 
private 
readonly 
ILensService %
_lensService& 2
;2 3
public 
LensController 
( 
ILensService *
llensService+ 7
)7 8
{ 	
_lensService 
= 
llensService '
;' (
} 	
[ 	
HttpGet	 
( 
$str 
)  
]  !
[ 	
	Authorize	 
( 
Roles 
= 
$str ,
), -
]- .
public 
async 
Task 
< 
Lens 
> 
GetById  '
(' (
int( +
id, .
). /
{ 	
return 
await 
_lensService %
.% &
GetLensByIdAsync& 6
(6 7
id7 9
)9 :
;: ;
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
[ 	
	Authorize	 
( 
Roles 
= 
$str ,
), -
]- .
public 
async 
Task 
< 
List 
< 
Lens #
># $
>$ %
GetAllLenses& 2
(2 3
)3 4
{   	
return!! 
await!! 
_lensService!! %
.!!% &
GetLensAsync!!& 2
(!!2 3
)!!3 4
;!!4 5
}"" 	
[$$ 	
	Authorize$$	 
($$ 
Roles$$ 
=$$ 
$str$$ "
)$$" #
]$$# $
[%% 	
HttpPost%%	 
(%% 
$str%% 
)%% 
]%% 
public&& 
async&& 
Task&& 
Create&&  
(&&  !
LensDto&&! (
lens&&) -
)&&- .
{'' 	
await(( 
_lensService(( 
.(( 
AddLensAsync(( +
(((+ ,
lens((, 0
)((0 1
;((1 2
})) 	
[++ 	
HttpPut++	 
(++ 
$str++ 
)++ 
]++ 
[,, 	
	Authorize,,	 
(,, 
Roles,, 
=,, 
$str,, "
),," #
],,# $
public-- 
async-- 
Task-- 
EditLens-- "
(--" #
int--# &
id--' )
,--) *
[--+ ,
FromBody--, 4
]--4 5
LensDto--6 =
value--> C
)--C D
{.. 	
await// 
_lensService// 
.// 
EditLensAsync// ,
(//, -
value//- 2
,//2 3
id//4 6
)//6 7
;//7 8
}00 	
[33 	

HttpDelete33	 
(33 
$str33 !
)33! "
]33" #
[44 	
	Authorize44	 
(44 
Roles44 
=44 
$str44 "
)44" #
]44# $
public55 
async55 
Task55 

DeleteLens55 $
(55$ %
int55% (
id55) +
)55+ ,
{66 	
await77 
_lensService77 
.77 
DeleteLensAsync77 .
(77. /
id77/ 1
)771 2
;772 3
}88 	
}<< 
}== ñh
DE:\Documentos\GitHub\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder   
.   
Services   
.   
AddTransient   
<   
ILensService   *
,  * +
LensService  , 7
>  7 8
(  8 9
)  9 :
;  : ;
builder!! 
.!! 
Services!! 
.!! 
AddTransient!! 
<!! 
IUserService!! *
,!!* +
UserService!!, 7
>!!7 8
(!!8 9
)!!9 :
;!!: ;
builder"" 
."" 
Services"" 
."" 
AddTransient"" 
<"" 
IRepository"" )
<"") *
int""* -
,""- .
Lens""/ 3
>""3 4
,""4 5

Repository""6 @
<""@ A
int""A D
,""D E
Lens""F J
>""J K
>""K L
(""L M
)""M N
;""N O
builder$$ 
.$$ 
Services$$ 
.$$ 
AddAutoMapper$$ 
($$ 
typeof$$ %
($$% &
Lux_Lens$$& .
.$$. /
ApplicationServices$$/ B
.$$B C
MapperProfile$$C P
)$$P Q
)$$Q R
;$$R S
string'' 
connectionString'' 
='' 
builder'' !
.''! "
Configuration''" /
[''/ 0
$str''0 C
]''C D
;''D E
builder)) 
.)) 
Services)) 
.)) 
AddDbContext)) 
<)) 
LensDbContext)) +
>))+ ,
()), -
options))- 4
=>))5 7
options** 
.** 
UseMySql**  
(**  !
connectionString**! 1
,**1 2
ServerVersion**3 @
.**@ A

AutoDetect**A K
(**K L
connectionString**L \
)**\ ]
)**] ^
)**^ _
;**_ `
builder// 
.// 
Services// 
.// 
AddIdentity// 
<// 
IdentityUser// )
,//) *
IdentityRole//+ 7
>//7 8
(//8 9
options//9 @
=>//A C
options//D K
.//K L
SignIn//L R
.//R S#
RequireConfirmedAccount//S j
=//k l
true//m q
)//q r
.00 $
AddEntityFrameworkStores00 )
<00) *
LensDbContext00* 7
>007 8
(008 9
)009 :
;00: ;
builder22 
.22 
Services22 
.22 
AddSwaggerGen22 
(22 
option22 %
=>22& (
{33 
option44 

.44
 !
AddSecurityDefinition44  
(44  !
JwtBearerDefaults44! 2
.442 3 
AuthenticationScheme443 G
,44G H
new44I L!
OpenApiSecurityScheme44M b
{55 
Description66 
=66 
$str	66 Ä
,
66Ä Å
In77 

=77 
ParameterLocation77 
.77 
Header77 %
,77% &
Name88 
=88 
$str88 
,88 
Type99 
=99 
SecuritySchemeType99 !
.99! "
ApiKey99" (
,99( )
BearerFormat:: 
=:: 
$str:: 
,:: 
Scheme;; 
=;; 
JwtBearerDefaults;; "
.;;" # 
AuthenticationScheme;;# 7
}<< 
)<< 
;<< 
option>> 

.>>
 "
AddSecurityRequirement>> !
(>>! "
new>>" %&
OpenApiSecurityRequirement>>& @
(>>@ A
)>>A B
{?? 
{@@ 	
newAA !
OpenApiSecuritySchemeAA %
{BB 
	ReferenceCC 
=CC 
newCC 
OpenApiReferenceCC  0
{DD 
TypeEE 
=EE 
ReferenceTypeEE &
.EE& '
SecuritySchemeEE' 5
,EE5 6
IdFF 
=FF 
JwtBearerDefaultsFF (
.FF( ) 
AuthenticationSchemeFF) =
}GG 
}HH 
,HH 
newII 
stringII 
[II 
]II 
{II 
}II 
}JJ 	
}KK 
)KK 
;KK 
}LL 
)LL 
;LL 
builderOO 
.OO 
ServicesOO 
.OO 
	ConfigureOO 
<OO  
KestrelServerOptionsOO /
>OO/ 0
(OO0 1
optionsOO1 8
=>OO9 ;
{PP 
optionsQQ 
.QQ "
ConfigureHttpsDefaultsQQ "
(QQ" #
optionsQQ# *
=>QQ+ -
{QQ. /
optionsSS 
.SS 
ServerCertificateSS !
=SS" #
X509Certificate2SS$ 4
.SS4 5
CreateFromPemFileSS5 F
(SSF G
$strSSG _
,SS_ `
$strSSa y
)SSy z
;SSz {
optionsUU 
.UU !
ClientCertificateModeUU %
=UU& '!
ClientCertificateModeUU( =
.UU= >
RequireCertificateUU> P
;UUP Q
optionsWW 
.WW %
AllowAnyClientCertificateWW )
(WW) *
)WW* +
;WW+ ,
}XX 
)XX 
;XX 
}ZZ 
)ZZ 
;ZZ 
builder\\ 
.\\ 
Services\\ 
.]] "
AddHttpContextAccessor]] 
(]] 
)]] 
.^^ 
AddAuthentication^^ 
(^^ 
options^^ 
=>^^ !
{__ 
options`` 
.`` %
DefaultAuthenticateScheme`` )
=``* +
JwtBearerDefaults``, =
.``= > 
AuthenticationScheme``> R
;``R S
optionsaa 
.aa "
DefaultChallengeSchemeaa &
=aa' (
JwtBearerDefaultsaa) :
.aa: ; 
AuthenticationSchemeaa; O
;aaO P
optionsbb 
.bb 
DefaultSchemebb 
=bb 
JwtBearerDefaultsbb  1
.bb1 2 
AuthenticationSchemebb2 F
;bbF G
}cc 
)cc 
.dd 
AddJwtBearerdd 
(dd 
optionsdd 
=>dd 
{ee 
optionsff 
.ff  
RequireHttpsMetadataff $
=ff% &
falseff' ,
;ff, -
optionsgg 
.gg 
	SaveTokengg 
=gg 
truegg  
;gg  !
optionshh 
.hh %
TokenValidationParametershh )
=hh* +
newhh, /%
TokenValidationParametershh0 I
{ii 	
ValidateIssuerjj 
=jj 
truejj !
,jj! "
ValidateAudiencekk 
=kk 
truekk #
,kk# $
ValidateLifetimell 
=ll 
truell #
,ll# $$
ValidateIssuerSigningKeymm $
=mm% &
truemm' +
,mm+ ,
ValidIssuernn 
=nn 
buildernn !
.nn! "
Configurationnn" /
[nn/ 0
$strnn0 <
]nn< =
,nn= >
ValidAudienceoo 
=oo 
builderoo #
.oo# $
Configurationoo$ 1
[oo1 2
$stroo2 @
]oo@ A
,ooA B
IssuerSigningKeypp 
=pp 
newpp " 
SymmetricSecurityKeypp# 7
(pp7 8
Encodingpp8 @
.pp@ A
UTF8ppA E
.ppE F
GetBytesppF N
(ppN O
builderppO V
.ppV W
ConfigurationppW d
[ppd e
$strppe n
]ppn o
)ppo p
)ppp q
}qq 	
;qq	 

}rr 
)rr 
;rr 
buildertt 
.uu 
Servicesuu 
.vv 
AddAuthorizationvv 
(vv 
optionsvv 
=>vv  
{ww 
optionsyy 
.yy 
DefaultPolicyyy 
=yy 
newyy  #&
AuthorizationPolicyBuilderyy$ >
(yy> ?
)yy? @
.zz $
RequireAuthenticatedUserzz %
(zz% &
)zz& '
.{{ 
Build{{ 
({{ 
){{ 
;{{ 
}|| 
)|| 
.}} 
AddAuthentication}} 
(}} -
!CertificateAuthenticationDefaults}} 8
.}}8 9 
AuthenticationScheme}}9 M
)}}M N
.~~ 
AddCertificate~~ 
(~~ 
options~~ 
=>~~ 
{ 
options
ÅÅ 
.
ÅÅ 
RevocationMode
ÅÅ 
=
ÅÅ   
X509RevocationMode
ÅÅ! 3
.
ÅÅ3 4
NoCheck
ÅÅ4 ;
;
ÅÅ; <
options
ÉÉ 
.
ÉÉ $
ValidateValidityPeriod
ÉÉ &
=
ÉÉ' (
true
ÉÉ) -
;
ÉÉ- .
options
ÖÖ 
.
ÖÖ %
AllowedCertificateTypes
ÖÖ '
=
ÖÖ( )
CertificateTypes
ÖÖ* :
.
ÖÖ: ;
Chained
ÖÖ; B
;
ÖÖB C
options
áá 
.
áá &
ChainTrustValidationMode
áá (
=
áá) * 
X509ChainTrustMode
áá+ =
.
áá= >
CustomRootTrust
áá> M
;
ááM N
var
ââ 
rootcert
ââ 
=
ââ 
new
ââ 
X509Certificate2
ââ +
(
ââ+ ,
$str
ââ, D
)
ââD E
;
ââE F
options
ää 
.
ää 
CustomTrustStore
ää  
.
ää  !
Clear
ää! &
(
ää& '
)
ää' (
;
ää( )
options
ãã 
.
ãã 
CustomTrustStore
ãã  
.
ãã  !
Add
ãã! $
(
ãã$ %
rootcert
ãã% -
)
ãã- .
;
ãã. /
}
åå 
)
åå 
;
åå 
builderèè 
.
èè 
Services
èè 
.
èè 
AddCors
èè 
(
èè 
options
èè  
=>
èè! #
{
êê 
options
ëë 
.
ëë 
	AddPolicy
ëë 
(
ëë 
$str
ëë '
,
ëë' (
builder
ëë) 0
=>
ëë1 3
{
íí 
builder
ìì 
.
ìì 
AllowAnyOrigin
ìì "
(
ìì" #
)
ìì# $
.
îî 
AllowAnyHeader
îî 
(
îî 
)
îî 
.
ïï 
AllowAnyMethod
ïï 
(
ïï 
)
ïï 
;
ïï 
}
ññ 	
)
ññ	 

;
ññ
 
}
óó 
)
óó 
;
óó 
varöö 
app
öö 
=
öö 	
builder
öö
 
.
öö 
Build
öö 
(
öö 
)
öö 
;
öö 
usingùù 
(
ùù 
var
ùù 

scope
ùù 
=
ùù 
app
ùù 
.
ùù 
Services
ùù 
.
ùù  
CreateScope
ùù  +
(
ùù+ ,
)
ùù, -
)
ùù- .
{ûû 
var
üü 
services
üü 
=
üü 
scope
üü 
.
üü 
ServiceProvider
üü (
;
üü( )
var
°° 
context
°° 
=
°° 
services
°° 
.
°°  
GetRequiredService
°° -
<
°°- .
LensDbContext
°°. ;
>
°°; <
(
°°< =
)
°°= >
;
°°> ?
context
¢¢ 
.
¢¢ 
Database
¢¢ 
.
¢¢ 
Migrate
¢¢ 
(
¢¢ 
)
¢¢ 
;
¢¢ 
}££ 
app¶¶ 
.
¶¶ 
UseCors
¶¶ 
(
¶¶ 
$str
¶¶ 
)
¶¶ 
;
¶¶ 
if©© 
(
©© 
app
©© 
.
©© 
Environment
©© 
.
©© 
IsDevelopment
©© !
(
©©! "
)
©©" #
)
©©# $
{™™ 
app
´´ 
.
´´ 

UseSwagger
´´ 
(
´´ 
)
´´ 
;
´´ 
app
¨¨ 
.
¨¨ 
UseSwaggerUI
¨¨ 
(
¨¨ 
)
¨¨ 
;
¨¨ 
}≠≠ 
appØØ 
.
ØØ !
UseHttpsRedirection
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
app≤≤ 
.
≤≤ 
UseAuthentication
≤≤ 
(
≤≤ 
)
≤≤ 
;
≤≤ 
app≥≥ 
.
≥≥ 
UseAuthorization
≥≥ 
(
≥≥ 
)
≥≥ 
;
≥≥ 
appµµ 
.
µµ 
MapControllers
µµ 
(
µµ 
)
µµ 
;
µµ 
app∑∑ 
.
∑∑ 
Run
∑∑ 
(
∑∑ 
)
∑∑ 	
;
∑∑	 
