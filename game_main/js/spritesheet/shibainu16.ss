const DEBUG_MODE = 0;              // 0: OFF, 1: ON

const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 16;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = "shibainu16";           // ピースの画像名
let width  = [ 115, 150, 151, 145, 117, 151, 179, 117, 117, 151, 181, 114, 114, 183, 148, 117 ];        // 画像サイズX
let height = [ 144, 144, 114, 114, 121, 121, 181, 180, 181, 149, 121, 151, 114, 144, 144, 114 ];        // 画像サイズY
const OFFSET_X = 10;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = -30;                       // フレーム画像の表示位置 オフセットY
let x = [ 143, 239, 350, 459, 144, 239, 365, 473, 144, 238, 365, 473, 142, 252, 379, 471 ];             // フレーム画像の表示位置X
let y = [ 167, 167, 152, 152, 262, 263, 262, 261, 373, 358, 373, 390, 483, 468, 469, 484 ];             // フレーム画像の表示位置Y

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
