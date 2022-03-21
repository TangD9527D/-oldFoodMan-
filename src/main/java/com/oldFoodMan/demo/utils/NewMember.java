package com.oldFoodMan.demo.utils;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public class NewMember {

	  //百家姓	
		private static String surname = "趙錢孫李周吳鄭王馮陳褚衛蔣沈韓楊朱秦尤許何呂施張孔曹嚴華金魏陶姜戚謝鄒喻柏水竇章雲蘇潘葛奚範彭郎魯韋昌馬苗鳳花方俞任袁柳酆鮑史唐費廉岑薛雷賀倪湯滕殷羅畢郝鄔安常樂於時傅皮卞齊康伍餘元卜顧孟平黃和穆蕭尹姚邵湛汪祁毛禹狄米貝明臧計伏成戴談宋茅龐熊紀舒屈項祝董樑杜阮藍閔席季麻強賈路婁危江童顏郭梅盛林刁鍾徐邱駱高夏蔡田樊胡凌霍虞萬支柯咎管盧莫經房裘繆幹解應宗宣丁賁鄧鬱單杭洪包諸左石崔吉鈕龔程嵇邢滑裴陸榮翁荀羊於惠甄魏加封芮羿儲靳汲邴糜鬆井段富巫烏焦巴弓牧隗山谷車侯宓蓬全郗班仰秋仲伊宮寧仇欒暴甘鈄厲戎祖武符劉姜詹束龍葉幸司韶郜黎薊薄印宿白懷蒲臺從鄂索鹹籍賴卓藺屠蒙池喬陰鬱胥能蒼雙聞莘黨翟譚貢勞逄姬申扶堵冉宰酈雍卻璩桑桂濮牛壽通邊扈燕冀郟浦尚農溫別莊晏柴瞿閻充慕連茹習宦艾魚容向古易慎戈廖庚終暨居衡步都耿滿弘匡國文寇廣祿闕東毆殳沃利蔚越夔隆師鞏厙聶晁勾敖融冷訾辛闞那簡饒空曾毋沙乜養鞠須豐巢關蒯相查後江紅遊竺權逯蓋益桓公万俟司馬上官歐陽夏侯諸葛聞人東方赫連皇甫尉遲公羊澹臺公冶宗政濮陽淳于仲孫太叔申屠公孫樂正軒轅令狐鍾離閭丘長孫慕容鮮于宇文司徒司空亓官司寇仉督子車顓孫端木巫馬公西漆雕樂正壤駟公良拓拔夾谷宰父谷粱晉楚閻法汝鄢塗欽段幹百里東郭南門呼延歸海羊舌微生嶽帥緱亢況後有琴樑丘左丘東門西門商牟佘佴伯賞南宮墨哈譙笪年愛陽佟";
	  
	  //女生名
	    private static String girlName = "秀娟英華慧巧美娜靜淑惠珠翠雅芝玉萍紅娥玲芬芳燕彩春菊蘭鳳潔梅琳素雲蓮真環雪榮愛妹霞香月鶯媛豔瑞凡佳嘉瓊勤珍貞莉桂娣葉璧璐婭琦晶妍茜秋珊莎錦黛青倩婷姣婉嫺瑾穎露瑤怡嬋雁蓓紈儀荷丹蓉眉君琴蕊薇菁夢嵐苑婕馨瑗琰韻融園藝詠卿聰瀾純毓悅昭冰爽琬茗羽希寧欣飄育瀅馥筠柔竹靄凝曉歡霄楓芸菲寒伊亞宜可姬舒影荔枝思麗";
	  
	  //男生名
	    private static String boyName = "偉剛勇毅俊峯強軍平保東文輝力明永健世廣志義興良海山仁波寧貴福生龍元全國勝學祥才發武新利清飛彬富順信子傑濤昌成康星光天達安巖中茂進林有堅和彪博誠先敬震振壯會思羣豪心邦承樂紹功鬆善厚慶磊民友裕河哲江超浩亮政謙亨奇固之輪翰朗伯宏言若鳴朋斌樑棟維啓克倫翔旭鵬澤晨辰士以建家致樹炎德行時泰盛雄琛鈞冠策騰楠榕風航弘";


	public static void main(String[] args) {
		
		for(int i=0 ; i<300 ;i++) {
			
			System.out.println("INSERT INTO member (memberName,phone,account,memberPwd,nickName,birth,city,createDate)");
			
			//電話
			int random=(int)(Math.random()*100000000);
		    String phone = "0" + "9" + random;
//		   	System.out.println("電話: " + phone);
		   	
		   	//帳號
		    String SALTCHARS = "qwertyuioplkjhgfdsazxcvbnm1234567890";
	        StringBuilder salt = new StringBuilder();
	        Random rnd = new Random();
	        while (salt.length() < 6) { // length of the random string.
	            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
	            salt.append(SALTCHARS.charAt(index));
	        }
	        String saltStr = salt.toString();
	        
	        int r = (int) (Math.random()*4);
	        String eamil = new String [] {"yahoo","gmail","hotmail","outlook"}[r];
	        
	        String emails = saltStr + "@" + eamil + ".com";
	        
//	        System.out.println("信箱: " + saltStr + "@" + eamil + ".com");
	        
	        //姓名
	        String name_sex = "";

	        int index = getNum(0, surname.length() - 1);
	        String first = surname.substring(index, index + 1);
	        int sex = getNum(0, 1);
	        String str = boyName;
	        int length = boyName.length();
	        if (sex == 0) {
	            str = girlName;
	            length = girlName.length();
	            name_sex = "女";
	        } else {
	            name_sex = "男";
	        }
	        index = getNum(0, length - 1);
	        String second = str.substring(index, index + 1);
	        
	        int hasThird = getNum(0, length - 1);
	        String third = str.substring(hasThird, hasThird + 1);
	        String names = first + second + third;
//	        System.out.println("姓名: " + names);
	        
	        
	        //市區
	        int o = (int) (Math.random()*22);
	        String city = new String [] {"臺北市","新北市","桃園市","臺中市","臺南市","高雄市","新竹縣","苗栗縣","彰化縣","南投縣","雲林縣","嘉義縣","屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣","金門縣","連江縣","基隆市","新竹市","嘉義市"}[o];
//	        System.out.println("城市: " + city);
	        
	        //生日
	        int min_mth = 1;
	        int max_mth = 12;
	        
	        int min_day = 1;
	        int max_day = 31;
	        
	        ThreadLocalRandom tlr = ThreadLocalRandom.current();
	        int mths = tlr.nextInt(min_mth, max_mth + 1);
	        int days = tlr.nextInt(min_day, max_day + 1);
	        
	        String date = "2022-"+ mths + "-" + days;
	        
//	        System.out.println(date);
	        
	        //密碼
	        String pwd = "$2a$10$AI6WGFuXe4uOcrqw3KeAC.7zVUgNtmoWU9DiycfyoUX3UPCvjcKqu";
	        
	        System.out.println("values ('"+ names + "',"+ "'" + phone + "',"+ "'" + emails + "'," + "'" + pwd + "'," + "'" + names + "'," + "'" + date + "'," + "'" + city + "'," + "'" + date +"')");
	        
	        
		}
		

	}


	public static int getNum(int start, int end) {
      return (int) (Math.random() * (end - start + 1) + start);
  }

}
