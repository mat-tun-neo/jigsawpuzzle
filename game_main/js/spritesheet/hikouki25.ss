const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'hikouki25';            // ピースの画像名
let width  = [ 119, 101, 149, 97, 121, 121, 122, 101, 122, 121, 118, 121, 97, 148, 94, 121, 122, 101, 122, 118, 118, 97, 126, 124, 119 ];        // 画像サイズX
let height = [ 119, 121, 94, 121, 96, 101, 97, 145, 99, 147, 124, 123, 122, 146, 99, 122, 147, 126, 122, 126, 118, 96, 94, 96, 119 ];        // 画像サイズY
let x = [ 148.5, 225.5, 317.5, 407.5, 483.5, 149.5, 238.0, 316.5, 395.0, 483.5, 148.0, 237.5, 316.5, 406.0, 497.0, 149.5, 238.0, 316.5, 395.0, 485.0, 148.0, 225.5, 304.0, 396.0, 484.5 ];              // フレーム画像の表示位置X
let y = [ 117.5, 118.5, 105.0, 118.5, 106.0, 194.5, 194.5, 194.5, 195.5, 194.5, 274.0, 274.5, 298.0, 285.0, 284.5, 364.0, 376.5, 389.0, 389.0, 364.0, 454.0, 465.0, 466.0, 465.0, 453.5 ];              // フレーム画像の表示位置Y
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
