const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'kikansha25';            // ピースの画像名
let width  = [ 121, 97, 149, 101, 119, 94, 121, 126, 149, 94, 119, 101, 147, 99, 121, 119, 101, 147, 101, 119, 96, 124, 149, 99, 119 ];        // 画像サイズX
let height = [ 96, 119, 96, 96, 96, 124, 99, 146, 122, 146, 146, 145, 122, 148, 122, 99, 99, 101, 97, 101, 119, 119, 119, 121, 119 ];        // 画像サイズY
let x = [ 149.5, 225.5, 315.5, 407.5, 484.5, 136.0, 213.5, 304.0, 408.5, 497.0, 148.5, 225.5, 316.5, 406.5, 483.5, 148.5, 225.5, 316.5, 407.5, 484.5, 137.0, 214.0, 317.5, 408.5, 484.5 ];              // フレーム画像の表示位置X
let y = [ 106.0, 117.5, 106.0, 106.0, 106.0, 183.0, 193.5, 194.0, 182.0, 194.0, 285.0, 285.5, 298.0, 284.0, 298.0, 377.5, 377.5, 376.5, 376.5, 376.5, 453.5, 453.5, 453.5, 452.5, 453.5 ];              // フレーム画像の表示位置Y
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
