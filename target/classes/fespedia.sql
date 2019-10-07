DROP SEQUENCE REPLY_SEQ;
DROP SEQUENCE MAINBOARD_SEQ;
DROP SEQUENCE WISHLIST_SEQ;
DROP SEQUENCE ADMIN_MAINBOARD_SEQ;
DROP SEQUENCE BUL_BOARDNUM_SEQ;

DROP TABLE ADMIN_MAINBOARD;
DROP TABLE ADMIN_BUL_BOARD;
DROP TABLE SEARCHFESTIVAL;
DROP TABLE WISHLIST;
DROP TABLE REPLY;
DROP TABLE BUL_BOARD;
DROP TABLE MAINBOARD;
DROP TABLE MEMBER;
DROP TABLE ADMINMEMBER;
DROP TABLE countryname;

CREATE SEQUENCE REPLY_SEQ;
CREATE SEQUENCE MAINBOARD_SEQ;
CREATE SEQUENCE WISHLIST_SEQ;
CREATE SEQUENCE ADMIN_MAINBOARD_SEQ;
CREATE SEQUENCE BUL_BOARDNUM_SEQ;

CREATE TABLE ADMINMEMBER (
    ADMINID VARCHAR2(20) PRIMARY KEY,
    ADMINPWD VARCHAR2(20),  
    EMAIL VARCHAR2(20)                  
);

insert into ADMINMEMBER 
    values('aa','aa','aaa@naver.com');

CREATE TABLE MEMBER(
   ADMINID VARCHAR2(20) CONSTRAINT MEMBER_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
   userid      VARCHAR2(20)   NOT NULL PRIMARY KEY,      --USERID
   userpwd       VARCHAR2(20)   NOT NULL,                  --USERPWD
   email       VARCHAR2(50)    NOT NULL,
    originalfilename VARCHAR2(1000),
    savedfilename VARCHAR2(200)
);

insert into MEMBER(adminid, userid, userpwd, email) 
    values('aa','aa','aa','aaa@naver.com');  

CREATE TABLE MAINBOARD(
    ADMINID VARCHAR2(20) CONSTRAINT MAINBOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,      
    TITLE VARCHAR2(1000) not null,  
    COUNTRY VARCHAR2(50),  
    ADRESS VARCHAR2(100),       
    FESTIVAL_INTRO VARCHAR2(2000),  
    SURROUND_PLACE VARCHAR2(200),  
    INPUTTIME DATE DEFAULT SYSDATE,  
    STARTEVENT DATE DEFAULT SYSDATE,   
    ENDEVENT DATE DEFAULT SYSDATE,         
    originalFileName VARCHAR(1000),     
    SAVEFILENAME VARCHAR(200),        
    HASHTAG VARCHAR2(1000) DEFAULT '#祭り,',
    CHECKSEARCH NUMBER DEFAULT 0
);

CREATE TABLE BUL_BOARD(
     ADMINID VARCHAR2(20) CONSTRAINT BULLETIN_BOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
      USERID VARCHAR2(20)   CONSTRAINT  BUL_BOARD_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    
     BUL_BOARDNUM  NUMBER PRIMARY KEY,               
     TITLE VARCHAR2(20) NOT NULL,                       
     HIT NUMBER DEFAULT 0,                                     
     CONTENTS VARCHAR2(2000),
      COUNTRY VARCHAR2(50),
     SURROUND_PLACE VARCHAR2(200),
      ADRESS VARCHAR2(100), 
     ORIGINALFILENAME   VARCHAR2(1000),                     
    savedfilename   VARCHAR2(200),                          
    INPUTDATE      DATE  DEFAULT SYSDATE               
);

CREATE TABLE REPLY(
    ADMINID VARCHAR2(20) CONSTRAINT REPLY_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    replynum   NUMBER         PRIMARY KEY,    
   MAINBOARDNUM   NUMBER    CONSTRAINT REPLY_BOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE, --?? ?? ??? ??
   BUL_BOARDNUM   NUMBER      CONSTRAINT REPLY_BUL_BOARDNUM_FK REFERENCES BUL_BOARD(BUL_BOARDNUM) ON DELETE CASCADE,
   USERID      VARCHAR2(20)   NOT NULL CONSTRAINT REPLY_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,    --?????  
   REPLYTEXT   VARCHAR2(1000)   NOT NULL,   
    ORIGINALFILENAME VARCHAR(1000),   
    SAVEFILENAME VARCHAR(200),       
   INPUTDATE      DATE  DEFAULT SYSDATE   
);

CREATE TABLE WISHLIST(
    ADMINID VARCHAR2(20) CONSTRAINT WISHLIST_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    WISHLIST_NUM NUMBER NOT NULL PRIMARY KEY,   
    MAINBOARDNUM NUMBER NOT NULL  CONSTRAINT WISHLIST_MAINBOARDNUM_FK REFERENCES MAINBOARD(MAINBOARDNUM) ON DELETE CASCADE,
    USERID VARCHAR2(20)   CONSTRAINT  WISHLIST_USERID_FK REFERENCES MEMBER(userid) ON DELETE CASCADE,
    inputtime DATE DEFAULT SYSDATE             
);

CREATE TABLE SEARCHFESTIVAL(
    IMAGE VARCHAR2(200),
    FESTIVALNAME VARCHAR2(100)
);

CREATE TABLE ADMIN_MAINBOARD(
    ADMINID VARCHAR2(20) CONSTRAINT ADMIN_MAINBOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
    ADMIN_MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,      
    MAINBOARDNUM NUMBER NOT NULL,       
    TITLE VARCHAR2(1000) not null,  
    COUNTRY VARCHAR2(20) NOT NULL,
    ADRESS VARCHAR2(100),     
    FESTIVAL_INTRO VARCHAR2(2000),  
    SURROUND_PLACE VARCHAR2(1000),  
    INPUTTIME DATE DEFAULT SYSDATE,  
    STARTEVENT DATE DEFAULT SYSDATE,   
    ENDEVENT DATE DEFAULT SYSDATE,     
    originalFileName VARCHAR(1000),     
    SAVEFILENAME VARCHAR(200),        
    HASHTAG VARCHAR2(1000) DEFAULT '#祭り,',
    DATACHECK VARCHAR2(100) NOT NULL         
);

CREATE TABLE ADMIN_BUL_BOARD(
     ADMINID VARCHAR2(20) CONSTRAINT ADMIN_BUL_BOARD_ADMINID_FK REFERENCES ADMINMEMBER(ADMINID) ON DELETE CASCADE,
     ADMIN_MAINBOARDNUM NUMBER NOT NULL PRIMARY KEY,       
     USERID VARCHAR2(20) NOT NULL,   
      BUL_BOARDNUM NUMBER NOT NULL,  
     TITLE VARCHAR2(20) NOT NULL, 
     CONTENTS VARCHAR2(2000),
      COUNTRY VARCHAR2(50),  
    ADRESS VARCHAR2(100),      
    INPUTDATE      DATE  DEFAULT SYSDATE,                    
    HIT NUMBER DEFAULT 0,                                            
    ORIGINALFILENAME   VARCHAR2(1000),                     
    SAVEDFILENAME   VARCHAR2(200),                       
    DATACHECK VARCHAR2(100) NOT NULL                      
);


create table countryname (
    countrycode varchar2(50),
    countryEng varchar2(200),
    countryJP varchar2(200),
    countryKR varchar2(200)
);


Insert into countryname values('BD', 'Bangladesh', 'バングラデシュ', '방글라데시');
Insert into countryname values( 'BE', 'Belgium', 'ベルギー', '벨기에' );
Insert into countryname values('BF', 'Burkina Faso', 'ブルキナファソ', ' 부르키나파소');
Insert into countryname values( 'BG' , 'Bulgaria', 'ブルガリア', '불가리아' );
Insert into countryname values( 'BA' , 'Bosnia and Herzegovina','ボスニア・ヘルツェゴビナ','보스니아 헤르체코비나' );
Insert into countryname values( 'BN' , 'Brunei', 'ブルネイ', '브루나이' );
Insert into countryname values( 'BO' , 'Bolivia', 'ボリビア', '볼리비아' );
Insert into countryname values( 'JP', 'Japan', '日本', '일본' );
Insert into countryname values( 'BI' , 'Burundi', 'ブルンジ', '부룬디' );
Insert into countryname values( 'BJ' , 'Benin', 'ベナン', '베냉' );
Insert into countryname values( 'BT' , 'Bhutan', 'ブタン', '부탄' );
Insert into countryname values( 'JM' , 'Jamaica', 'ジャマイカ', '자메이카' );
Insert into countryname values( 'BW' , 'Botswana', 'ボツワナ', '보츠와나' );
Insert into countryname values( 'BR' , 'Brazil', 'ブラジル', '브라질' );
Insert into countryname values( 'BS' , 'The Bahamas', 'バハマ', '바하마' );
Insert into countryname values( 'BY' , 'Belarus', 'ベラルーシ', '벨라루스' );
Insert into countryname values( 'BZ' , 'Belize', 'ベリーズ', '벨리즈' );
Insert into countryname values( 'RU' , 'Russia', 'ロシア', '러시아' );
Insert into countryname values( 'RW' , 'Rwanda', 'ルワンダ', '르완다' );
Insert into countryname values( 'RS' , 'Republic of Serbia', 'セルビア', '세르비아' );
Insert into countryname values( 'LT' , 'Lithuania', 'リトアニア', '리투아니아' );
Insert into countryname values( 'LU' , 'Luxembourg', 'ルクセンブルク', '룩셈부르크' );
Insert into countryname values( 'LR' , 'Liberia', 'リベリア', '라이베리아' );
Insert into countryname values( 'RO' , 'Romania', 'ルーマニア', '루마니아' );
Insert into countryname values( 'GW' , 'Guinea Bissau', 'ギニアビサウ', '기니비사우' );
Insert into countryname values( 'GT' , 'Guatemala', 'グアテマラ', '과테말라' );
Insert into countryname values( 'GR' , 'Greece', 'ギリシア', '그리스' );
Insert into countryname values( 'GQ' , 'Equatorial Guinea', '赤道ギニア', '적도기니' );
Insert into countryname values( 'GY' , 'Guyana', 'ガイアナ ', '가이아나' );
Insert into countryname values( 'GE' , 'Georgia', 'ジョージア', '조지아' );
Insert into countryname values( 'GB' , 'United Kingdom', 'イギリス', '영국' );
Insert into countryname values( 'GA' , 'Gabon', 'ガボン', '가봉' );
Insert into countryname values( 'GN' , 'Guinea', 'ギニア', '기니' );
Insert into countryname values( 'GM' , 'Gambia', 'ガンビア', '감비아' );
Insert into countryname values( 'GL' , 'Greenland', 'グリーンランド', '그린란드' );
Insert into countryname values( 'KW' , 'Kuwait', 'クウェート', '쿠웨이트' );
Insert into countryname values( 'GH' , 'Ghana', 'ガーナ', '가나' );
Insert into countryname values( 'OM' , 'Oman', 'オマーン', '오만' );
Insert into countryname values( '_3' , 'Somaliland', 'ソマリランド', '소말릴란드' );
Insert into countryname values( '_2' , 'Western Sahara', '西サハラ', '서사하라' );
Insert into countryname values( '_1' , 'Kosovo', 'コソボ ', '코소보' );
Insert into countryname values( '_0' , 'Northern Cyprus', '北キプロス・トルコ共和国', '북키프로스' );
Insert into countryname values( 'JO' , 'Jordan', 'ヨルダン', '요르단' );
Insert into countryname values( 'HR' , 'Croatia', 'クロアチア', '크로아티아' );
Insert into countryname values( 'HT' , 'Haiti', 'ハイチ', '아이티' );
Insert into countryname values( 'HU' , 'Hungary', 'ハンガリー', '헝가리' );
Insert into countryname values( 'HN' , 'Honduras', 'ホンジュラス', '온두라스' );
Insert into countryname values( 'PR' , 'Puerto Rico', 'プエルトリコ', ' 푸에르토리코 공화국' );
Insert into countryname values( 'PS' , 'West Bank', 'ヨルダン川西岸地区', '요르단강 서안지구' );
Insert into countryname values( 'PT' , 'Portugal', 'ポルトガル', '포르투갈' );
Insert into countryname values( 'PY' , 'Paraguay', 'パラグアイ', '파라과이' );
Insert into countryname values( 'PA' , 'Panama', 'パナマ', '파나마' );
Insert into countryname values( 'PG' , 'Papua New Guinea', 'パプアニューギニア', '파푸아뉴기니' );
Insert into countryname values( 'PE' , 'Peru', 'ペルー', '페루' );
Insert into countryname values( 'PK' , 'Pakistan', 'パキスタン', '파키스탄' );
Insert into countryname values( 'PH' , 'Philippines', 'フィリピン', '필리핀' );
Insert into countryname values( 'PL' , 'Poland', 'ポーランド', '폴란드' );
Insert into countryname values( 'ZM' , 'Zambia', 'ザンビア', '잠비아' );
Insert into countryname values( 'EE' , 'Estonia', 'エストニア', '에스토니아' );
Insert into countryname values( 'EG' , 'Egypt', 'エジプト', '이집트' );
Insert into countryname values( 'ZA' , 'South Africa', '南アフリカ共和国', '남아프리카공화국' );
Insert into countryname values( 'EC' , 'Ecuador', 'エジプト', '에콰도르' );
Insert into countryname values( 'AL' , 'Albania', 'アルバニア', '알바니아' );
Insert into countryname values( 'AO' , 'Angola', 'アンゴラ', '앙골라' );
Insert into countryname values( 'KZ' , 'Kazakhstan', 'カザフスタン', '카자흐스탄' );
Insert into countryname values( 'ET' , 'Ethiopia', 'エチオピア', '에티오피아' );
Insert into countryname values( 'ZW' , 'Zimbabwe', 'ジンバブウェ', '짐바브웨' );
Insert into countryname values( 'ES' , 'Spain', 'スペイン', '스페인' );
Insert into countryname values( 'ER' , 'Eritrea', 'エリトリア', '에리트레아' );
Insert into countryname values( 'ME' , 'Montenegro', 'モンテネグロ', '몬테네그로' );
Insert into countryname values( 'MD' , 'Moldova', 'モルドバ', '몰도바' );
Insert into countryname values( 'MG' , 'Madagascar', 'マダガスカル', '마다가스카르' );
Insert into countryname values( 'MA' , 'Morocco', 'モロッコ', '모로코' );
Insert into countryname values( 'UZ' , 'Uzbekistan', 'ウズベキスタン', '우즈베키스탄' );
Insert into countryname values( 'MM' , 'Myanmar', 'ミャンマー', '미얀마' );
Insert into countryname values( 'ML' , 'Mali', 'マリ', '말리' );
Insert into countryname values( 'MN' , 'Mongolia', 'モンゴル', '몽골' );
Insert into countryname values( 'MK' , 'Macedonia', 'マケドニア', '마케도니아' );
Insert into countryname values( 'MW' , 'Malawi', 'マラウィ', '말라위' );
Insert into countryname values( 'MR' , 'Mauritania', 'モーリタニア', '모리타니아' );
Insert into countryname values( 'UG' , 'Uganda', 'ウガンダ', '우간다' );
Insert into countryname values( 'MY' , 'Malaysia', 'マレーシア', '말레이시아' );
Insert into countryname values( 'MX' , 'Mexico', 'メキシコ', '멕시코' );
Insert into countryname values( 'VU' , 'Vanuatu', 'バヌアツ', '바누아투' );
Insert into countryname values( 'FR' , 'France', 'フランス', '프랑스' );
Insert into countryname values( 'FI' , 'Finland', 'フィンランド', '핀란드' );
Insert into countryname values( 'FJ' , 'Fiji', 'フィジー', '피지' );
Insert into countryname values( 'FK' , 'Falkland Islands', 'フォークランド諸島', '포클랜드 제도' );
Insert into countryname values( 'NI' , 'Nicaragua', 'ニカラグア', '니카라과' );
Insert into countryname values( 'NL' , 'Netherlands', 'オランダ', '네덜란드' );
Insert into countryname values( 'NO' , 'Norway', 'ノルウェー', '노르웨이' );
Insert into countryname values( 'NA' , 'Namibia', 'ナミビア', '나미비아' );
Insert into countryname values( 'NC' , 'New Caledonia', 'ニューカレドニア', '뉴칼레도니아' );
Insert into countryname values( 'NE' , 'Niger', 'ニジェール', '니제르' );
Insert into countryname values( 'NG' , 'Nigeria', 'ナイジェリア', '나이지리아' );
Insert into countryname values( 'NZ' , 'New Zealand', 'ニュージーランド', '뉴질랜드' );
Insert into countryname values( 'NP' , 'Nepal', 'ネパール', '네팔' );
Insert into countryname values( 'CI' , 'Ivory Coast', 'コートジボワール', ' 코트디부아르' );
Insert into countryname values( 'CH' , 'Switzerland', 'スイス', '스위스' );
Insert into countryname values( 'CO' , 'Colombia', 'コロンビア', '콜롬비아' );
Insert into countryname values( 'CN' , 'China', '中国', '중국' );
Insert into countryname values( 'CM' , 'Cameroon', 'カメルーン', '카메룬' );
Insert into countryname values( 'CL' , 'Chile', 'チリ', '칠레' );
Insert into countryname values( 'CA' , 'Canada', 'カナダ', '캐나다' );
Insert into countryname values( 'CG' , 'Republic of the Congo', 'コンゴ', '콩고' );
Insert into countryname values( 'CF' , 'Central African Republic', '中央アフリカ共和国', '중앙 아프리카 공화국' );
Insert into countryname values( 'CD' , 'Democratic Republic of the Congo', 'コンゴ民主共和国', '콩고민주공화국' );
Insert into countryname values( 'CZ' , 'Czech Republic', 'チェコ', '체코' );
Insert into countryname values( 'CY' , 'Cyprus', 'キプロス', '키프로스' );
Insert into countryname values( 'CR' , 'Costa Rica', 'コスタリカ', '코스타리카' );
Insert into countryname values( 'CU' , 'Cuba', 'キューバ', '쿠바' );
Insert into countryname values( 'SZ' , 'Swaziland', 'スワジランド', '스와질란드' );
Insert into countryname values( 'SY' , 'Syria', 'シリア', '시리아' );
Insert into countryname values( 'KG' , 'Kyrgyzstan', 'キルギスタン', '키르기스스탄' );
Insert into countryname values( 'KE' , 'Kenya', 'ケニア', '케냐' );
Insert into countryname values( 'SS' , 'South Sudan', '南スーダン', '남수단' );
Insert into countryname values( 'SR' , 'Suriname', 'スリナム', '수리남' );
Insert into countryname values( 'KH' , 'Cambodia', 'カンボジア', '캄보디아' );
Insert into countryname values( 'SV' , 'El Salvador', 'エルサルバドル', '엘살바도르' );
Insert into countryname values( 'SK' , 'Slovakia', 'スロバキア', '슬로바키아' );
Insert into countryname values( 'KR' , 'South Korea', '大韓民国', '대한민국' );
Insert into countryname values( 'SI' , 'Slovenia', 'スロベニア', '슬로베니아' );
Insert into countryname values( 'KP' , 'North Korea', ' 北朝鮮', '북한' );
Insert into countryname values( 'SO' , 'Somalia', 'ソマリア', '소말리아' );
Insert into countryname values( 'SN' , 'Senegal', 'セネガル', '세네갈' );
Insert into countryname values( 'SL' , 'Sierra Leone', 'シエラレオネ', '시에라리온' );
Insert into countryname values( 'SB' , 'Solomon Islands', ' ソロモン諸島', '솔로몬 제도' );
Insert into countryname values( 'SA' , 'Saudi Arabia', 'サウジアラビア', '사우디 아라비아' );
Insert into countryname values( 'SE' , 'Sweden', 'スウェーデン', '스웨덴' );
Insert into countryname values( 'SD' , 'Sudan', 'スーダン', '수단' );
Insert into countryname values( 'DO' , 'Dominican Republic', 'ドミニカ共和国 ', '도미니카 공화국' );
Insert into countryname values( 'DJ' , 'Djibouti', 'ジブチ', '지부티' );
Insert into countryname values( 'DK' , 'Denmark', 'デンマーク', '덴마크' );
Insert into countryname values( 'DE' , 'Germany', 'ドイツ', '독일' );
Insert into countryname values( 'YE' , 'Yemen', 'イエメン', '예멘' );
Insert into countryname values( 'AT' , 'Austria', 'オーストリア', '오스트리아' );
Insert into countryname values( 'DZ' , 'Algeria', 'アルジェリア', '알제리' );
Insert into countryname values( 'US' , 'United States of America', 'アメリカ', '미국' );
Insert into countryname values( 'LV' , 'Latvia', 'ラトビア', '라트비아' );
Insert into countryname values( 'UY' , 'Uruguay', 'ウルグァイ', '우루과이' );
Insert into countryname values( 'LB' , 'Lebanon', 'レバノン', '레바논' );
Insert into countryname values( 'LA' , 'Laos', 'ラオス', '라오스' );
Insert into countryname values( 'TW' , 'Taiwan', '台湾', '타이완' );
Insert into countryname values( 'TT' , 'Trinidad and Tobago', 'トリニダードトバゴ', '트리니다드 토바고' );
Insert into countryname values( 'TR' , 'Turkey', 'トルコ', '터키' );
Insert into countryname values( 'LK' , 'Sri Lanka', 'スリランカ', '스리랑카' );
Insert into countryname values( 'TN' , 'Tunisia', 'チュニジア', '튀니지' );
Insert into countryname values( 'TL' , 'East Timor', '東ティモール', '동티모르' );
Insert into countryname values( 'TM' , 'Turkmenistan', 'トルクメニスタン', '투르크메니스탄' );
Insert into countryname values( 'TJ' , 'Tajikistan', 'タジキスタン', '타지키스탄' );
Insert into countryname values( 'LS' , 'Lesotho', 'レソト', '레소토' );
Insert into countryname values( 'TH' , 'Thailand', 'タイ', '태국' );
Insert into countryname values( 'TF' , 'French Southern and Antarctic Lands', '', '프랑스령 남방 남극지방' );
Insert into countryname values( 'TG' , 'Togo', 'トーゴ', '토고' );
Insert into countryname values( 'TD' , 'Chad', 'チャド', '차드' );
Insert into countryname values( 'LY' , 'Libya', 'リビア', '리비아' );
Insert into countryname values( 'AE' , 'United Arab Emirates', 'UAE', '아랍에미리트연합' );
Insert into countryname values( 'VE' , 'Venezuela', 'ベネズエラ', '베네수엘라' );
Insert into countryname values( 'AF' , 'Afghanistan', 'アフガニスタン', '아프가니스탄' );
Insert into countryname values( 'IQ' , 'Iraq', 'イラク', '이라크' );
Insert into countryname values( 'IS' , 'Iceland', 'アイスランド', '아이슬란드' );
Insert into countryname values( 'IR' , 'Iran', 'イラン', '이란' );
Insert into countryname values( 'AM' , 'Armenia', 'アルメニア', '아르메니아' );
Insert into countryname values( 'IT' , 'Italy', 'イタリア', '이탈리아' );
Insert into countryname values( 'VN' , 'Vietnam', 'ベトナム', '베트남' );
Insert into countryname values( 'AR' , 'Argentina', 'アルゼンチン', '아르헨티나' );
Insert into countryname values( 'AU' , 'Australia', 'オーストラリア', '호주' );
Insert into countryname values( 'IL' , 'Israel', 'イスラエル', '이스라엘' );
Insert into countryname values( 'IN' , 'India', 'インド', '인도' );
Insert into countryname values( 'TZ' , 'Tanzania', 'タンザニア', '탄자니아' );
Insert into countryname values( 'AZ' , 'Azerbaijan', 'アゼルバイジャン', '아제르바이잔' );
Insert into countryname values( 'IE' , 'Ireland', 'アイルランド', '아일랜드' );
Insert into countryname values( 'ID' , 'Indonesia', 'インドネシア', '인도네시아' );
Insert into countryname values( 'UA' , 'Ukraine', 'ウクライナ', '우크라이나' );
Insert into countryname values( 'QA' , 'Qatar', 'カタル', '카타르' );
Insert into countryname values( 'MZ' , 'Mozambique', 'モザンビーク', '모잠비크' );


INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/fall.jpg', '#秋');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/winter.jpeg', '#冬');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/rock.jpg', '#ロックフェスティバル');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/matsuri.jpg', '#和風祭り');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/beer.jpg', '#ビール');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/culturalFestival.jpg', '#文化祭');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/sea.jpg', '#海');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/spring.jpg', '#春');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/mountain.jpg', '#山');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/sports.jpg', '#スポーツ');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/america.jpg', '#アメリカ');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/asia.jpg', '#アジア');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/africa.jpg', '#アフリカ');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/expo.jpg', '#博覧会');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/summer.jpg', '#夏');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/movie.jpg', '#映画祭');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/oceania.jpg', '#オセアニア');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/wine.jpg', '#ワイン');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/europe.jpg', '#ヨーロッパ');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/food.jpg', '#飲食');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/music.jpg', '#音楽');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/jazz.jpg', '#ジャズ');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/religion.jpg', '#宗教');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/carnival.jpg', '#カーニバル');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/costume.jpg', '#コスチューム');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/christmas.jpg', '#クリスマス');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/specialproduct.jpg', '#特産物');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/halloween.jpg', '#ハロウィン');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/hiphop.jpg', '#ヒップホップ');　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　

SET DEFINE OFF;

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'モンゴルのナダム(naadam)祭り', 'モンゴル', 'モンゴル全地域', '本来のナダムは宗教的意味と軍事訓練の意味が強かったが、今日は全国的な祝祭行事を通じて国民の結束という政治的意味に変化。', 'モンゴル全地域' ,SYSDATE, '2020-07-11', '2020-07-13','https://dbscthumb-phinf.pstatic.net/2361_000_1/20190722220651199_6U4HINFBG.png/gb40_80_i1.png?type=h345_fst_n&wm=Y, https://dbscthumb-phinf.pstatic.net/2361_000_1/20190723200746685_VHTQ4YFH5.png/gb40_80_i2.png?type=h345_fst_n&wm=Y,','#伝統,#スポーツ,#アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'プケットのベジタリアンフェスティバル', 'タイ' , 'プケット', 'タイでソンクレラン祭り(Songkran Festival)の次に規模の大きい祭りだ。 雨期が終わって建機が始まる時期、タイ暦の上では12月15日、望の日、グレゴリオ暦では10月末から11月の間に開催する。'　, 'プケット'　,sysdate, '2019-10-19', '2019-10-26',　'https://i2.wp.com/www.phuketvegetarian.com/wp-content/uploads/2018/09/phuketvegetarian-05.jpg?resize=360%2C240&ssl=1,https://i0.wp.com/www.phuketvegetarian.com/wp-content/uploads/2018/09/phuketvegetarian-08.jpg?resize=360%2C240&ssl=1,',　'#飲食, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ライクラトン' , 'タイ' , 'タイ全地域の川' , '川に蓮華のつぼみ模様の灯りを浮かべながら願い事をする儀式だ。 タイ全域で祝祭が開かれ、地域ごとに特色を生かした様々なイベントが用意されている。',　 'タイ全地域 ' ,sysdate , '2019-11-01' , '2019-11-30' ,  'https://post-phinf.pstatic.net/MjAxNzEwMTZfMjY4/MDAxNTA4MTMzMDk4MjM3.oIgUU8UCeZNO4-q2ER9s87EKqQthU6TopPGQhH6RsCMg.elANEO-frdYgI5Q5aVLkKQY4dV7dx-yEIobxAcJHr0wg.PNG/1.PNG?type=w1200,https://post-phinf.pstatic.net/MjAxODEwMzBfMSAg/MDAxNTQwODg2Njg0NDYz.YnpY7O51aPnp49bfRMXuQDy5gVbHccUD4EQ6DOFj17Ig._dCsimD0VRvFCXdr45hwOcMuYbyRcuEZUtwqE2Pytacg.JPEG/image_5792024481540886240165.jpg?type=w1200,' , '#伝統, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '松葉祭り' , 'タイ' , 'タイ全地域' ,'タイの伝統的なカレンダーで元旦4月13日(ソンクラーン)から4月15日まで3日間開かれる。' ,　 'タイ全地域 ' , sysdate , '2019-04-13' , '2019-04-15' ,  'https://post-phinf.pstatic.net/MjAxOTA0MjNfMTU5/MDAxNTU2MDA3MjM0OTM0.xu9yhNaADyLk-zIkqNDuHTh8_XRs3YiuNoO3Iixm70Yg.zjevZoG06e0GiOogOOSdU3ZuZvzHL3by_ZqfETjgFG4g.JPEG/GettyImages-998852692.jpg?type=w1200,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140407195236432_8C0OPIA90.jpg/fb40_16_i6.jpg?type=w575_fst&wm=N,' , '#伝統, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ハルビン国際氷雪祭' , '中国' , '中国黒竜江省ハルビン。' , 'ハルビン国際氷雪祭は毎年1月5日から2月末まで中国最北端黒竜江省ハルビン市の市で開催される世界的な規模の冬祭りだ。', 'ハルビン', sysdate , '2020-01-05' , '2020-02-29' ,  'https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162430255_7UXM6QDBT.jpg/fb40_91_i2.jpg?type=w575_fst&wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162431983_FN57CU2DF.jpg/fb40_91_i3.jpg?type=w575_fst&wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162432758_KV6EMH54C.jpg/fb40_91_i4.jpg?type=w406_fst&wm=N,' , '#カーニバル, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'チャイナジョイ' , '中国' , '中国上海新国際博覧センター ' , 'チャイナジョイ(ChinaJoy)は、中国上海の大規模展示場である上海新国際博覧会で毎年開かれるゲーム展示会(ゲームショー)をいう。' ,'上海', sysdate , ' 2019-08-02' , '2019-08-05' , 'https://dbscthumb-phinf.pstatic.net/2868_000_1/20140107163243008_JUT7SM8NL.jpg/ff13_1_6_i1.jpg?type=w492_fst&wm=N,' , '#アジア, #ゲーム,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '上海モーターショー' , '中国' , '中国上海新国際博覧会センター' , '1985年から開始した上海モーターショーは、浦東近くで2年ごとに開催される。 北京モーターショーとともに中国の二大モーターショーだ。' , '上海' ,  sysdate , '2019-04-18' , '2019-04-25' , 'https://joonnoh.files.wordpress.com/2019/04/image-2.png,' , '#アジア,#モーターショー,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ラマダン' , 'サウジアラビア' , 'サウジアラビア以外のイスラム国家' , 'アラビア語で「暑い月」を意味する。 天使ガブリエル(Gabriel)はムハンマドに《コーラン》を教えた神聖な月と考えて、イスラム教徒はこの期間、日の出から日没まで義務的に断食して、毎日5回の祈祷を捧げる。 旅行者、病人、妊婦などは免除されるが、その代わりその後別に数日間断食しなければならない。' , 'リヤド' ,  sysdate , '2020-04-23' , '2020-05-23' , 'https://dbscthumb-phinf.pstatic.net/2765_000_34/20180930204502552_9FBXULHDY.jpg/281513.jpg?type=m250&wm=N,' , '#アジア,#宗教');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'さっぽろホワイトイルミネーション' , '日本' , '日本北海道札幌' , '日本で開かれる光の祭典で、毎年11月雪に覆われた札幌に色とりどりの美しい光や照明を加えた姿でホワイトイルミネーション(White illumination)と呼ぶ。 日本初の光の祭典で1981年に初めて開始され、札幌の名所大通公園を中心に札幌駅、駅前通り、ススキノ市内などで光点灯が行われる。 札幌市、札幌観光協会、札幌商工会議所が主催し、札幌ホワイトイルミネーション実行委員会が主管して開催される。' , '札幌' ,  sysdate , '2019-11-22' , '2020-03-15' , 'https://postfiles.pstatic.net/20150101_134/sooyong8721_1420113509044K6zkB_JPEG/20141212_161951_LLS.JPG?type=w2,https://postfiles.pstatic.net/20150101_116/sooyong8721_1420113510806luWSI_JPEG/IMG_2616.JPG?type=w2,' , '#アジア, #カーニバル,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '広崎桜祭り' , '日本' , '青森県広崎公園' , '春の"広崎桜祭り"と竹と木を利用して作った骨組みに紙をつけて作った武者人形や、鳥と動物を作ってその中に灯りを灯して車や自動車に乗せて街を行進する"東北地方"を代表する夏の"広崎ネプタ祭り"など、"広崎"には四季を通じて行われる行事も多彩だ。' , '広崎' ,  sysdate , ' 2019-04-23' , '2019-05-03' , 'https://post-phinf.pstatic.net/MjAxOTA0MDdfMTA4/MDAxNTU0NjIxNDYwMzU3.0wfCTCpUDI8xPLyM1fTgBhQxIahpUmKAoJVoCNW20Cog.WkeylbFP7e-CiIU7c-lL4S2YQS0TOIg_my-gI3L3r20g.JPEG/%EC%A4%91%EC%95%99%EC%9D%BC%EB%B3%B4.jpg?type=w1200,' , '#アジア, #桜,');
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '2020年ドバイ世界博覧会' , 'UAE' , 'UAE' , ' 2020年世界博覧会、公式名称2020年ドバイ世界博覧会(アラブ語:إكسبو٢٠٢٠)は2020年、アラブ首長国連邦のドバイで開かれる予定の世界博覧会である。' , 'ドバイ' ,  sysdate , '2020-10-20' , '2020-04-10' , ',' , '#アジア, #博覧会');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'シドニーフェスティバル' , 'オーストラリア' , 'オーストラリア' , 'シドニーのいたるところで100を超えるプログラムが進められ、現代芸術からクラシック音楽、ダンス、サーカス、演劇、視覚芸術、芸術作品展示など、様々なジャンルの芸術を含む。 世界各国で900人余りの芸術家たちが招待されて約330本余りの公演を繰り広げ、毎年50万人以上の観客がフェスティバルを訪れている。' , 'シドニー市' ,  sysdate , ' 2020-01-08' , '2020-01-26' , 'https://postfiles.pstatic.net/MjAxODAxMjZfMTIx/MDAxNTE2OTM1NjI0MjUw.NjMs5sguqhi-N7bxWoKF0mbg7tCDlYHwNyjaMIAlsRcg.vr-PSC2xqCueN_y6a-7Lzu0Z8o3eji46IrKtBnfT2Jkg.JPEG.kkdaykr/image.adapt.1663.medium.jpg?type=w966,https://postfiles.pstatic.net/MjAxODAxMjZfNjAg/MDAxNTE2OTM2MjM1MTc3.yIr8JeVTLEMpGCLZFSzAYfxfQ0ZZ3ISeWs2HMKxb9Qcg.0x_j6UPH2aYCid-dXGbU1P3FjcGorsV_jHb9pElcwWMg.JPEG.kkdaykr/14340564616_047e1d52ba_z.jpg?type=w966,' , '#アジア,#祭り,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'トゥモローランド(音楽祭)' , 'ベルギー' , 'Belgium　Boom' , 'トゥモローランド(Tomorrowland)はベルギーで開かれるエレクトロニックダンスミュージック音楽祭で、ID&Tが主管する。' , 'Boom' ,  sysdate , '2020-07-17' , '2020-07-26' , 'https://postfiles.pstatic.net/MjAxOTA0MjlfMjA5/MDAxNTU2NTQ1MDMwMjYx.37-XMt4AI71Po-5xLi76Qq3LrBHfQwcK9Z8Q-ze5OB8g.SNR4Xdr1J5n7YK6BcKC7dTLHZDxOeEY9o71ipb629U4g.JPEG.coldskysera/20180720_183202.jpg?type=w773,https://postfiles.pstatic.net/MjAxOTA0MjlfNzcg/MDAxNTU2NTQ0NzQzNzYx.MCiZ6nmKt9YP3I0Yi9Cjs5IZfz-rcU1dvCK9IifptXsg.pLRct5hcHPJ7izO4sjYNMfBrhn5GmRkrK4qwqCduChgg.JPEG.coldskysera/20180720_171911.jpg?type=w773,' , '#ヨーロッパ,#音楽祭,');


INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ベネチア カーニバル' , 'イタリア' , 'イタリア　ベネチア' , 'ベネチアのカーニバル(Carnevale di Venezia)は、毎年四旬節前日まで10日余りにわたって開かれる祭りで、同国最大の祭典であり、世界10大祭に属する。' , 'ベネチア' ,  sysdate , '2020-02-08' , '2020-02-25' , 'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140127154244637_X8YDRERZG.jpg/fb40_3_i13.jpg?type=w575_fst&wm=N,' , '#ヨーロッパ,#カーニバル,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ボローニャ児童図書展' , 'イタリア' , 'イタリア エミリアーマニア州ボローニャ' , '世界最大規模の児童文学博覧会の一つで、イタリア エミリアーマニア州ボローニャで毎年春に開催される。 1964年4月4日、ボローニャにある宮殿であるファラ条レエンゾ(Palazzo Re Enzo)で開催されたことを皮切りに、作家や挿絵家らが出版社とネットワークを形成してプロジェクトを開始することができる出会いの場であり、児童文学、挿絵やマルチメディアを含めた各種児童用コンテンツの著作権を取引する主要な場所となった。' , 'ボローニャ' ,  sysdate , '2020-03-30' , '2020-04-02' , 'https://postfiles.pstatic.net/20160526_115/hyunso1009_1464260204082Axcka_PNG/55555555555555555555555.png?type=w1,https://postfiles.pstatic.net/20160526_290/hyunso1009_1464260933902m3aWM_PNG/15.png?type=w1,' ,'#ヨーロッパ, #博覧会,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ニースカーニバル' , 'フランス' , 'ニース　マセナ' , 'ニースカーニバルは、フランス南部の地中海沿岸の中心都市ニース(Nice)で毎年四旬節(四旬節)の前日まで2週間にわたって開かれるカーニバルだ。 カーニバルは、全世界のカトリック諸国を中心に盛大に行われるキリスト教の祭典で、復活祭を基準に、フェスティバルのスタート日が毎年変わり、普通1月末から2月の間に始まり、四旬節前日(Mardi Gras、懺悔の火曜日)に終わる。' , 'ニース' ,  sysdate , '2020-02-15' , '2020-03-01' , 'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140310141203913_4ZBWAFP1O.jpg/fb40_11_i2.jpg?type=w575_fst&wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140310141203910_LPHAPE81E.jpg/fb40_11_i3.jpg?type=w575_fst&wm=N,','#ヨーロッパ,#カーニバル,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'アビニョンフェスティバル' , 'フランス' , 'アビニョン法王庁' , 'アビニョンはフランス南東部のボクリューズ州の州都だ。 人口10万人にもならないこの小さな都市が毎年夏になると、世界各国から集まった数十万人の人出で賑わっていた芸術祝祭の都市に変わる。 3週間開かれるアビニョンフェスティバルからだ。' , 'アビニョン' ,  sysdate , '2019-07-04' , '2019-07-23' , 'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140813160754453_R7QDJPI54.jpg/fb40_59_i1.jpg?type=w575_fst&wm=N,' , '#ヨーロッパ,#芸術,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'オポジット通り劇フェスティバル' , 'フランス' , 'バルドゥアズ　ガルジュレゴネス' , 'フランスの劇団五浦ジト(Oposito)が毎年5月頃開催するストリート芸術祭典で、劇団の名前を取ってチュクジェミョンを負った。 公式名称は「ここ、そして他の場所の出会い」を意味する「レハンガットル 디ディシー」にダイウェフだ。' , 'バルドゥアズ' ,  sysdate , '2019-05-18' , '2019-05-19' , 'https://dthumb-phinf.pstatic.net/?src=%22https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F2765_000_13%2F20180725185047171_RHZ47R6EK.jpg%2F9690161.jpg%3Ftype%3Dm4500_4500_fst%26wm%3DN%22&twidth=1024&theight=768&opts=17,' , '#ヨーロッパ,#公演,#パレード,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'バレンシア花火大会' , 'スペイン' , 'バレンシア州全域' , '約30年間、フランス・パリの外郭に位置した貧民地域ヌをセック(Noisy-le-Sec)で開催し、2017年からバルドゥアジュ(Val-dOise)地方のガル主レゴネス(Garges-lès-Gonesse)で開催する。 毎年万人以上が訪れている。' , 'バレンシア' ,  sysdate , '2020-02-24' , '2020-03-19' , 'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140217152844483_Z3E08IE9S.jpg/fb40_8_i1.jpg?type=w575_fst&wm=N,' , '#ヨーロッパ,#花火,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'オクトーバーペスト' , 'ドイツ' ,  'ドイツ ミュンヘン'　,'オクトーバーフェスト(Oktoberfest)はドイツ南部のバイエルン(Bayern)州の州都ミュンヘン(Mrennchen)で開催される、世界で最も規模の大きい民俗祭りであり、ビール祭りである。'  , 'ミュンヘン' ,  sysdate , '2019-09-21' , '2019-10-06' , 'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140127154334633_X3ZGS80NP.jpg/fb40_5_i1.jpg?type=w575_fst&wm=N,' , '#ヨーロッパ,#ビール,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ノッティングヒルカーニバル' , 'イギリス' , 'ノッティングヒル' , 'ノッティング・ヒルカーニバル(Notting Hill Carnival)は、英ロンドンのノッティング・ヒル地域に主に居住していたアフロ・カリブ(Afro-Caribbean)移民者たちが1964年に自分たちの文化と伝統を知らせるという趣旨で始めた街の祝祭だ。' , 'ロンドン' ,  sysdate , '2019-08-24' , '2019-08-26', 'https://cafeptthumb-phinf.pstatic.net/20150902_238/vbxn6761_1441121837367Wih7b_JPEG/AFP_Getty-15082368811.jpg?type=w740,' ,'#ロンドン, #音楽, #街角,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'クリームフィールズ' , 'イギリス' , '英国チェッシャー デアーズベリー ' , '英国チェシャー デアズベリーで毎年8月、バンクホリデー の週末に開かれるダンス音楽フェスティバルだ。 2001年から始まった同祭りは平均万人以上の観覧客が訪問し、世界的に有名なダンスアイコンになった。 音楽公演、ダンス公演、キャンプを一緒に楽しむことができる。' , 'チェッシャ' ,  sysdate , '2020-08-27' , '2020-08-30', 'https://postfiles.pstatic.net/20140529_39/crazyiva_1401290972924DGXrT_JPEG/creamfields14.jpg?type=w2,' ,'#チェシャ, #音楽,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ケーケンホープ' , 'オランダ' , 'オランダのジョイトホラント州リセ' , 'ケッケンホフは、よく「花の国」と呼ばれるオランダの名声を反映する世界的な花祭りだ 毎年3~5月中に約二ヵ月間、オランダ莉世のコペンハーゲン公園で行われる花祭りは、第2次世界大戦が終わった後1949年に始まり、今日まで続いている。 オランダはチューリップの主産地であるだけでなく、全世界に最も多い花卉類を輸出する園芸強国だ。 ケッケンホフを単にチューリップ祭りとして知っている場合が多いが、実際にケッケンホフはチューリップはもちろん、水仙花、ヒヤシンス、カーネーション、フリジア、バラなど数百万個の球根植物を一堂に集めた地上最大の球根花卉類の展示場であり、花祭りである。' , 'ザウィットホラント州リセ。' ,  sysdate , '2020-03-21' , '2020-05-10', 'https://post-phinf.pstatic.net/20160405_262/1459840668577BwCVe_JPEG/a_02.jpg?type=w1200,https://post-phinf.pstatic.net/20160405_176/1459840819810GFPo4_JPEG/a_06.jpg?type=w1200,' ,'# 花, #チューリップ,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '世界ボディーペインティング フェスティバル' , 'オーストリア' , 'ケルテン州' , 'ボディー・ペインティングの分野で最も大きな規模でオーストリアのケルンテン州(Karnten、カリンティア(Carinthia)とも呼ばれた)で毎年7月頃開催される。 人の体を美しい芸術作品で表現するボディーペインティングショーとともに最高のアーティストを選定する競争大会を行う。 全世界で60人余りのアーティストたちが参加して万人が超える人々が訪問する。 1998年ケルンテン主義の幾つかの都市で開催し、2017年からケルンテン州の州都であるがクラーゲンフルト(Klagenfurt)で開催した。' , 'ケルテン州' ,  sysdate , '2020-07-09' , '2020-07-11', 'https://postfiles.pstatic.net/MjAxOTA3MTVfMTgz/MDAxNTYzMTcwNTU4OTY0.OJDznOxIm2hZqe-2LK19Xe5PeWoQebho29xhdtvC4FYg.2rVhrteVHBQYFq5QLyz02KPdInY83AC4L2eKLjKo-qgg.JPEG.oea5581/KakaoTalk_20190715_142956777.jpg?type=w966,http://pokute.com/wp-content/uploads/1/cfile28.uf.2758DC5053D26E11295179.jpg,' ,'#芸術, #ボディ,');


INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'アブシンベル フェスティバル', 
    'EG', 
    'エジプト アスワン アブ シンベル神殿', 
    'エジプトのアブ・シンベルにあるラムセス2歳の太陽神殿で毎年二回太陽光が神殿奥の耐性牛を照らす現象を記念するフェスティバル', 
    'アスワン', 
    SYSDATE, 
    '2019-02-22', 
    '2019-10-22', 
    'https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006441_D9USKS5TA.jpg/fb40_77_i2.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006399_2QRU2OKUN.jpg/fb40_77_i5.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006400_EUOZ93BJ4.jpg/fb40_77_i6.jpg?type=w575_fst&amp;wm=N,', 
    '#伝統,#神殿,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'セルバンティーノ国際祭り', 
    'MX', 
    'メキシコ 과グアナフアト', 
    '国際セルバンティーノフェスティバル(FIC)は,メキシコおよび中南米で最も重要な芸術的および文化的なイベントです。 国際舞台芸術の融合により,世界4大祭りの中で特別な地位を獲得しました。 FICでは,音楽,オペラ,演劇,ダンス,ビジュアルアート,文学,視聴覚メディアが集まる。', 
    'グアナフアト', 
    SYSDATE, 
    '2019-10-10', 
    '2019-10-28', 
    'https://festivalcervantino.gob.mx/assets/images/sobre_fic/sobre_fic_2.jpg,https://festivalcervantino.gob.mx/assets/images/sobre_fic/sobre_fic_1.jpg,https://festivalcervantino.gob.mx/assets/images/sobre_fic/sobre_fic_4.jpg,', 
    '#演劇,#音楽,#ダンス,#視覚芸術,#映画祭,#ゼミ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    '死者の日', 
    'MX', 
    'メキシコ', 
    'メキシコで毎年10月末から11月初めにこの世を去った家族や知り合いを称え、彼らの冥福を祈る節句', 
    'メキシコ', 
    SYSDATE, 
    '2019-10-31', 
    '2019-11-02', 
    'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140926155810478_D70JTK94H.jpg/fb40_64_i2.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140926155920046_WY7FO3CCI.jpg/fb40_64_i5.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140926155923263_FXRAHL0LC.jpg/fb40_64_i7.jpg?type=w575_fst&amp;wm=N,', 
    '#名節,#ハロウィン,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'シンコ·デ·メイオ', 
    'MX', 
    'メキシコ', 
    'シンコ·デ·メイオはメキシコの血統を持つアメリカ人が楽しむ祭りであるだけでなく、メキシコと米国の協力と友情を記念する活気あふれる祭りである。', 
    'メキシコ', 
    SYSDATE, 
    '2020-05-05', 
    '2020-05-05', 
    'https://dbscthumb-phinf.pstatic.net/5182_000_1/20171227180117030_YONMMBRVS.jpg/ba21_65_i1.jpg?type=w276_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/5182_000_1/20180212195844152_7ZVA6O53O.jpg/ba21_65_i2.jpg?type=w406_fst&amp;wm=N,', 
    '#アメリカ,#メキシコ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ケベック ウィンター カーニバル', 
    'CA', 
    'カナダケベック', 
    'ケベックにウィンターカーニバル(Le Carnaval dequébec)は北アメリカ大陸のフランスと呼ばれるカナダ・ケベック(québec)で毎年1月末から17日間開催される祭りである。 ケベックは16世紀フランスの植民地開拓されたヌーベルフランス(Nouvelle-France、新しいフランス)の中心地として、中世ヨーロッパを連想させる古風な旧市街地、活気に満ちた新市街地が共存している。 冬の平均気温が氷点下10度前後で、60センチ以上の雪が降る雪の都市・ケベックで毎年盛大な冬祭りが行われる。', 
    'ケベック', 
    SYSDATE, 
    '2020-02-07', 
    '2020-02-16', 
    'https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162712046_LMSNOAFN3.jpg/fb40_95_i1.jpg?type=w406_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162716176_XFWCGZQX1.jpg/fb40_95_i2.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162738384_SI26P1ZMU.jpg/fb40_95_i6.jpg?type=w575_fst&amp;wm=N,', 
    '#冬,#アメリカ,#カナダ,#雪,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'セントパトリックデー', 
    'CA', 
    'カナダケベック州モントリオール', 
    'セント・パトリックスデイはアイルランドの守護聖人セントパトリックがこの世を去った日の3月17日にアイルランドをはじめ、世界のいたるところでパトリック・成人を称え、開かれる祭りだ。 同日、アイルランド系移住民が多く住んでいる米国、英国、カナダを含め、アルゼンチン、オーストラリア、ニュージーランドなどでも様々な行事が開催される。 つまり、セントパトリック 데デーは、アイルランドにキリスト教を伝播したパトリック成人を記念する宗教祭であるだけでなく、アイルランド民族としてのアイデンティティと彼らの文化を確認する民族祭りでもある。', 
    'モントリオール', 
    SYSDATE, 
    '2020-03-17', 
    '2020-03-17', 
    'https://dbscthumb-phinf.pstatic.net/2890_000_1/20140508175617443_8FO0LBZZJ.jpg/fb40_24_i1.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140508175700964_XF0QZPFXP.jpg/fb40_24_i4.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20140508175646758_1VY19UP33.jpg/fb40_24_i3.jpg?type=w575_fst&amp;wm=N,', 
    '#宗教,#アイルランド,#アメリカ,#カナダ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'オタワチューリップ祭り', 
    'CA', 
    'カナダオタワ コミッショナー 公園', 
    '1953年に初めて開かれた。 後日、オランダ女王になったユリアナ王女が第2次世界大戦の戦乱を避けてオタワ市に泊めてあげたことに感謝する意味で毎年10万個のチューリップの球根をオタワ市にプレゼントしたことがきっかけになった。 以後、チューリップの本場とも言えるオランダを抜き、世界最大規模のチューリップフェスティバルへと発展した。祭りの中心地とも言えるコミッショナーパークには30万本以上のチューリップが植えられて、祭りが始まると、公園一帯が巨大なチューリップ花畑になる。 議事堂の丘はユリアナ王女が初めてプレゼントした10万個のチューリップの球根が植えられた所で、意義が深い所だ。 リドー運河を挟んで15キロにわたって続くチューリップルートも目を引く。 このほか、世界の花卉デザイナーが一堂に会し、フラワーショーを披露するチューリップエクスプロージョン、各国の音楽と伝統文化を紹介するチューリップビレッジ、リド運河で行われるチューリップボートパレードなど多様なイベントが行われる。', 
    'オタワ', 
    SYSDATE, 
    '2019-05-08', 
    '2019-05-18', 
    'http://blogfiles.naver.net/20160330_293/storycatbook_1459334423364Ghhef_JPEG/Tulip-Festival.jpg,http://blogfiles.naver.net/20160509_1/canadawow_14627616206143BBvS_JPEG/Canadian-Tulip-Festival1.jpg,', 
    '#春,#アメリカ,#花,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'MUTEKモントリオール', 
    'CA', 
    'カナダケベック州モントリオール', 
    'モントリオール国際ジャズフェスティバルはカナダ東部・ケベック州のモントリオールで毎年6月末から10日間開催される世界最大規模のジャズ・フェスティバルだ。 16世紀のフランスによって開拓されたケベック地域は、欧州の古風さや北米の活気が共存する場所である。 その中、モントリオールはパリの後を継ぐ第2のフランス語圏の都市で「北アメリカ大陸のパリ」と呼ばれたりもする。 かつて設けられた文化的土壌の上に「むかご・ビブル」、つまり生の喜びが最上の価値に位置したモントリオールには1年中お祭りが絶えない。 特に多くの祝祭が集中している夏は、モントリオール国際ジャズフェスティバルによって、さらに熱い熱気に包まれる。', 
    'モントリオール', 
    SYSDATE, 
    '2019-06-26', 
    '2019-07-06', 
    'http://cafefiles.naver.net/20151110_140/lllimy_1447111044966BW6xK_PNG/%B8%F3%BD%BA%B8%AE%BF%C3_%B1%B9%C1%A6_%C0%E7%C1%EE_%C6%E4%BD%BA%C6%BC%B9%FA_03.PNG,http://cafefiles.naver.net/20151110_37/lllimy_1447111044210zlIQ9_PNG/%B8%F3%BD%BA%B8%AE%BF%C3_%B1%B9%C1%A6_%C0%E7%C1%EE_%C6%E4%BD%BA%C6%BC%B9%FA_06.PNG,http://cafefiles.naver.net/20151110_300/lllimy_1447111047751w149E_PNG/%B8%F3%BD%BA%B8%AE%BF%C3_%B1%B9%C1%A6_%C0%E7%C1%EE_%C6%E4%BD%BA%C6%BC%B9%FA_04.PNG,', 
    '#音楽,#アメリカ,#ジャズ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'リオ カーニバル', 
    'BR', 
    'ブラジルのリオデジャネイロ', 
    '元々カーニバルは禁欲期間である四旬節を控えて楽しむ祭りをいう。 その中で一番有名なお祭りが世界3大美港の一つであるブラジルのリオデジャネイロで開かれるリオのカーニバルだ。 開催時期はブラジル政府で決めるが、毎年2月末から3月初めの間の4日間だ。 この時は土曜日の夜から水曜日の未明まで昼夜を問わず祭りが開かれる。
ポルトガルからブラジルに渡ってきた人々の四旬節の祭典とアフリカの奴隷たちの伝統打楽器演奏とダンスが合わさって生まれた。 これがだんだん発展して20世紀初めに現在のような形式のカーニバルが完成された。 しかし、1930年代初めまでは普通の街頭祝祭に過ぎなかった。 その後、サンバ学校が設立され、学校別にパレードを繰り広げ、今のような大規模なフェスティバルに発展した。', 
    'リオデジャネイロ', 
    SYSDATE, 
    '2019-03-01', 
    '2019-03-05', 
    'http://blogfiles.naver.net/20100803_235/chunjangsa_1280840296873inUFo_jpg/%B8%AE%BF%EC%C4%AB%B4%CF%B9%DF2010%2809%29_chunjangsa.jpg,http://cafefiles.naver.net/20130326_73/zymbfkgj51_1364265195244LuJWk_JPEG/%B8%AE%BF%EC%C4%AB%B4%CF%B9%DF.jpg,http://imgnews.naver.net/image/5437/2018/02/19/0000008936_002_20180219180037461.jpg,', 
    '#カーニバル,#アメリカ,#サムバ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ローラファルージャブラジル', 
    'BR', 
    'ブラジル サンパウロ', 
    'アメリカで始まった音楽祭。 ロック、ヒップホップなどジャンル不問! 多様なアーティストたちが参加する。', 
    'サンパウロ', 
    SYSDATE, 
    '2019-04-03', 
    '2019-04-05', 
    'https://t1.daumcdn.net/cfile/tistory/996E96365D6A3E2222,', 
    '#アメリカ,#音楽,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ニューヨークコミックコーン', 
    'US', 
    'アメリカ ニューヨーク', 
    'ニューヨークコミックコンは東海岸最大のポップカルチャーコンベンションであり,世界のコミック,出版,メディア,ライセンス供与の首都ゴサムシティで唯一のコンベンションである。', 
    'ニューヨーク', 
    SYSDATE, 
    '2019-10-03', 
    '2019-10-06', 
    'http://image.zdnet.co.kr/2009/02/09/bWZK9fHT8wG2hrxIdGmG.jpg,http://image.zdnet.co.kr/2009/02/09/bWZK9fHT8wG2hrxIdGmG.jpg,', 
    '#博覧会,#コスチューム,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'モバイルワールドコングレスロスアンジェレス', 
    'US', 
    'ロサンゼルスコンベンションセンター,1201 S Figuera St Los Angels,CA 90015', 
    'MWC Los Angel 2019 は,モバイル·テクノロジー業界における主要な企業や影響力のある専門家を集め,インテリジェント·コネクティビティーを推進する,米国で最も急速に成長しているイベントの 1 つです。5 MWC19ロサンゼルスでは,最もダイナミックなテクノロジーの展示と,業界のリーダー,影響力者,新興のイノベーターで構成される,刺激的な会議プログラムを提供します。 この変革の最前線で活躍するエグゼクティブとミーティングを行い,北米で最初に展開される第5世代ネットワークを体験して,インテリジェントな接続性をどのように活用できるかをご確認ください。MWC Los Angel 2019 は,モバイル·テクノロジー業界における主要な企業や影響力のある専門家を集め,インテリジェント·コネクティビティーを推進する,米国で最も急速に成長しているイベントの 1 つです。5 MWC19ロサンゼルスでは,最もダイナミックなテクノロジーの展示と,業界のリーダー,影響力者,新興のイノベーターで構成される,刺激的な会議プログラムを提供します。 この変革の最前線で活躍するエグゼクティブとミーティングを行い,北米で最初に展開される第5世代ネットワークを体験して,インテリジェントな接続性をどのように活用できるかをご確認ください。', 
    'ロサンゼルス', 
    SYSDATE, 
    '2019-10-22', 
    '2019-10-24', 
    'https://i1.wp.com/mobileecosystemforum.com/wp-content/uploads/2019/07/Image-3.png?fit=1200%2C628&ssl=1,', 
    '#博覧会,#アメリカ,#IT,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ブリスコン', 
    'US', 
    'カリフォルニア州アナハイムコンベンションセンター', 
    '地球最高の行事にいらっしゃったことを歓迎します。 ブリスカンは友情を固め、英雄が生き、世界で最も情熱的なコミュニティが注目を集める祭りの場です。 ゲームを愛する方々のためのコースプレー、大会など、楽しい楽しさと見どころが週末中いっぱいです。 惜しんでおいた徳力をむやみに噴出してください! ゲーマーの故郷へようこそ!', 
    'アナハイム', 
    SYSDATE, 
    '2019-11-01', 
    '2019-11-02', 
    'https://2ctptqj9vf3lafyt2rkh1qto-wpengine.netdna-ssl.com/wp-content/uploads/2017/10/Blizzcon.jpg,https://pmcvariety.files.wordpress.com/2018/09/blizzcon-2018.jpg?w=1000&h=563&crop=1,', 
    '#博覧会,#ゲーム,#アメリカ,#コスチューム,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'セマ国際モーターショー', 
    'US', 
    'ラスベガスコンベンションセンター', 
    '瀬間国際モーターショーは毎年11月、米ラスベガスコンベンションセンターで開かれる世界的なチューニングカー博覧会である。 1963年から開かれており、大会名称である瀬間(SEMA)は「Specialty Equipment Market Association」の頭文字で取得したものだ。 1963年小規模製造業者らが中心として会を作りながら第1回大会を開催したが、初めてには集まりの参加者たちの業種の特性に応じて大会の名称を「Speed Equipment Manufacturers Association」の頭文字から取った。 初期の主催側はモータースポーツの部品基準を一本化し、実用性を高めることに重点を置いたが、日増しに組織が大きくなり、自動車会社や流通会社、卸売り소매小売業者、下請け会社、広報会社などまで加わり、今の名称に変わった。
毎年100余カ国から来た10万人あまりの自動車関連産業専門家たちが展示場を訪れる。 2000個以上の参加会社で1日に数十個のイベントやセミナー、試演会を実施する。 セマショーはコンベンションセンターより外で行われるライブショーが多彩だという評価を受けている。 行事場の外にはほとんど1000台のプロジェクトが展示される。 展示会は車種や部品の種類によって12つのセクションに分かれて行事が行われる。 2011年瀬間ショーは11月1~4日開かれる。', 
    'ラスベガス', 
    SYSDATE, 
    '2019-11-05', 
    '2019-11-08', 
    'https://ccnwordpress.blob.core.windows.net/journal/2018/11/sema-first-time.jpg,http://shows.autospies.com/gallery/auto-show-photos.asp?imageId=221898&galleryId=811,http://shows.autospies.com/gallery/auto-show-photos.asp?imageId=221991&galleryId=811,', 
    '#モーターショー,#車,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'LAオートショー', 
    'US', 
    'カリフォルニア州ロサンゼルスコンベンションセンター', 
    '毎年LAで開かれるモーターショー', 
    'ロサンゼルスロサンゼルス', 
    SYSDATE, 
    '2019-11-22', 
    '2019-12-01', 
    'https://laautoshow.com/wp-content/uploads/2019/03/West-Hall_Wide.jpg,https://laautoshow.com/wp-content/uploads/2018/12/compressJeff-0965.jpg,', 
    '#モーターショー,#車,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ニューオーリンズ·マダグラ', 
    'US', 
    'ニューオーリンズ', 
    'マルディ·グラは音楽,パレード,ピクニック,山車,そして興奮について語ります。 ニューオーリンズでは大きな祝日です。
牧師は衣装を着るか,少なくとも紫,緑,金色の服を着て,以前のパレードの山車から長いビーズで自らを飾る。 クレイジーな衣装がたくさん見られますし,家族連れの子もいたるところにいて,地元の人も来場者も楽しめます。 パレードの客は地面に座り,ボールを投げ,音楽を演奏し,おいしい料理を食べ,パレードの間を行き来する人々を見ます。 マルディ·グラスの日,祝賀行事のために重要でない企業の多くが閉鎖される。
経験豊富な発見者は,大きなバッグを持参し,パレードで捕まるビーズや小石を全て取り出せるようになっています。', 
    'ニューオーリンズ', 
    SYSDATE, 
    '2020-01-06', 
    '2020-02-25', 
    'https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006441_D9USKS5TA.jpg/fb40_77_i2.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006399_2QRU2OKUN.jpg/fb40_77_i5.jpg?type=w575_fst&amp;wm=N,https://dbscthumb-phinf.pstatic.net/2890_000_1/20141023123006400_EUOZ93BJ4.jpg/fb40_77_i6.jpg?type=w575_fst&amp;wm=N', 
    '#カーニバル,#アメリカ,#ジャズ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    '国際電子製品博覧会', 
    'US', 
    'ラスベガスコンベンションセンター', 
    'CEA(Consumer Electronics Association)が主催している『Consumer Electronics Show』は1967年6月ニューヨークで初めて始まって以来、IT/消費財の電子産業の代表的な展示会に成長した。
CES展示会は毎年、新しい技術トレンドを持続的に提示する役割を果たしており、IT分野だけでなく自動車、コンテンツ、文化など業界最高の基調演説者を立てており、高いレベルのカンファレンスも同時に進めてきた。 また、各企業とのパートナーシップを強化することに多大な努力を傾け、毎年展示会の運営焦点を企業と消費者が望む方向に合わせている。 このような努力のおかげで、1967年、ニューヨークからわずか200社の企業が参加した中、9,290m²規模で最初に開催されたCESは、今日の37のサッカー場を合わせた大きさで開催される、この分野で世界最大の展示会に位置づけられている。', 
    'ラスベガス', 
    SYSDATE, 
    '2020-01-07', 
    '2020-01-10', 
    'https://0.rc.xiniu.com/g2/M00/16/7D/CgAGfFxAKmCAcSjkAAvxEuJhroE212.jpg,https://0.rc.xiniu.com/g2/M00/16/7D/CgAGfFxAKmCAcSjkAAvxEuJhroE212.jpg,', 
    '#博覧会,#アメリカ,#電子製品,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'シカゴ国際オートショー', 
    'US', 
    'シカゴのマコミックプレイス', 
    'シカゴモーターショーは、米イリノイ州シカゴ マコーミックプレイス(McormickPlace)で毎年開催される世界的な自動車展示会(モーターショー)だ。 規模面では世界5大モーターショー(デトロイトモーターショー、フランクフルトモーターショー、ジュネーブモーターショー、パリモーターショー、東京モーターショー)には及ばないが、歴史だけで100年の伝統ある大会だ。 自動車展示会は一般的に「モーターショー」と呼ぶ慣行のため、韓国では「シカゴ고オートショー」と呼ばれるが、正式な名前は「シカゴオートショー(Chicago Auto Show)」だ。 シカゴモーターショーは1901年初大会を開いた。 1回大会から4000人の観覧客がモーターショーを訪れるなど、興行に成功した。 1935年からシカゴ自動車貿易協会(CATA∙Chicago Automobile Trade Association)が行事を主管し始め、今まで大会を開いている。 毎年1月に開催されるデトロイトモーターショーが新年新車トレンドと未来志向的なコンセプトカー中心の展示会なら、2月に開催されるシカゴモーターショーは彼より商業的な性格が強い。 デトロイトモーターショーは自動車関係者に、シカゴモーターショーは一般観覧客にさらに重点を置いている。 一般観覧客が主な顧客であるだけに、「女性の日」、「フードデー」、「ヒスパニックデー」など、様々な記念日を定めてイベントを開く。', 
    'シカゴ', 
    SYSDATE, 
    '2020-02-08', 
    '2020-02-17', 
    'https://cdn.abcotvs.com/dip/images/507232_cas-broad-shot.JPG?w=1280&r=16%3A9,https://www.classicarnews.com/wp-content/uploads/2019/02/chicago-auto-show-2019-floor.jpg,', 
    '#モーターショー,#車,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'パックスイースト', 
    'US', 
    'マサチューセッツ州ボストンコンベンション&エクシビションセンター', 
    'アメリカで毎年開催されているゲーム展示会 ビジネスよりは徹底して一般ユーザーに焦点を合わせたイベントで、新作の展示はもちろん、大会、コスチュームプレーなどと関連した様々なイベントも開かれる。', 
    'ボストン', 
    SYSDATE, 
    '2020-02-27', 
    '2020-03-01', 
    'https://assets.paxsite.com/east/images/gallery/2x_east2018_d3_(8_of_15).jpg,https://assets.paxsite.com/east/images/gallery/2x_east2018_d3_(12_of_15).jpg,https://assets.paxsite.com/east/images/gallery/2x_east2018_d3_(3_of_15).jpg,', 
    '#博覧会,#ゲーム,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'サウスバイ サウスウェスト', 
    'US', 
    'テキサス州オースティン', 
    '3月初めに米国テキサス州オースチンで開かれる音楽フェスティバルでアルフレッド・ヒッチコック(Alfred Hitchcock、1899~1980)監督の映画<north by northwest>(1959)に着眼して名づけた。 音楽だけでなく映画·ゲームフェスティバルやカンファレンスなどを主管する。 1987年に始まった後、徐々に規模が大きくなり、現在は90あまりの公演場で50ヵ国あまりのミュージシャン2000あまりチームが参加し、オースティン・経済に最も大きな部分を占めている祭りに成長した。', 
    'オースティン', 
    SYSDATE, 
    '2020-03-13', 
    '2020-03-22', 
    'https://world.wng.org/sites/default/files/styles/article_hero/public/migrated_images/sxsw_stage.jpg?itok=qpMHMBSL,https://i1.wp.com/blog.bfr.com/wp-content/uploads/2018/03/2017-boldstage-AR-blog-e1520277299885.png?resize=900%2C572&ssl=1,', 
    '#音楽,#映画,#博覧会,#アメリカ,#ゲーム,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ゲーム開発者会議', 
    'US', 
    'サンフランシスコ モスコンセンター', 
    'ゲーム開発者会議 (GDC) は,ゲーム開発コミュニティを集め,教育,インスピレーション,ネットワーキングの 5 日間でアイデアを交換し,業界の未来を形作ります。 参加者には,プログラマ,アーティスト,プロデューサー,ゲームデザイナー,オーディオプロフェッショナル,およびビジネスリーダーが含まれます。
この市場限定カンファレンスでは,講義,パネル,円卓会議が幅広く取り上げられ,GDC万博では,Amazon,Epic,Oculus,Intel,Nvなどの大手テクノロジー企業の最新のゲーム開発ツールとサービスを紹介している。 GDCの参加者は,専用コミュニティスペース,レトロゲーム,レトロゲーム,代替コントローラーなどで,リラックスして新しい人たちと交流することを学ぶこともできます。', 
    'モスコンセンター', 
    SYSDATE, 
    '2020-03-16', 
    '2020-03-20', 
    'https://simplecore.intel.com/newsroom/wp-content/uploads/sites/11/2019/03/Intel-IEM-Katowice2019-4.jpg,https://www.gdconf.com/sites/default/files/394982_GDC19_GDCMainStage_1200x600_0.png,', 
    '#博覧会,#アメリカ,#ゲーム,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ウルトラミュージックフェスティバル', 
    'US', 
    'ベイフロントパーク ダウンタウン·マイアミ', 
    'ウルトラミュージックフェスティバルは,毎年3月に米国フロリダ州マイアミで開催される屋外電子音楽祭です。 このフェスティバルは,1999年にラッセル·ファイビッシュとアレックス·オメスによって創設され,1997年のデペチェ·モード·アルバム"ウルトラ"にちなんで名付けられた。
最初はマイアミビーチで開催されましたが,ビセンテニアルパークのテニュアに加えて,2019年にバージニアキーで一時的に開催されました。このテニュアは主にマイアミのダウンタウンにあるベイフロントパークで開催されました。 1999年から2006年の1日間のお祭りだった。
マイアミの旗艦イベントに加えて,ウルトラは,南アフリカ,韓国,シンガポール,メキシコ,ブラジルなどを含むUltra Worldwideのブランディングの下,より大きな国際フランチャイズを展開している。', 
    'ベイフロントパーク', 
    SYSDATE, 
    '2020-03-27', 
    '2020-03-29', 
    'https://umfworldwide.com/wp-content/uploads/2017/03/rukes-main-stage.jpg,https://www.edmtunes.com/wp-content/uploads/2018/03/PH_0326_UMF01.jpg,', 
    '#音楽,#アメリカ,#カーニバル,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'コアチェラバレー音楽芸術祭', 
    'US', 
    '81-800 Avenue 51,Indio,CA 92201', 
    'アメリカカリフォルニア州インディオで毎年4月の第三週週末に3日間開かれるロック、インディ、ヒップホップ、エレクトロニック音楽、造形芸術祭だ。 この祭りではライブ音楽公演が数々の舞台で行われ、2003年から、キャンピングテント施設を備えて、キャンプも可能だ。 2001年に始まったこのフェスティバルには225,000人以上の訪問客が参加する。', 
    'カリフォルニア インディオ', 
    SYSDATE, 
    '2020-04-10', 
    '2020-04-19', 
    'https://cdntdreditorials.azureedge.net/cache/5/0/c/6/9/a/50c69a8746bac5d38ca5fe343a64106d7fb1cfc6.jpg,https://newyork.cbslocal.com/wp-content/uploads/sites/14578484/2016/03/gettyimages-517060808_master.jpg?w=1024&h=576&crop=1,', 
    '#音楽,#アメリカ,#ヒップホップ,#ロックフェスティバル,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ニューヨーク国際オートショー', 
    'US', 
    'アメリカニューヨーク ジェイコブ ザビッツ コンベンションセンター', 
    '2020年ニューヨーク国際自動車ショーでは,最新の自動車トレンドを活用して,最先端のデザインと素晴らしい革新のコレクションを披露しています。 世界の自動車メーカーの4階以上のディスプレーには,最新車と最新の未来型コンセプトカーが登場しました。 1900年に遡る北米初の最大参加者自動車ショーでは,1000台近くの自動車やトラックが展示されていた。2020年ニューヨーク国際自動車ショーでは,最新の自動車トレンドを活用して,最先端のデザインと素晴らしい革新のコレクションを披露しています。 世界の自動車メーカーの4階以上のディスプレーには,最新車と最新の未来型コンセプトカーが登場しました。 1900年に遡る北米初の最大参加者自動車ショーでは,1000台近くの自動車やトラックが展示されていた。', 
    'ニューヨーク', 
    SYSDATE, 
    '2020-04-10', 
    '2020-04-19', 
    'https://world.wng.org/sites/default/files/styles/article_hero/public/migrated_images/sxsw_stage.jpg?itok=qpMHMBSL,https://i1.wp.com/blog.bfr.com/wp-content/uploads/2018/03/2017-boldstage-AR-blog-e1520277299885.png?resize=900%2C572&ssl=1,', 
    '#モーターショー,#車,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ナブショー', 
    'US', 
    'ラスベガスコンベンションセンター', 
    'NABショーでは,画期的なテクノロジーが発表され,革新的なソリューションが展示され,ゲームを変える傾向が明らかにされます。 究極のテクノロジー,カッコイイ,スマートソフトウェア,高性能のクラウドソリューション,無限のアイデアとインスピレーションから,次から次へと探求する準備をします。 ここでのみ,袖をまくり,コンテンツの未来を牽引する製品,サービス,および人々と手を取り合うことができます。', 
    'ラスベガス', 
    SYSDATE, 
    '2020-04-18', 
    '2020-04-22', 
    'https://d2908q01vomqb2.cloudfront.net/fb644351560d8296fe6da332236b1f8d61b2828a/2019/01/29/AWS_NAB_2019_Header-1024x508.jpg,https://ownzones.com/wp-content/uploads/2018/08/NAB.jpg,', 
    '#博覧会,#アメリカ,#放送,#カメラ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ニューオーリンズ ジャズ&ヘリテージ フェスティバル', 
    'US', 
    'アメリカ ルイジアナ州ニューオーリンズ', 
    'ジャズフェストは長年にわたって,ポルスタ雑誌から"今年のフェスティバル"に4度選出されるなど,数々の栄誉を受けてきました。 ウォールストリート·ジャーナルは,"ジャズ·フェストは米国のどのフェスティバルよりも広く,より深いアメリカの音楽スタイルのラインナップを見せてくれる"と述べている。 彼らのロケールへの簡単な侵略,ジャズフェストは都市と切り離せない施設です。
1970年にマハリア·ジャクソンとユーレカ·ブラース·バンドの精神に触発され,ニューオーリンズ·ジャズ&ヘリテージ·フェスティバルはルイジアナ州の文化とゴスペルの熱狂を祝福し続けている。
2019年祭は4月25日から5月5日まで開催され,毎年50回目を迎える。', 
    'ニューオーリンズ', 
    SYSDATE, 
    '2020-04-23', 
    '2020-05-03', 
    'https://9xzxv1eo7572295fo1ebb5x1-wpengine.netdna-ssl.com/wp-content/themes/apollo/css/i/spacer.png,https://9xzxv1eo7572295fo1ebb5x1-wpengine.netdna-ssl.com/wp-content/themes/apollo/css/i/spacer.png,https://9xzxv1eo7572295fo1ebb5x1-wpengine.netdna-ssl.com/wp-content/themes/apollo/css/i/spacer.png,', 
    '#音楽,#ジャズ,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    '北アメリカ国際オートショー', 
    'US', 
    'デトロイト コボセンター', 
    '米国デトロイト自動車ディーラー協会が毎年1月にデトロイトで開催される国際自動車展示会で「北米国際オートショー」ともいう。 デトロイト地域はクライスラー、フォード、ジェネラルモーターズなど、米ビックスリー(Big Three)の本社があるところであり、世界的に重要なモーターショーの一つとして認められている。 新規模デル、コンセプトカーなどが展示されるだけでなく、自動車技術の動向に関するシンポジウムなども開催される。',
    'デトロイト', 
    SYSDATE, 
    '2020-06-06', 
    '2020-06-20', 
    'https://o.aolcdn.com/images/dims3/GLOB/legacy_thumbnail/800x450/format/jpg/quality/85/http://o.aolcdn.com/hss/storage/midas/6546ea9764982c041a022b585df02dd6/206294361/people-visit-the-ford-stand-during-the-press-preview-at-the-2018-picture-id905624520,', 
    '#モーターショー,#車,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'イーストパック', 
    'US', 
    'ニューヨークのジェイコブ ジャビッツ コンベンションセンター', 
    'イーストパックは,PepsiCo,Peperidge Farms,Marthsなどの企業のプロフェッショナルと,最新のパッケージングテクノロジー(自動機器を含む)を半自動機器から提供しています。
    今年の6月,EastPackで8000人の上級製造専門家にご参加ください。', 
    'ニューヨーク', 
    SYSDATE, 
    '2020-06-09', 
    '2020-06-11', 
    '', 
    '#博覧会,#アメリカ,#パッケージング,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'E3', 
    'US', 
    'カリフォルニア州ロサンゼルスコンベンションセンター', 
    'E3はコンピューター,ビデオゲーム,関連製品の世界最高のイベントです。 E3では,ビデオゲーム業界トップのタレントがロサンゼルス·コンベンション·センターに詰め込まれ,インタラクティブ·エンターテインメント業界で最高で,最も明るく,最も革新的なものを何万人もつないでいます。 三日間,先端企業,画期的な新技術,未経験の製品が披露される。 E3は,新しいパートナーと既存のパートナー,業界のエグゼクティブ,ゲーマー,およびソーシャルインフルエンサーの両方と連携し,ビデオゲーム業界全体に対して未曽有の露出を実現します。', 
    'ロサンゼルス', 
    SYSDATE, 
    '2020-06-09', 
    '2020-06-11', 
    'https://i1.wp.com/metro.co.uk/wp-content/uploads/2019/06/Screenshot_1-c87d.jpg?quality=90&strip=all&zoom=1&resize=644%2C320&ssl=1,http://images.pushsquare.com/2c984ca33078b/e3-2019-ps4-playstation-4-1.900x.jpg,https://cnet1.cbsistatic.com/img/ITUFORYwrtBtKsbMfRkd0QKDUpU=/980x551/2019/06/12/0746991a-43e3-4cef-aa66-25342c5733c7/e3-2019-fortnite-epic-games-4858.jpg,', 
    '#電子,#博覧会,#アメリカ,#ゲーム,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'サンディエゴ コミックコーン', 
    'US', 
    'サンディエゴのバルボアパークにあるコミックコン博物館', 
    'コミック·コン·インターナショナル:サンディエゴは1970年,故シェル·ドルフ,ケン·クルーガー,リチャード·アルフなど,コミック,映画,SFファンの一団が結成して登場した。 コミック·コンは1970年3月21日,サンディエゴの中心部にある米グラント·ホテルで,サンディエゴの金州コミック·ミニコンと呼ばれる1日間の"ミニコン"として始まった。 2人の特別ゲスト,Forest J AckermanとMike Royerが含まれ,約100人の参加者が集まったこの1日限りのイベントは,資金を集め,より大きな大会への関心を高めることだった。 ミニコンの成功により,1970年8月1日から3日にかけて,米国グランプリ·ホテル"サンディエゴ黄金州コミックコン"が初めて本格的に開催されました。', 
    'サンディエゴ', 
    SYSDATE, 
    '2020-07-22', 
    '2020-07-26', 
    'https://stackup.org/wp-content/uploads/2018/07/maxresdefault-23.jpg,https://ca-times.brightspotcdn.com/dims4/default/a15e393/2147483647/strip/true/crop/2048x1152+0+0/resize/840x473!/quality/90/?url=https%3A%2F%2Fca-times.brightspotcdn.com%2F19%2F1b%2Fbf69261d980c9c3e5b30dfda6035%2Fla-1529530190-hr6uhb5oiy-snap-image,https://cnet3.cbsistatic.com/img/ajrXtHNAjxI3yY3Fqq2a4ieLPPw=/980x551/2019/07/20/f5d6bd64-b84c-4ca4-841b-641530b12b1a/marvel-avengers-sdcc-2019-cosplay-3615.jpg,', 
    '#漫画,#コスチューム,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'ロラパルツァシカゴ', 
    'US', 
    'イリノイ州シカゴグラント公園', 
    '4日にわたって開かれるオルタナティブロック(alternative rock)、ヘビーメタル、パンクロック、ヒップホップ、ダンス音楽祭で世界的に有名なアーティストたちが参加して音楽公演を行う。 設置美術作品展示会、コメディー公演など、様々な楽しみ方が提供される。 1991年「オルタナティブ音楽フェスティバル」で開始され、現在、毎年平均約16万人以上が訪問する大規模なロック・フェスティバルとして成長した。 祭りの主要場所は1911年に造成されたシカゴの名所、シカゴのグラント・公園(Grant Park)で、祭り期間4日の間、計180あまりの音楽公演が行われる。', 
    'シカゴ', 
    SYSDATE, 
    '2020-07-30', 
    '2020-08-02', 
    'https://edmidentity.com/wp-content/uploads/2019/03/Djua7NkW4AIJHwH-696x464.jpg,https://www.gannett-cdn.com/presto/2019/08/04/PMJS/9b7388b5-0efa-46d1-a512-af1f26f0a0fe-Twenty_One_Pilots_By_Roger_Ho_for_Lollapalooza_2019_08-03-208065.jpg?width=540&height=&fit=bounds&auto=webp,https://2ab9pu2w8o9xpg6w26xnz04d-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/lollapalooza-2019--1200x632.jpg,', 
    '#音楽,#ロックフェスティバル,#ヒップホップ,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'KCON 2019 LA', 
    'US', 
    'ロサンゼルス ステープルセンター', 
    'KCONはLets KCONをテーマとする世界最大のK-Culture Conventionです。
2012年からK-POPコンサートをはじめ、ドラマ、ビューティー、ファッション、料理など様々な韓国のライフスタイルコンテンツを体験できるコンベンションを開催して世界の人たちに楽しさを伝え、韓流を広く知らせています。
KCONは2012年米国アーバインを皮切りに毎年開催地を拡大し、先週6年間ニューヨーク(米国)、LA(米国)、東京(日本)、アブダビ(UAE)、パリ(フランス)、メキシコシティ(メキシコ)、シドニー(オーストラリア)などで82万3千人余りの現地韓流ファンらと共に、代表的な韓流プラットフォームとして定着しました。', 
    'ロサンゼルス', 
    SYSDATE, 
    '2019-08-15', 
    '2019-08-18', 
    'http://image.chosun.com/sitedata/image/201908/19/2019081902457_0.jpg,', 
    '#音楽,#KPOP,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'シググラフ', 
    'US', 
    'カリフォルニア州ロサンゼルスコンベンションセンター', 
    'Interest Group on Graphic(s) and Interactive Techniquesの略字。 米国計算機学会(ACM)コンピューターグラフィック(ス)分科会(SIG)の名称。
分科会の名称よりはこの分科会が1974年から毎年主催する世界最大のコンピューターグラフィック(す)国際会議で有名だ。 シーグラフのプログラムは論文発表、講演、セミナー、機器展示、フィルム&ビデオショーなどを構成する。 フィルム&ビデオショーが開かれるコンピューターグラフィック(ス)劇場(computer graphic(s) Theater)には各国の優秀作品が出品され、最新技術で作られたコンピューターアニメーションの競演場となっている。', 
    'ロサンゼルス', 
    SYSDATE, 
    '2019-07-28', 
    '2019-08-01', 
    'https://d1xfgk3mh635yx.cloudfront.net/sites/default/files/styles/inline_wide/public/image/featured/1048861-siggraph-2019-set-thrive-46th-edition.jpg?itok=CCiSGCrM,https://blog.siggraph.org/wp-content/uploads/2019/09/48424246197_eebce11382_o-850x480.jpg,', 
    '#グラフィックス,#CG,#博覧会,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'KCON 2019 NY', 
    'US', 
    'ニューヨーク メディソン スクエア ガーデン', 
    'KCONはLets KCONをテーマとする世界最大のK-Culture Conventionです。
2012年からK-POPコンサートをはじめ、ドラマ、ビューティー、ファッション、料理など様々な韓国のライフスタイルコンテンツを体験できるコンベンションを開催して世界の人たちに楽しさを伝え、韓流を広く知らせています。
KCONは2012年米国アーバインを皮切りに毎年開催地を拡大し、先週6年間ニューヨーク(米国)、LA(米国)、東京(日本)、アブダビ(UAE)、パリ(フランス)、メキシコシティ(メキシコ)、シドニー(オーストラリア)などで82万3千人余りの現地韓流ファンらと共に、代表的な韓流プラットフォームとして定着しました。', 
    'メディソン スクエア ガーデン', 
    SYSDATE, 
    '2019-07-06', 
    '2019-07-07', 
    'https://6.viki.io/image/d150954854e445a29e167a110085a3e1.jpeg?s=900x600&e=t,', 
    '#音楽,#KPOP,#アメリカ,'
);
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
    MAINBOARD_SEQ.nextval, 
    'アップル世界開発者会議', 
    'US', 
    'カリフォルニア州サンノゼ マッキナーリ コンベンションセンター', 
    'アップル社が毎年開催する開発者カンファレンスだ。
主にアップルが開発者のための新しいソフトウェアや技術などを公開するのに使われ、体験活動やフィードバック セッションも一緒に行う。', 
    'サンノゼ', 
    SYSDATE, 
    '2019-06-03', 
    '2019-06-07', 
    'https://photos5.appleinsider.com/gallery/31931-54056-cook-wwdc2019-l.jpg,', 
    '#アップル,#電子製品,#博覧会,#アメリカ,#IT,'
);

commit;