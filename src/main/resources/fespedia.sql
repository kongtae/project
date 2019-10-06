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
Insert into countryname values( 'BA' , 'Bosnia and Herzegovina',' ','보스니아 헤르체코비나' );
Insert into countryname values( 'BN' , 'Brunei', 'ブルネイ', '브루나이' );
Insert into countryname values( 'BO' , 'Bolivia', 'ボリビア', '볼리비아' );
Insert into countryname values( 'JP ' , 'Japan', '日本', '일본' );
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
MAINBOARD_SEQ.nextval, 'モンゴルのナダム(naadam)祭り', 'モンゴル', 'モンゴル全地域', '本来のナダムは宗教的意味と軍事訓練の意味が強かったが、今日は全国的な祝祭行事を通じて国民の結束という政治的意味に変化。', 'モンゴル全地域　' ,SYSDATE, '2020-07-11', '2020-07-13','https://dbscthumb-phinf.pstatic.net/2361_000_1/20190722220651199_6U4HINFBG.png/gb40_80_i1.png?type=h345_fst_n&wm=Y, https://dbscthumb-phinf.pstatic.net/2361_000_1/20190723200746685_VHTQ4YFH5.png/gb40_80_i2.png?type=h345_fst_n&wm=Y,','#伝統,#スポーツ,#アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'プケットのベジタリアンフェスティバル', 'タイ' , 'プケット', 'タイでソンクレラン祭り(Songkran Festival)の次に規模の大きい祭りだ。 雨期が終わって建機が始まる時期、タイ暦の上では12月15日、望の日、グレゴリオ暦では10月末から11月の間に開催する。'　, 'プケット'　,sysdate, '2019-10-19', '2019-10-26',　'https://i2.wp.com/www.phuketvegetarian.com/wp-content/uploads/2018/09/phuketvegetarian-05.jpg?resize=360%2C240&ssl=1, https://i0.wp.com/www.phuketvegetarian.com/wp-content/uploads/2018/09/phuketvegetarian-08.jpg?resize=360%2C240&ssl=1,',　'#飲食, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ライクラトン' , 'タイ' , 'タイ全地域の川' , '川に蓮華のつぼみ模様の灯りを浮かべながら願い事をする儀式だ。 タイ全域で祝祭が開かれ、地域ごとに特色を生かした様々なイベントが用意されている。',　 'タイ全地域 ' ,sysdate , '2019-11-01' , '2019-11-30' ,  'https://post-phinf.pstatic.net/MjAxNzEwMTZfMjY4/MDAxNTA4MTMzMDk4MjM3.oIgUU8UCeZNO4-q2ER9s87EKqQthU6TopPGQhH6RsCMg.elANEO-frdYgI5Q5aVLkKQY4dV7dx-yEIobxAcJHr0wg.PNG/1.PNG?type=w1200, https://post-phinf.pstatic.net/MjAxODEwMzBfMSAg/MDAxNTQwODg2Njg0NDYz.YnpY7O51aPnp49bfRMXuQDy5gVbHccUD4EQ6DOFj17Ig._dCsimD0VRvFCXdr45hwOcMuYbyRcuEZUtwqE2Pytacg.JPEG/image_5792024481540886240165.jpg?type=w1200,' , '#伝統, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '松葉祭り' , 'タイ' , 'タイ全地域' ,'タイの伝統的なカレンダーで元旦4月13日(ソンクラーン)から4月15日まで3日間開かれる。' ,　 'タイ全地域 ' , sysdate , '2019-04-13' , '2019-04-15' ,  'https://post-phinf.pstatic.net/MjAxOTA0MjNfMTU5/MDAxNTU2MDA3MjM0OTM0.xu9yhNaADyLk-zIkqNDuHTh8_XRs3YiuNoO3Iixm70Yg.zjevZoG06e0GiOogOOSdU3ZuZvzHL3by_ZqfETjgFG4g.JPEG/GettyImages-998852692.jpg?type=w1200,　 https://dbscthumb-phinf.pstatic.net/2890_000_1/20140407195236432_8C0OPIA90.jpg/fb40_16_i6.jpg?type=w575_fst&wm=N,' , '#伝統, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ハルビン国際氷雪祭' , '中国' , '中国黒竜江省ハルビン。' , 'ハルビン国際氷雪祭は毎年1月5日から2月末まで中国最北端黒竜江省ハルビン市の市で開催される世界的な規模の冬祭りだ。', 'ハルビン', sysdate , '2020-01-05' , '2020-02-29' ,  'https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162430255_7UXM6QDBT.jpg/fb40_91_i2.jpg?type=w575_fst&wm=N,　 https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162431983_FN57CU2DF.jpg/fb40_91_i3.jpg?type=w575_fst&wm=N ,　 https://dbscthumb-phinf.pstatic.net/2890_000_1/20150927162432758_KV6EMH54C.jpg/fb40_91_i4.jpg?type=w406_fst&wm=N,' , '#カーニバル, #アジア,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'チャイナジョイ' , '中国' , '中国上海新国際博覧センター ' , 'チャイナジョイ(ChinaJoy)は、中国上海の大規模展示場である上海新国際博覧会で毎年開かれるゲーム展示会(ゲームショー)をいう。' ,'上海', sysdate , ' 2019-08-02' , '2019-08-05' , 'https://dbscthumb-phinf.pstatic.net/2868_000_1/20140107163243008_JUT7SM8NL.jpg/ff13_1_6_i1.jpg?type=w492_fst&wm=N' , '#アジア, #ゲーム,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '上海モーターショー' , '中国' , '中国上海新国際博覧会センター' , '1985年から開始した上海モーターショーは、浦東近くで2年ごとに開催される。 北京モーターショーとともに中国の二大モーターショーだ。' , '上海' ,  sysdate , '2019-04-18' , '2019-04-25' , 'https://joonnoh.files.wordpress.com/2019/04/image-2.png,' , '#アジア,#モーターショー,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'ラマダン' , 'サウジアラビア' , 'サウジアラビア以外のイスラム国家' , 'アラビア語で「暑い月」を意味する。 天使ガブリエル(Gabriel)はムハンマドに《コーラン》を教えた神聖な月と考えて、イスラム教徒はこの期間、日の出から日没まで義務的に断食して、毎日5回の祈祷を捧げる。 旅行者、病人、妊婦などは免除されるが、その代わりその後別に数日間断食しなければならない。' , 'リヤド' ,  sysdate , '2020-04-23' , '2020-05-23' , 'https://dbscthumb-phinf.pstatic.net/2765_000_34/20180930204502552_9FBXULHDY.jpg/281513.jpg?type=m250&wm=N,' , '#アジア,#宗教');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'さっぽろホワイトイルミネーション' , '日本' , '日本北海道札幌' , '日本で開かれる光の祭典で、毎年11月雪に覆われた札幌に色とりどりの美しい光や照明を加えた姿でホワイトイルミネーション(White illumination)と呼ぶ。 日本初の光の祭典で1981年に初めて開始され、札幌の名所大通公園を中心に札幌駅、駅前通り、ススキノ市内などで光点灯が行われる。 札幌市、札幌観光協会、札幌商工会議所が主催し、札幌ホワイトイルミネーション実行委員会が主管して開催される。' , '札幌' ,  sysdate , '2019-11-22' , '2019-03-15' , 'https://postfiles.pstatic.net/20150101_134/sooyong8721_1420113509044K6zkB_JPEG/20141212_161951_LLS.JPG?type=w2,https://postfiles.pstatic.net/20150101_116/sooyong8721_1420113510806luWSI_JPEG/IMG_2616.JPG?type=w2,' , '#アジア, #カーニバル,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '広崎桜祭り' , '日本' , '青森県広崎公園' , '春の"広崎桜祭り"と竹と木を利用して作った骨組みに紙をつけて作った武者人形や、鳥と動物を作ってその中に灯りを灯して車や自動車に乗せて街を行進する"東北地方"を代表する夏の"広崎ネプタ祭り"など、"広崎"には四季を通じて行われる行事も多彩だ。' , '広崎' ,  sysdate , ' 2019-04-23' , '2019-05-03' , 'https://post-phinf.pstatic.net/MjAxOTA0MDdfMTA4/MDAxNTU0NjIxNDYwMzU3.0wfCTCpUDI8xPLyM1fTgBhQxIahpUmKAoJVoCNW20Cog.WkeylbFP7e-CiIU7c-lL4S2YQS0TOIg_my-gI3L3r20g.JPEG/%EC%A4%91%EC%95%99%EC%9D%BC%EB%B3%B4.jpg?type=w1200,' , '#アジア, #桜,');
INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, '2020年ドバイ世界博覧会' , 'UAE' , 'UAE' , ' 2020年世界博覧会、公式名称2020年ドバイ世界博覧会(アラブ語:إكسبو٢٠٢٠)は2020年、アラブ首長国連邦のドバイで開かれる予定の世界博覧会である。' , 'ドバイ' ,  sysdate , '2020-10-20' , '2020-04-10' , ',' , '#アジア, #博覧会');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'シドニーフェスティバル' , 'オーストラリア' , 'オーストラリア' , 'シドニーのいたるところで100を超えるプログラムが進められ、現代芸術からクラシック音楽、ダンス、サーカス、演劇、視覚芸術、芸術作品展示など、様々なジャンルの芸術を含む。 世界各国で900人余りの芸術家たちが招待されて約330本余りの公演を繰り広げ、毎年50万人以上の観客がフェスティバルを訪れている。' , 'シドニー市' ,  sysdate , ' 2020-01-08' , '2020-01-26' , 'https://postfiles.pstatic.net/MjAxODAxMjZfMTIx/MDAxNTE2OTM1NjI0MjUw.NjMs5sguqhi-N7bxWoKF0mbg7tCDlYHwNyjaMIAlsRcg.vr-PSC2xqCueN_y6a-7Lzu0Z8o3eji46IrKtBnfT2Jkg.JPEG.kkdaykr/image.adapt.1663.medium.jpg?type=w966,https://postfiles.pstatic.net/MjAxODAxMjZfNjAg/MDAxNTE2OTM2MjM1MTc3.yIr8JeVTLEMpGCLZFSzAYfxfQ0ZZ3ISeWs2HMKxb9Qcg.0x_j6UPH2aYCid-dXGbU1P3FjcGorsV_jHb9pElcwWMg.JPEG.kkdaykr/14340564616_047e1d52ba_z.jpg?type=w966,' , '#アジア,#祭り,');

INSERT INTO mainboard(MAINBOARDNUM, TITLE, COUNTRY, ADRESS, FESTIVAL_INTRO, SURROUND_PLACE, INPUTTIME, STARTEVENT, ENDEVENT, ORIGINALFILENAME, HASHTAG) VALUES(
MAINBOARD_SEQ.nextval, 'トゥモローランド(音楽祭)' , 'ベルギー' , 'Belgium　Boom' , 'トゥモローランド(Tomorrowland)はベルギーで開かれるエレクトロニックダンスミュージック音楽祭で、ID&Tが主管する。' , 'Boom' ,  sysdate , '2020-07-17' , '2020-07-26' , 'https://postfiles.pstatic.net/MjAxOTA0MjlfMjA5/MDAxNTU2NTQ1MDMwMjYx.37-XMt4AI71Po-5xLi76Qq3LrBHfQwcK9Z8Q-ze5OB8g.SNR4Xdr1J5n7YK6BcKC7dTLHZDxOeEY9o71ipb629U4g.JPEG.coldskysera/20180720_183202.jpg?type=w773, https://postfiles.pstatic.net/MjAxOTA0MjlfNzcg/MDAxNTU2NTQ0NzQzNzYx.MCiZ6nmKt9YP3I0Yi9Cjs5IZfz-rcU1dvCK9IifptXsg.pLRct5hcHPJ7izO4sjYNMfBrhn5GmRkrK4qwqCduChgg.JPEG.coldskysera/20180720_171911.jpg?type=w773,' , '#ヨーロッパ,#音楽祭,');


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

commit;