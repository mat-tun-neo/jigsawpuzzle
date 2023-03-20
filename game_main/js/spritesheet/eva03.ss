const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva03';            // ピースの画像名
let width  = [ 100, 105, 132, 127, 132, 156, 107, 156, 129, 102, 127, 127, 129, 127, 102, 132, 102, 129, 100, 134, 100, 107, 130, 156, 126, 105, 106, 158, 159, 156, 106, 132, 131, 100, 107, 156, 127, 129, 131, 106, 133, 157, 130, 101, 132, 132, 132, 131 ];        // 画像サイズX
let height = [ 129, 106, 134, 132, 129, 132, 132, 158, 155, 102, 126, 103, 105, 157, 102, 104, 129, 104, 156, 161, 130, 157, 103, 127, 107, 159, 131, 131, 157, 161, 106, 159, 102, 132, 102, 132, 105, 105, 127, 156, 130, 100, 107, 159, 100, 132, 129, 100 ];        // 画像サイズY
let x = [ 542.0, 348.5, 168.0, 73.5, 240.0, 253.0, 349.5, 446.0, 527.5, 61.0, 528.5, 73.5, 527.5, 73.5, 541.0, 434.0, 61.0, 433.5, 542.0, 169.0, 542.0, 349.5, 266.0, 447.0, 73.0, 350.5, 349.0, 445.0, 253.5, 446.0, 156.0, 265.0, 336.5, 60.0, 252.5, 156.0, 528.5, 336.5, 336.5, 155.0, 141.5, 155.5, 240.0, 60.5, 143.0, 265.0, 432.0, 434.5 ];              // フレーム画像の表示位置X
let y = [ 168.5, 641.0, 654.0, 653.0, 74.5, 556.0, 143.0, 445.0, 349.5, 735.0, 73.0, 155.5, 543.5, 543.5, 735.0, 253.0, 74.5, 544.0, 641.0, 155.5, 459.0, 252.5, 155.5, 722.5, 446.5, 445.5, 555.5, 628.5, 446.5, 155.5, 446.0, 251.5, 61.0, 362.0, 735.0, 267.0, 252.5, 348.5, 722.5, 544.0, 363.0, 736.0, 349.5, 251.5, 60.0, 653.0, 336.5, 60.0 ];              // フレーム画像の表示位置Y
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