const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum02';            // ピースの画像名
let width  = [ 102, 102, 131, 132, 105, 127, 131, 130, 129, 106, 129, 100, 132, 106, 156, 132, 129, 101, 127, 130, 159, 126, 129, 134, 130, 101, 134, 161, 161, 131, 105, 102, 155, 105, 107, 105, 127, 132, 158, 101, 132, 130, 126, 103, 129, 158, 130, 127 ];        // 画像サイズX
let height = [ 100, 134, 131, 101, 133, 134, 131, 105, 130, 105, 130, 126, 107, 134, 157, 132, 156, 130, 131, 134, 126, 126, 132, 102, 132, 106, 105, 158, 107, 130, 127, 134, 130, 132, 132, 130, 130, 159, 127, 100, 132, 131, 130, 127, 130, 127, 102, 159 ];        // 画像サイズY
let x = [ 541.0, 61.0, 362.5, 364.0, 350.5, 528.5, 143.5, 363.0, 433.5, 155.0, 74.5, 542.0, 143.0, 447.0, 349.0, 434.0, 142.5, 60.5, 528.5, 239.0, 447.5, 73.0, 527.5, 335.0, 460.0, 60.5, 266.0, 349.5, 252.5, 336.5, 155.5, 541.0, 252.5, 156.5, 446.5, 445.5, 528.5, 240.0, 254.0, 60.5, 240.0, 169.0, 73.0, 252.5, 527.5, 157.0, 460.0, 73.5 ];              // フレーム画像の表示位置X
let y = [ 736.0, 142.0, 337.5, 735.5, 238.5, 363.0, 433.5, 542.5, 169.0, 350.5, 531.0, 73.0, 155.5, 460.0, 446.5, 265.0, 252.0, 239.0, 265.5, 627.0, 73.0, 723.0, 556.0, 61.0, 653.0, 446.0, 542.5, 639.0, 252.5, 142.0, 722.5, 654.0, 336.0, 628.0, 362.0, 557.0, 460.0, 445.5, 722.5, 60.0, 168.0, 531.5, 628.0, 73.5, 168.0, 73.5, 735.0, 348.5 ];              // フレーム画像の表示位置Y
const OFFSET_X = 0;                         // フレーム画像の表示位置 オフセットX
const OFFSET_Y = 0;                         // フレーム画像の表示位置 オフセットY

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

const GOAL_Y = SCREEN_HEIGHT/2 + 390;           // ゴール画像の位置Y
GOAL_BUTTON_WIDTH      = 400;
GOAL_BUTTON_HEIGHT     = 150;
ASSETS.image["goal_button"] = "./images/complete.png" + datestr;
ASSETS.spritesheet["goal_button"] = { "frame": {"width": 500, "height": 187, "cols": 1, "rows": 1}, "animations": animations };
