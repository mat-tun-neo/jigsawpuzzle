const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum07';            // ピースの画像名
let width  = [ 105, 132, 127, 134, 132, 132, 102, 102, 127, 131, 105, 127, 134, 127, 127, 105, 132, 106, 127, 131, 132, 107, 102, 132, 156, 100, 127, 132, 102, 134, 158, 157, 156, 134, 132, 106, 131, 102, 127, 127, 157, 132, 103, 132, 103, 134, 127, 161 ];        // 画像サイズX
let height = [ 129, 159, 106, 107, 157, 131, 134, 101, 102, 130, 132, 156, 130, 157, 127, 127, 127, 105, 131, 157, 127, 127, 100, 130, 129, 131, 131, 107, 132, 132, 107, 102, 157, 131, 134, 132, 134, 157, 130, 132, 100, 132, 132, 133, 107, 107, 104, 127 ];        // 画像サイズY
let x = [ 251.5, 362.0, 73.5, 239.0, 459.0, 434.0, 541.0, 61.0, 528.5, 265.5, 348.5, 528.5, 266.0, 528.5, 73.5, 447.5, 240.0, 447.0, 73.5, 240.5, 459.0, 155.5, 541.0, 168.0, 349.0, 60.0, 528.5, 141.0, 61.0, 433.0, 254.0, 155.5, 155.0, 433.0, 265.0, 155.0, 142.5, 61.0, 73.5, 528.5, 349.5, 168.0, 349.5, 337.0, 349.5, 433.0, 528.5, 349.5 ];              // フレーム画像の表示位置X
let y = [ 74.5, 350.5, 446.0, 640.5, 349.5, 628.5, 363.0, 60.5, 61.0, 336.0, 461.0, 544.0, 169.0, 155.5, 722.5, 73.5, 722.5, 543.5, 143.5, 543.5, 722.5, 722.5, 736.0, 142.0, 556.5, 628.5, 652.5, 640.5, 362.0, 240.0, 252.5, 61.0, 349.5, 458.5, 433.0, 556.0, 239.0, 252.5, 531.0, 265.0, 736.0, 459.0, 168.0, 654.5, 252.5, 155.5, 447.0, 73.5 ];              // フレーム画像の表示位置Y
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