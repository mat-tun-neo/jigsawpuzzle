const DEBUG_MODE = 0;              // 0: OFF, 1: ON

const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = "shibainu25";           // ピースの画像名
let width  = [ 118, 121,  99, 146,  94,  94, 146, 123, 122,  96, 119,  99, 126, 146,  94,  94, 123, 146, 122,  96,  96, 122, 146,  99, 118 ];        // 画像サイズX
let height = [  94, 118, 119, 118,  96, 124, 124, 101, 122, 122, 149, 121, 124, 124, 146, 124, 124, 146, 123,  99,  96,  94,  94,  94, 118 ];        // 画像サイズY
const OFFSET_X = 0;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = -40;                       // フレーム画像の表示位置 オフセットY
let x = [ 143, 232, 312, 402, 492, 131, 221, 322, 414, 491, 144, 220, 299, 402, 491, 132, 210, 311, 414, 489, 133, 208, 312, 401, 478 ];             // フレーム画像の表示位置X
let y = [ 166, 178, 178, 178, 167, 243, 270, 256, 268, 244, 347, 359, 336, 358, 348, 451, 452, 438, 449, 437, 528, 529, 529, 528, 516 ];             // フレーム画像の表示位置Y

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
