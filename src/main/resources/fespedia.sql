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
    FESTIVAL_INTRO VARCHAR2(5000),  
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
     CONTENTS VARCHAR2(5000),
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
    FESTIVAL_INTRO VARCHAR2(5000),  
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
     CONTENTS VARCHAR2(5000),
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


into countryname values('BD', 'Bangladesh', 'バングラデシュ', '방글라데시');
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
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/america.jpg', '#アメリカ祭り');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/asia.jpg', '#アジア祭り');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/africa.jpg', '#アフリカ祭り');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/expo.jpg', '#博覧会');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/summer.jpg', '#夏');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/movie.jpg', '#映画祭');
INSERT INTO SEARCHFESTIVAL VALUES('images/searchFestival/oceania.jpg', '#オセアニア祭り');
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

commit;
