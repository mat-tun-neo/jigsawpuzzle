const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'suzume25';            // ピースの画像名
let width  = [ 94, 146, 99, 124, 121, 118, 99, 146, 99, 119, 121, 122, 99, 148, 94, 119, 99, 145, 97, 121, 121, 99, 124, 122, 121 ];        // 画像サイズX
let height = [ 119, 96, 119, 96, 94, 124, 122, 99, 149, 146, 123, 148, 121, 121, 99, 97, 99, 146, 124, 121, 118, 119, 96, 94, 121 ];        // 画像サイズY
let x = [ 136.0, 226.0, 315.5, 394.0, 483.5, 148.0, 226.5, 316.0, 408.5, 484.5, 149.5, 238.0, 315.5, 409.0, 497.0, 148.5, 224.5, 316.5, 407.5, 483.5, 149.5, 226.5, 305.0, 395.0, 483.5 ];              // フレーム画像の表示位置X
let y = [ 117.5, 106.0, 117.5, 106.0, 105.0, 206.0, 182.0, 193.5, 195.5, 195.0, 296.5, 287.0, 273.5, 297.5, 284.5, 376.5, 377.5, 377.0, 390.0, 364.5, 454.0, 453.5, 465.0, 466.0, 452.5 ];              // フレーム画像の表示位置Y
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
