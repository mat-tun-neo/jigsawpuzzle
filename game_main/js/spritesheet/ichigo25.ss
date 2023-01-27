const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 25;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'ichigo25';            // ピースの画像名
let width  = [ 118, 99, 122, 126, 119, 96, 124, 122, 121, 118, 96, 149, 97, 149, 96, 94, 145, 97, 149, 96, 119, 99, 123, 124, 119 ];        // 画像サイズX
let height = [ 96, 96, 121, 96, 96, 124, 146, 97, 146, 124, 147, 99, 151, 121, 149, 123, 124, 99, 121, 99, 94, 119, 119, 94, 119 ];        // 画像サイズY
let x = [ 148.0, 226.5, 304.0, 395.0, 484.5, 137.0, 214.0, 304.0, 395.5, 485.0, 137.0, 226.5, 316.5, 406.5, 496.0, 136.0, 225.5, 316.5, 406.5, 496.0, 148.5, 224.5, 305.5, 396.0, 484.5 ];              // フレーム画像の表示位置X
let y = [ 106.0, 106.0, 118.5, 106.0, 106.0, 183.0, 194.0, 194.5, 194.0, 183.0, 285.5, 286.5, 285.5, 297.5, 286.5, 387.5, 365.0, 377.5, 388.5, 377.5, 466.0, 453.5, 453.5, 466.0, 453.5 ];              // フレーム画像の表示位置Y
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
