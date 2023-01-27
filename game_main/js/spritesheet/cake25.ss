const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'cake25';            // ピースの画像名
let width  = [ 119, 124, 101, 122, 121, 96, 124, 146, 121, 94, 94, 149, 101, 147, 96, 119, 126, 122, 99, 118, 96, 147, 124, 99, 118 ];        // 画像サイズX
let height = [ 94, 119, 119, 96, 118, 149, 99, 99, 147, 97, 101, 121, 126, 99, 149, 147, 126, 147, 148, 124, 96, 119, 96, 94, 96 ];        // 画像サイズY
let x = [ 148.5, 237.0, 316.5, 395.0, 483.5, 137.0, 214.0, 316.0, 419.5, 497.0, 136.0, 224.5, 316.5, 407.5, 496.0, 148.5, 238.0, 329.0, 406.5, 485.0, 137.0, 225.5, 328.0, 406.5, 485.0 ];              // フレーム画像の表示位置X
let y = [ 105.0, 117.5, 117.5, 106.0, 117.0, 193.5, 193.5, 193.5, 194.5, 194.5, 285.5, 273.5, 273.0, 284.5, 284.5, 376.5, 364.0, 376.5, 375.0, 388.0, 465.0, 453.5, 465.0, 466.0, 465.0 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                       // フレーム画像の表示位置 オフセットY

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
