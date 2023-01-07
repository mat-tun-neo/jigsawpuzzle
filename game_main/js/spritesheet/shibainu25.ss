const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'shibainu25';            // ピースの画像名
let width  = [ 94, 123, 122, 146, 96, 119, 99, 124, 148, 94, 119, 99, 145, 99, 119, 121, 122, 124, 99, 118, 96, 122, 124, 146, 96 ];        // 画像サイズX
let height = [ 94, 118, 119, 119, 94, 126, 124, 101, 99, 146, 122, 121, 146, 123, 124, 121, 99, 97, 147, 124, 121, 119, 121, 96, 96 ];        // 画像サイズY
let x = [ 136.0, 214.5, 304.0, 408.0, 496.0, 148.5, 224.5, 303.0, 409.0, 497.0, 148.5, 224.5, 316.5, 408.5, 484.5, 149.5, 238.0, 328.0, 406.5, 485.0, 137.0, 213.0, 303.0, 408.0, 496.0 ];              // フレーム画像の表示位置X
let y = [ 105.0, 117.0, 117.5, 117.5, 105.0, 182.0, 208.0, 194.5, 193.5, 195.0, 273.0, 297.5, 285.0, 274.5, 297.0, 364.5, 377.5, 376.5, 376.5, 388.0, 452.5, 453.5, 452.5, 465.0, 465.0 ];              // フレーム画像の表示位置Y
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
