const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum09';            // ピースの画像名
let width  = [ 101, 129, 130, 101, 130, 125, 99, 131, 130, 129, 125, 158, 102, 155, 132, 104, 127, 127, 129, 126, 128, 128, 158, 130, 125, 130, 127, 132, 102, 104, 132, 132, 99, 128, 106, 101, 130, 102, 127, 158, 128, 154, 101, 130, 99, 155, 101, 129 ];        // 画像サイズX
let height = [ 99, 157, 129, 130, 127, 131, 130, 125, 99, 104, 101, 106, 125, 158, 99, 154, 128, 154, 103, 127, 132, 126, 104, 105, 104, 131, 99, 154, 128, 155, 130, 100, 130, 157, 103, 132, 130, 102, 129, 129, 100, 128, 154, 132, 129, 130, 132, 156 ];        // 画像サイズY
let x = [ 535.5, 237.5, 140.0, 60.5, 264.0, 523.5, 59.5, 166.5, 262.0, 428.5, 72.5, 250.0, 442.0, 153.5, 359.0, 443.0, 522.5, 522.5, 333.5, 73.0, 359.0, 359.0, 154.0, 141.0, 523.5, 262.0, 522.5, 141.0, 154.0, 347.0, 359.0, 167.0, 59.5, 455.0, 442.0, 60.5, 428.0, 346.0, 73.5, 250.0, 455.0, 250.0, 535.5, 264.0, 59.5, 442.5, 535.5, 359.5 ];              // フレーム画像の表示位置X
let y = [ 59.5, 442.5, 359.5, 236.0, 73.5, 140.5, 332.0, 715.5, 728.5, 635.0, 60.5, 346.0, 715.5, 250.0, 728.5, 154.0, 647.0, 250.0, 442.5, 714.5, 167.0, 73.0, 635.0, 441.5, 345.0, 262.5, 728.5, 538.0, 141.0, 633.5, 526.0, 60.0, 526.0, 538.5, 346.5, 429.0, 262.0, 250.0, 140.5, 167.5, 60.0, 551.0, 538.0, 647.0, 620.5, 430.0, 429.0, 345.0 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                         // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                         // フレーム画像の表示位置 オフセットY

let animations = { "000" : {"frames": [ 0],  "next": "000", "frequency": 1 } };
for (let i = 0; i < PIECE_TOTALNUM; i++) {
    let no = zeroPadding(i, 2);
    let piece_no = "piece" + no;
    let mode_no = document.getElementById("mode").innerText + no;
    let frame_no = "frame" + no;
    ASSETS.image[piece_no] = "./images/" + PIECE_IMAGE + "/" + piece_no + ".png" + datestr;
    ASSETS.image[frame_no] = "./images/" + PIECE_IMAGE + "/" + mode_no + ".png" + datestr;
    ASSETS.spritesheet[piece_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    ASSETS.spritesheet[frame_no] = { "frame": {"width": width[i], "height": height[i], "cols": 1, "rows": 1}, "animations": animations };
    PIECE[no] = { sheetname: piece_no, width: width[i], height: height[i] };
    FRAME[no] = { sheetname: frame_no, width: width[i], height: height[i], x: x[i], y: y[i] };
}

const GOAL_Y = SCREEN_HEIGHT/2 + 390;           // ゴール画像の位置Y
GOAL_BUTTON_WIDTH      = 400;
GOAL_BUTTON_HEIGHT     = 150;
ASSETS.image["goal_button"] = "./images/complete.png" + datestr;
ASSETS.spritesheet["goal_button"] = { "frame": {"width": 500, "height": 187, "cols": 1, "rows": 1}, "animations": animations };
