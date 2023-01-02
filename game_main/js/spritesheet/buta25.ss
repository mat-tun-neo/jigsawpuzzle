const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = "buta25";           // ピースの画像名
let width  = [ 121, 99, 147, 99, 121, 96, 122, 146, 123, 94, 94, 121, 123, 149, 94, 94, 121, 124, 148, 94, 96, 149, 122, 123, 94, ];        // 画像サイズX
let height = [ 94, 94, 119, 119, 118, 126, 146, 126, 101, 122, 149, 99, 99, 146, 101, 124, 148, 149, 122, 146, 94, 94, 94, 96, 94, ];        // 画像サイズY
const OFFSET_X = 0;                        // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                        // フレーム画像の表示位置 オフセットY
let x = [ 143, 221, 311, 402, 479, 131, 207, 311, 413, 492, 130, 208, 300, 403, 492, 130, 208, 298, 401, 492, 131, 221, 324, 413, 492 ];              // フレーム画像の表示位置X
let y = [ 116, 116, 128, 128, 128, 193, 206, 218, 205, 218, 297, 296, 298, 296, 297, 401, 390, 389, 401, 388, 477, 478, 478, 477, 478 ];              // フレーム画像の表示位置Y


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
