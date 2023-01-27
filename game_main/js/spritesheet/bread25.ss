const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'bread25';            // ピースの画像名
let width  = [ 96, 147, 126, 124, 94, 119, 124, 101, 122, 121, 94, 149, 101, 124, 119, 94, 145, 99, 124, 119, 119, 123, 122, 126, 94 ];        // 画像サイズX
let height = [ 96, 96, 118, 118, 119, 147, 124, 99, 99, 123, 99, 149, 122, 147, 97, 149, 121, 123, 123, 151, 96, 94, 119, 94, 94 ];        // 画像サイズY
let x = [ 137.0, 225.5, 329.0, 421.0, 497.0, 148.5, 237.0, 316.5, 395.0, 483.5, 136.0, 224.5, 316.5, 396.0, 484.5, 136.0, 225.5, 317.5, 396.0, 484.5, 148.5, 236.5, 329.0, 420.0, 497.0 ];              // フレーム画像の表示位置X
let y = [ 106.0, 106.0, 117.0, 117.0, 117.5, 194.5, 183.0, 195.5, 195.5, 205.5, 284.5, 286.5, 273.0, 285.5, 285.5, 375.5, 388.5, 365.5, 387.5, 376.5, 465.0, 466.0, 453.5, 466.0, 466.0 ];              // フレーム画像の表示位置Y
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
