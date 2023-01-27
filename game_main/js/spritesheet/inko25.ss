const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'inko25';            // ピースの画像名
let width  = [ 118, 122, 101, 122, 118, 118, 121, 122, 101, 119, 94, 151, 97, 124, 118, 119, 124, 99, 149, 96, 94, 146, 99, 146, 96 ];        // 画像サイズX
let height = [ 119, 119, 94, 96, 96, 126, 124, 146, 147, 147, 121, 99, 101, 101, 99, 121, 145, 124, 122, 121, 94, 94, 119, 118, 118 ];        // 画像サイズY
let x = [ 148.0, 238.0, 316.5, 395.0, 485.0, 148.0, 237.5, 329.0, 407.5, 484.5, 136.0, 225.5, 316.5, 394.0, 485.0, 148.5, 237.0, 315.5, 406.5, 496.0, 136.0, 226.0, 315.5, 408.0, 496.0 ];              // フレーム画像の表示位置X
let y = [ 117.5, 117.5, 105.0, 106.0, 106.0, 207.0, 206.0, 195.0, 194.5, 194.5, 297.5, 284.5, 285.5, 285.5, 284.5, 388.5, 376.5, 365.0, 364.0, 364.5, 466.0, 466.0, 453.5, 454.0, 454.0 ];              // フレーム画像の表示位置Y
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
