const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'icecream25';            // ピースの画像名
let width  = [ 118, 99, 124, 147, 96, 94, 149, 101, 124, 119, 94, 146, 99, 148, 94, 96, 124, 124, 147, 96, 119, 101, 124, 122, 118 ];        // 画像サイズX
let height = [ 96, 118, 96, 94, 94, 122, 124, 122, 148, 146, 126, 121, 124, 97, 99, 124, 97, 151, 148, 124, 119, 121, 94, 94, 121 ];        // 画像サイズY
let x = [ 148.0, 226.5, 305.0, 407.5, 496.0, 136.0, 224.5, 316.5, 396.0, 484.5, 136.0, 226.0, 315.5, 409.0, 497.0, 137.0, 214.0, 305.0, 407.5, 496.0, 148.5, 225.5, 305.0, 395.0, 485.0 ];              // フレーム画像の表示位置X
let y = [ 106.0, 117.0, 106.0, 105.0, 105.0, 182.0, 208.0, 182.0, 196.0, 195.0, 273.0, 297.5, 272.0, 285.5, 284.5, 365.0, 376.5, 376.5, 378.0, 363.0, 453.5, 452.5, 466.0, 466.0, 452.5 ];              // フレーム画像の表示位置Y
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
