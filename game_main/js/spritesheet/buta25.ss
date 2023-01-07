const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'buta25';            // ピースの画像名
let width  = [ 121, 99, 147, 99, 121, 96, 122, 146, 123, 94, 94, 121, 123, 149, 94, 94, 121, 124, 148, 94, 96, 149, 122, 123, 94 ];        // 画像サイズX
let height = [ 94, 94, 119, 119, 118, 126, 146, 126, 101, 122, 149, 99, 99, 146, 101, 124, 148, 149, 122, 146, 94, 94, 94, 96, 94 ];        // 画像サイズY
let x = [ 149.5, 226.5, 316.5, 406.5, 483.5, 137.0, 213.0, 317.0, 418.5, 497.0, 136.0, 213.5, 305.5, 408.5, 497.0, 136.0, 213.5, 303.0, 406.0, 497.0, 137.0, 226.5, 329.0, 418.5, 497.0 ];              // フレーム画像の表示位置X
let y = [ 105.0, 105.0, 117.5, 117.5, 117.0, 182.0, 195.0, 207.0, 194.5, 207.0, 286.5, 284.5, 286.5, 285.0, 285.5, 390.0, 378.0, 377.5, 389.0, 376.0, 466.0, 466.0, 466.0, 465.0, 466.0 ];              // フレーム画像の表示位置Y
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
