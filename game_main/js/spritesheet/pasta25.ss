const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'pasta25';            // ピースの画像名
let width  = [ 96, 124, 146, 122, 96, 96, 124, 122, 146, 96, 94, 121, 124, 126, 119, 121, 121, 121, 122, 96, 96, 149, 122, 101, 119 ];        // 画像サイズX
let height = [ 96, 94, 121, 119, 121, 147, 145, 97, 101, 99, 101, 97, 148, 149, 122, 149, 149, 122, 97, 149, 94, 96, 96, 118, 96 ];        // 画像サイズY
let x = [ 137.0, 214.0, 316.0, 420.0, 496.0, 137.0, 214.0, 304.0, 408.0, 496.0, 136.0, 213.5, 303.0, 395.0, 484.5, 149.5, 237.5, 328.5, 420.0, 496.0, 137.0, 226.5, 329.0, 407.5, 484.5 ];              // フレーム画像の表示位置X
let y = [ 106.0, 105.0, 118.5, 117.5, 118.5, 194.5, 194.5, 194.5, 194.5, 195.5, 285.5, 285.5, 287.0, 286.5, 273.0, 377.5, 375.5, 389.0, 376.5, 375.5, 466.0, 465.0, 465.0, 454.0, 465.0 ];              // フレーム画像の表示位置Y
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
