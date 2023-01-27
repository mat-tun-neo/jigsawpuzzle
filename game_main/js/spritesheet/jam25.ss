const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'jam25';            // ピースの画像名
let width  = [ 96, 146, 124, 122, 96, 118, 122, 101, 122, 118, 94, 149, 123, 97, 118, 121, 122, 101, 122, 121, 94, 121, 123, 122, 118 ];        // 画像サイズX
let height = [ 118, 119, 121, 96, 94, 99, 123, 121, 124, 146, 146, 97, 99, 146, 123, 122, 121, 124, 122, 97, 96, 118, 119, 96, 121 ];        // 画像サイズY
let x = [ 137.0, 225.0, 330.0, 420.0, 496.0, 148.0, 238.0, 316.5, 395.0, 485.0, 136.0, 224.5, 327.5, 407.5, 485.0, 149.5, 238.0, 316.5, 395.0, 483.5, 136.0, 213.5, 305.5, 395.0, 485.0 ];              // フレーム画像の表示位置X
let y = [ 117.0, 117.5, 118.5, 106.0, 105.0, 195.5, 205.5, 206.5, 183.0, 195.0, 285.0, 285.5, 286.5, 285.0, 296.5, 389.0, 364.5, 365.0, 389.0, 376.5, 465.0, 454.0, 453.5, 465.0, 452.5 ];              // フレーム画像の表示位置Y
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
