const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = "hiyoko25";           // ピースの画像名
let width  = [ 119, 124, 101, 124, 119, 96, 146, 99, 147, 96, 119, 126, 99, 124, 119, 96, 124, 147, 124, 96, 119, 99, 121, 124, 118 ];        // 画像サイズX
let height = [ 94, 121, 94, 121, 96, 126, 121, 126, 97, 147, 124, 97, 124, 146, 101, 147, 146, 124, 99, 124, 96, 96, 119, 121, 119 ];        // 画像サイズY
const OFFSET_X = 0;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                        // フレーム画像の表示位置 オフセットY
let x = [ 143, 232, 312, 392, 481, 131, 219, 312, 403, 492, 143, 232, 312, 391, 480, 131, 208, 311, 414, 491, 142, 218, 298, 388, 480 ];              // フレーム画像の表示位置X
let y = [ 116, 129, 115, 129, 116, 193, 217, 192, 205, 205, 285, 297, 285, 297, 297, 388, 389, 377, 387, 376, 477, 477, 466, 465, 465 ];              // フレーム画像の表示位置Y

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
