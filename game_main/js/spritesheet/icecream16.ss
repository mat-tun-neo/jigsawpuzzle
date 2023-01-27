const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 100;     // ピースの初期位置の最下ラインY
const GOAL_Y = SCREEN_HEIGHT/2 + 250;           // ゴール画像の位置Y
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 16;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'icecream16';            // ピースの画像名
let width  = [ 115, 150, 179, 117, 117, 151, 151, 145, 144, 149, 153, 114, 117, 181, 118, 144 ];        // 画像サイズX
let height = [ 115, 115, 145, 115, 150, 178, 151, 148, 179, 150, 123, 178, 117, 115, 145, 117 ];        // 画像サイズY
let x = [ 150.5, 246.0, 370.5, 478.5, 151.5, 245.5, 356.5, 464.5, 165.0, 274.5, 385.5, 480.0, 151.5, 260.5, 371.0, 465.0 ];              // フレーム画像の表示位置X
let y = [ 117.5, 117.5, 132.5, 117.5, 213.0, 227.0, 240.5, 212.0, 337.5, 351.0, 337.5, 338.0, 445.5, 446.5, 431.5, 445.5 ];              // フレーム画像の表示位置Y
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
