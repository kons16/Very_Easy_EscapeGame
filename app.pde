/* 脱出ゲーム 
【各種大きさ】
 メイン 535*447
 アイテムボックス 530 * 90
 340
 Safariで動作確認済み
*/

PImage front, back, left_side, right_side;
PImage itembox, lm, rm;

int flag = 0;
int check = 0;
int item_head = 0;
int item_key = 0;

long t_start;
float t;
int state;
boolean isCounting = true;

void setup()
{
 	size(530, 530);
 	t_start = millis();
 	state = 0;

 	//基本4画面
	front = loadImage("img/front.png");
	back = loadImage("img/back.png");
	left_side = loadImage("img/left_side.png");
	right_side = loadImage("img/right_side.png");

	front_2 = loadImage("img/front_2.png");
	front_3 = loadImage("img/front_3.png");
	left_side_2 = loadImage("img/left_side_2.png");
	left_side_3 = loadImage("img/left_side_3.png");
	color_box = loadImage("img/color_switch.png");

	itembox = loadImage("img/itembox.png");
	bm = loadImage("img/back_mark.png");
	lm = loadImage("img/left_mark.png");
 	rm = loadImage("img/right_mark_2.png");

 	head = loadImage("img/head.png");
 	key = loadImage("img/key.png");

 	seikou = loadImage("img/seikou.png");
}

void draw()
{
	//経過時間を更新
	if(isCounting){
		t = (millis() - t_start) / 1000.0;
	}else{
		state = t;
	}

	if(flag == 0){
		image(front,0,0);
		image(lm, 5, 380);
		image(rm, 470, 380);
	}else if(flag == 1){
		image(back,0,0);
		image(lm, 5, 380);
		image(rm, 470,380);
	}else if(flag == 2){
		image(left_side,0,0);
		if(item_key == 1){
			image(left_side_3,0,0);
		}
		image(lm, 5, 380);
		image(rm, 470,380);
	}else if(flag == 3){
		image(right_side,0,0);
		image(lm, 5, 380);
		image(rm, 470,380);
	}else if(flag == 4){
		image(color_box,0,0);
		textSize(40);
		text("スイッチ",185,40);
		fill(0,102,153,204);
		image(bm, 240,380);
	}else if(flag == 5){
		image(front_2,0,0);
		image(lm, 5, 380);
		image(rm, 470,380);
	}else if(flag == 6){
		image(front_3,0,0);
		item_head = 1;
		image(lm,5,380);
		image(rm,470,380);
	}else if(flag == 7){
		image(left_side_2,0,0);
		item_head = 0;
		image(lm,5,380);
		image(rm,470,380);
	}else if(flag == 8){
		image(left_side_3,0,0);
		item_key = 1;
		image(lm,5,380);
		image(rm,470,380);	
	}

	image(itembox,0,440);

	if(item_head == 0){
		image(itembox,0,440);
	}else if(item_head == 1){
		image(head,15,450);
	}

	if(item_key == 1){
		image(key,15,450);
	}

	if(flag == 9){
		background(51);
		image(seikou,0,0);
		textSize(40);
		text(state + "秒で",80,120);
		fill(0,102,153,204);
	}

}

void mouseClicked()
{
	if(flag == 0){	//正面にいるとき
		flag_zero();
	}
	else if(flag == 1){	//後ろにいるとき
		flag_one();
	}
	else if(flag == 2){	//左にいるとき
		if(item_head == 1){
			head_set();
		}else{
			flga_two();
		}
	}
	else if(flag == 3){	//右にいるとき
		flag_three();
	}
	else if(flag == 4){ //カラースイッチの画面
		flag_four();
	}else if(flag == 5){ //スイッチ正解後
		flag_five();
	}else if(flag == 6){ //頭ゲット
		flag_six();
	}else if(flag == 7){ //頭セット
		flag_seven();
	}else if(flag == 8){ //カギゲット
		flag_eight();
	}
}


void flag_zero()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 2;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 3;
		}
	}
	//カラースイッチへ
	if((mouseButton == LEFT) && (390 <= mouseX) && (100 <= mouseY)){
		if((mouseX <= 500) && (mouseY <= 200)){
			flag = 4;
		}
	}

	//鍵ゲット後、ドアノブをクリック
	if(item_key == 1){
		if((mouseButton == LEFT) && (181 <= mouseX) && (204 <= mouseY)){
			if((mouseX <= 228) && (mouseY <= 265)){
				isCounting = false;
				flag = 9;
			}
		}
	}
}


void flag_one()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 3;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 2;
		}
	}
}

void flga_two()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 1;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 0;
		}
	}
}

void flag_three()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 0;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 1;
		}
	}
}

//カラースイッチの画面
void flag_four()
{
	//正面へ戻る
	if((mouseButton == LEFT) && (240 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 300) && (mouseY <= 435)){
			if(check == 4){
				flag = 5;
			}else{
				flag = 0;
			}
		}
	}
	//緑
	if((mouseButton == LEFT) && (206 <= mouseX) && (93 <= mouseY)){
		if((mouseX <= 293) && (mouseY <= 176)){
			check = 1;
		}
	}
	//紫
	if((mouseButton == LEFT) && (206 <= mouseX) && (291 <= mouseY)){
		if((mouseX <= 293) && (mouseY <= 372)){
			if(check == 1){
				check = 2;
			}
		}
	}
	//赤
	if((mouseButton == LEFT) && (99 <= mouseX) && (184 <= mouseY)){
		if((mouseX <= 187) && (mouseY <= 270)){
			if(check == 2){
				check = 3;
			}
		}
	}
	//青
	if((mouseButton == LEFT) && (306 <= mouseX) && (150 <= mouseY)){
		if((mouseX <= 397) && (mouseY <= 250)){
			if(check == 3){
				check = 4;
			}
		}
	}
}

void flag_five()
{
	if((mouseButton == LEFT) && (402 <= mouseX) && (203 <= mouseY)){
		if((mouseX <= 469) && (mouseY <= 260)){
			flag = 6;
		}
	}
}

void flag_six()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 2;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 3;
		}
	}
}

void head_set()
{
	if((mouseButton == LEFT) && (231 <= mouseX) && (91 <= mouseY)){
		if((mouseX <= 316) && (mouseY <= 159)){
			flag = 7;
		}
	}
}

void flag_seven()
{
	if((mouseButton == LEFT) && (208 <= mouseX) && (268 <= mouseY)){
		if((mouseX <= 286) && (mouseY <= 406)){
			flag = 8; //flagが8で鍵ゲット
		}
	}
}

void flag_eight()
{
	if((mouseButton == LEFT) && (0 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 60) && (mouseY <= 435)){
			flag = 1;
		}
	}
	if((mouseButton == LEFT) && (470 <= mouseX) && (370 <= mouseY)){
		if((mouseX <= 530) && (mouseY <= 435)){
			flag = 0;
		}
	}	
}



