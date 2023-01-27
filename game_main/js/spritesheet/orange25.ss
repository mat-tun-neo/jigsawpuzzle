const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'orange25';            // ピースの画像名
let width  = [ 94, 148, 122, 99, 118, 96, 146, 97, 123, 119, 94, 124, 146, 99, 118, 94, 145, 99, 124, 119, 96, 124, 147, 99, 118 ];        // 画像サイズX
let height = [ 94, 121, 96, 94, 119, 146, 124, 147, 124, 101, 123, 99, 99, 146, 146, 99, 122, 124, 123, 122, 119, 118, 121, 94, 96 ];        // 画像サイズY
let x = [ 136.0, 227.0, 329.0, 406.5, 485.0, 137.0, 225.0, 316.5, 396.5, 484.5, 136.0, 212.0, 317.0, 406.5, 485.0, 136.0, 225.5, 317.5, 396.0, 484.5, 137.0, 214.0, 316.5, 406.5, 485.0 ];              // フレーム画像の表示位置X
let y = [ 105.0, 118.5, 106.0, 105.0, 117.5, 195.0, 208.0, 194.5, 181.0, 194.5, 296.5, 286.5, 284.5, 286.0, 285.0, 377.5, 364.0, 363.0, 387.5, 389.0, 453.5, 454.0, 452.5, 466.0, 465.0 ];              // フレーム画像の表示位置Y
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
