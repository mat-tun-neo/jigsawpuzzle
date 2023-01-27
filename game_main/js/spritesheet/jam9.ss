const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 9;                   // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'jam9';            // ピースの画像名
let width  = [ 162, 217, 206, 205, 211, 166, 166, 210, 209 ];        // 画像サイズX
let height = [ 166, 206, 166, 254, 174, 212, 166, 206, 205 ];        // 画像サイズY
let x = [ 156.0, 290.5, 446.0, 177.5, 333.5, 466.0, 158.0, 290.0, 444.5 ];              // フレーム画像の表示位置X
let y = [ 143.0, 163.0, 143.0, 297.0, 297.0, 276.0, 451.0, 431.0, 431.5 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                       // フレーム画像の表示位置 オフセットX
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
