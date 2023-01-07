const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'hiyoko25';            // ピースの画像名
let width  = [ 119, 124, 101, 124, 119, 96, 146, 99, 147, 96, 119, 126, 99, 124, 119, 96, 124, 147, 124, 96, 119, 99, 121, 124, 118 ];        // 画像サイズX
let height = [ 94, 121, 94, 121, 96, 126, 121, 126, 97, 147, 124, 97, 124, 146, 101, 147, 146, 124, 99, 124, 96, 96, 119, 121, 119 ];        // 画像サイズY
let x = [ 148.5, 237.0, 316.5, 396.0, 484.5, 137.0, 225.0, 317.5, 407.5, 496.0, 148.5, 238.0, 317.5, 396.0, 484.5, 137.0, 214.0, 316.5, 419.0, 496.0, 148.5, 224.5, 304.5, 394.0, 485.0 ];              // フレーム画像の表示位置X
let y = [ 105.0, 118.5, 105.0, 118.5, 106.0, 182.0, 206.5, 182.0, 194.5, 194.5, 274.0, 285.5, 274.0, 286.0, 285.5, 376.5, 377.0, 365.0, 375.5, 365.0, 465.0, 465.0, 453.5, 452.5, 453.5 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                        // フレーム画像の表示位置 オフセットY

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
