∫9
kC:\Users\maria\Downloads\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\Authentication\LoginController.cs
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
}QQ ¸N
jC:\Users\maria\Downloads\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\Authentication\UserController.cs
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
}ââ ÿ
kC:\Users\maria\Downloads\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Controllers\LensControllers\LensController.cs
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
}== Æh
HC:\Users\maria\Downloads\AppLux-Lens\Lux-Lens.Api\LuxLens.Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddTransient 
< 
ILensService *
,* +
LensService, 7
>7 8
(8 9
)9 :
;: ;
builder 
. 
Services 
. 
AddTransient 
< 
IUserService *
,* +
UserService, 7
>7 8
(8 9
)9 :
;: ;
builder 
. 
Services 
. 
AddTransient 
< 
IRepository )
<) *
int* -
,- .
Lens/ 3
>3 4
,4 5

Repository6 @
<@ A
intA D
,D E
LensF J
>J K
>K L
(L M
)M N
;N O
builder!! 
.!! 
Services!! 
.!! 
AddAutoMapper!! 
(!! 
typeof!! %
(!!% &
Lux_Lens!!& .
.!!. /
ApplicationServices!!/ B
.!!B C
MapperProfile!!C P
)!!P Q
)!!Q R
;!!R S
string$$ 
connectionString$$ 
=$$ 
builder$$ !
.$$! "
Configuration$$" /
.$$/ 0
GetConnectionString$$0 C
($$C D
$str$$D M
)$$M N
;$$N O
builder%% 
.%% 
Services%% 
.%% 
AddDbContext%% 
<%% 
LensDbContext%% +
>%%+ ,
(%%, -
options%%- 4
=>%%5 7
options&& 
.&& 
UseMySql&&  
(&&  !
connectionString&&! 1
,&&1 2
ServerVersion&&3 @
.&&@ A

AutoDetect&&A K
(&&K L
connectionString&&L \
)&&\ ]
)&&] ^
)&&^ _
;&&_ `
builder++ 
.++ 
Services++ 
.++ 
AddIdentity++ 
<++ 
IdentityUser++ )
,++) *
IdentityRole+++ 7
>++7 8
(++8 9
options++9 @
=>++A C
options++D K
.++K L
SignIn++L R
.++R S#
RequireConfirmedAccount++S j
=++k l
true++m q
)++q r
.,, $
AddEntityFrameworkStores,, )
<,,) *
LensDbContext,,* 7
>,,7 8
(,,8 9
),,9 :
;,,: ;
builder.. 
... 
Services.. 
... 
AddSwaggerGen.. 
(.. 
option.. %
=>..& (
{// 
option00 

.00
 !
AddSecurityDefinition00  
(00  !
JwtBearerDefaults00! 2
.002 3 
AuthenticationScheme003 G
,00G H
new00I L!
OpenApiSecurityScheme00M b
{11 
Description22 
=22 
$str	22 Ä
,
22Ä Å
In33 

=33 
ParameterLocation33 
.33 
Header33 %
,33% &
Name44 
=44 
$str44 
,44 
Type55 
=55 
SecuritySchemeType55 !
.55! "
ApiKey55" (
,55( )
BearerFormat66 
=66 
$str66 
,66 
Scheme77 
=77 
JwtBearerDefaults77 "
.77" # 
AuthenticationScheme77# 7
}88 
)88 
;88 
option:: 

.::
 "
AddSecurityRequirement:: !
(::! "
new::" %&
OpenApiSecurityRequirement::& @
(::@ A
)::A B
{;; 
{<< 	
new== !
OpenApiSecurityScheme== %
{>> 
	Reference?? 
=?? 
new?? 
OpenApiReference??  0
{@@ 
TypeAA 
=AA 
ReferenceTypeAA &
.AA& '
SecuritySchemeAA' 5
,AA5 6
IdBB 
=BB 
JwtBearerDefaultsBB (
.BB( ) 
AuthenticationSchemeBB) =
}CC 
}DD 
,DD 
newEE 
stringEE 
[EE 
]EE 
{EE 
}EE 
}FF 	
}GG 
)GG 
;GG 
}HH 
)HH 
;HH 
builderKK 
.KK 
ServicesKK 
.KK 
	ConfigureKK 
<KK  
KestrelServerOptionsKK /
>KK/ 0
(KK0 1
optionsKK1 8
=>KK9 ;
{LL 
optionsMM 
.MM "
ConfigureHttpsDefaultsMM "
(MM" #
optionsMM# *
=>MM+ -
{MM. /
optionsOO 
.OO 
ServerCertificateOO !
=OO" #
X509Certificate2OO$ 4
.OO4 5
CreateFromPemFileOO5 F
(OOF G
$strOOG _
,OO_ `
$strOOa y
)OOy z
;OOz {
optionsQQ 
.QQ !
ClientCertificateModeQQ %
=QQ& '!
ClientCertificateModeQQ( =
.QQ= >
RequireCertificateQQ> P
;QQP Q
optionsSS 
.SS %
AllowAnyClientCertificateSS )
(SS) *
)SS* +
;SS+ ,
}TT 
)TT 
;TT 
}VV 
)VV 
;VV 
builderXX 
.XX 
ServicesXX 
.YY "
AddHttpContextAccessorYY 
(YY 
)YY 
.ZZ 
AddAuthenticationZZ 
(ZZ 
optionsZZ 
=>ZZ !
{[[ 
options\\ 
.\\ %
DefaultAuthenticateScheme\\ )
=\\* +
JwtBearerDefaults\\, =
.\\= > 
AuthenticationScheme\\> R
;\\R S
options]] 
.]] "
DefaultChallengeScheme]] &
=]]' (
JwtBearerDefaults]]) :
.]]: ; 
AuthenticationScheme]]; O
;]]O P
options^^ 
.^^ 
DefaultScheme^^ 
=^^ 
JwtBearerDefaults^^  1
.^^1 2 
AuthenticationScheme^^2 F
;^^F G
}__ 
)__ 
.`` 
AddJwtBearer`` 
(`` 
options`` 
=>`` 
{aa 
optionsbb 
.bb  
RequireHttpsMetadatabb $
=bb% &
falsebb' ,
;bb, -
optionscc 
.cc 
	SaveTokencc 
=cc 
truecc  
;cc  !
optionsdd 
.dd %
TokenValidationParametersdd )
=dd* +
newdd, /%
TokenValidationParametersdd0 I
{ee 	
ValidateIssuerff 
=ff 
trueff !
,ff! "
ValidateAudiencegg 
=gg 
truegg #
,gg# $
ValidateLifetimehh 
=hh 
truehh #
,hh# $$
ValidateIssuerSigningKeyii $
=ii% &
trueii' +
,ii+ ,
ValidIssuerjj 
=jj 
builderjj !
.jj! "
Configurationjj" /
[jj/ 0
$strjj0 <
]jj< =
,jj= >
ValidAudiencekk 
=kk 
builderkk #
.kk# $
Configurationkk$ 1
[kk1 2
$strkk2 @
]kk@ A
,kkA B
IssuerSigningKeyll 
=ll 
newll " 
SymmetricSecurityKeyll# 7
(ll7 8
Encodingll8 @
.ll@ A
UTF8llA E
.llE F
GetBytesllF N
(llN O
builderllO V
.llV W
ConfigurationllW d
[lld e
$strlle n
]lln o
)llo p
)llp q
}mm 	
;mm	 

}nn 
)nn 
;nn 
builderpp 
.qq 
Servicesqq 
.rr 
AddAuthorizationrr 
(rr 
optionsrr 
=>rr  
{ss 
optionsuu 
.uu 
DefaultPolicyuu 
=uu 
newuu  #&
AuthorizationPolicyBuilderuu$ >
(uu> ?
)uu? @
.vv $
RequireAuthenticatedUservv %
(vv% &
)vv& '
.ww 
Buildww 
(ww 
)ww 
;ww 
}xx 
)xx 
.yy 
AddAuthenticationyy 
(yy -
!CertificateAuthenticationDefaultsyy 8
.yy8 9 
AuthenticationSchemeyy9 M
)yyM N
.zz 
AddCertificatezz 
(zz 
optionszz 
=>zz 
{{{ 
options}} 
.}} 
RevocationMode}} 
=}}  
X509RevocationMode}}! 3
.}}3 4
NoCheck}}4 ;
;}}; <
options 
. "
ValidateValidityPeriod &
=' (
true) -
;- .
options
ÅÅ 
.
ÅÅ %
AllowedCertificateTypes
ÅÅ '
=
ÅÅ( )
CertificateTypes
ÅÅ* :
.
ÅÅ: ;
Chained
ÅÅ; B
;
ÅÅB C
options
ÉÉ 
.
ÉÉ &
ChainTrustValidationMode
ÉÉ (
=
ÉÉ) * 
X509ChainTrustMode
ÉÉ+ =
.
ÉÉ= >
CustomRootTrust
ÉÉ> M
;
ÉÉM N
var
ÖÖ 
rootcert
ÖÖ 
=
ÖÖ 
new
ÖÖ 
X509Certificate2
ÖÖ +
(
ÖÖ+ ,
$str
ÖÖ, D
)
ÖÖD E
;
ÖÖE F
options
ÜÜ 
.
ÜÜ 
CustomTrustStore
ÜÜ  
.
ÜÜ  !
Clear
ÜÜ! &
(
ÜÜ& '
)
ÜÜ' (
;
ÜÜ( )
options
áá 
.
áá 
CustomTrustStore
áá  
.
áá  !
Add
áá! $
(
áá$ %
rootcert
áá% -
)
áá- .
;
áá. /
}
àà 
)
àà 
;
àà 
builderãã 
.
ãã 
Services
ãã 
.
ãã 
AddCors
ãã 
(
ãã 
options
ãã  
=>
ãã! #
{
åå 
options
çç 
.
çç 
	AddPolicy
çç 
(
çç 
$str
çç '
,
çç' (
builder
çç) 0
=>
çç1 3
{
éé 
builder
èè 
.
èè 
AllowAnyOrigin
èè "
(
èè" #
)
èè# $
.
êê 
AllowAnyHeader
êê 
(
êê 
)
êê 
.
ëë 
AllowAnyMethod
ëë 
(
ëë 
)
ëë 
;
ëë 
}
íí 	
)
íí	 

;
íí
 
}
ìì 
)
ìì 
;
ìì 
varññ 
app
ññ 
=
ññ 	
builder
ññ
 
.
ññ 
Build
ññ 
(
ññ 
)
ññ 
;
ññ 
usingôô 
(
ôô 
var
ôô 

scope
ôô 
=
ôô 
app
ôô 
.
ôô 
Services
ôô 
.
ôô  
CreateScope
ôô  +
(
ôô+ ,
)
ôô, -
)
ôô- .
{öö 
var
õõ 
services
õõ 
=
õõ 
scope
õõ 
.
õõ 
ServiceProvider
õõ (
;
õõ( )
var
ùù 
context
ùù 
=
ùù 
services
ùù 
.
ùù  
GetRequiredService
ùù -
<
ùù- .
LensDbContext
ùù. ;
>
ùù; <
(
ùù< =
)
ùù= >
;
ùù> ?
context
ûû 
.
ûû 
Database
ûû 
.
ûû 
Migrate
ûû 
(
ûû 
)
ûû 
;
ûû 
}üü 
app¢¢ 
.
¢¢ 
UseCors
¢¢ 
(
¢¢ 
$str
¢¢ 
)
¢¢ 
;
¢¢ 
if•• 
(
•• 
app
•• 
.
•• 
Environment
•• 
.
•• 
IsDevelopment
•• !
(
••! "
)
••" #
)
••# $
{¶¶ 
app
ßß 
.
ßß 

UseSwagger
ßß 
(
ßß 
)
ßß 
;
ßß 
app
®® 
.
®® 
UseSwaggerUI
®® 
(
®® 
)
®® 
;
®® 
}©© 
app´´ 
.
´´ !
UseHttpsRedirection
´´ 
(
´´ 
)
´´ 
;
´´ 
appÆÆ 
.
ÆÆ 
UseAuthentication
ÆÆ 
(
ÆÆ 
)
ÆÆ 
;
ÆÆ 
appØØ 
.
ØØ 
UseAuthorization
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
app±± 
.
±± 
MapControllers
±± 
(
±± 
)
±± 
;
±± 
app≥≥ 
.
≥≥ 
Run
≥≥ 
(
≥≥ 
)
≥≥ 	
;
≥≥	 
