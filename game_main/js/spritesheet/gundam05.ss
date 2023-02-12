const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam05';            // ピースの画像名
let width  = [ 100, 130, 131, 104, 134, 105, 126, 106, 157, 100, 131, 126, 132, 156, 102, 159, 129, 129, 156, 157, 130, 105, 132, 107, 131, 159, 102, 130, 159, 132, 134, 102, 132, 102, 129, 129, 126, 127, 130, 105, 132, 127, 105, 106, 158, 103, 105, 126 ];        // 画像サイズX
let height = [ 100, 156, 130, 102, 100, 103, 131, 155, 129, 131, 106, 159, 134, 157, 102, 105, 105, 104, 134, 106, 127, 155, 132, 101, 106, 102, 133, 130, 130, 159, 130, 102, 129, 155, 129, 134, 132, 126, 132, 159, 105, 132, 130, 132, 102, 132, 161, 156 ];        // 画像サイズY
let x = [ 543.0, 363.0, 239.5, 253.0, 460.0, 156.5, 529.0, 446.0, 349.5, 60.0, 433.5, 73.0, 240.0, 350.0, 541.0, 348.5, 527.5, 74.5, 252.0, 349.5, 460.0, 156.5, 337.0, 155.5, 434.5, 156.5, 541.0, 169.0, 154.5, 459.0, 239.0, 61.0, 240.0, 541.0, 74.5, 74.5, 73.0, 73.5, 337.0, 445.5, 459.0, 528.5, 251.5, 252.0, 351.0, 155.5, 156.5, 529.0 ];              // フレーム画像の表示位置X
let y = [ 60.0, 252.0, 557.0, 735.0, 60.0, 446.5, 433.5, 543.5, 74.5, 168.5, 446.0, 639.5, 460.0, 543.5, 735.0, 156.5, 350.5, 543.0, 266.0, 350.0, 722.5, 252.5, 434.0, 60.5, 641.0, 735.0, 141.5, 654.0, 143.0, 154.5, 363.0, 735.0, 74.5, 252.5, 459.5, 363.0, 265.0, 73.0, 653.0, 348.5, 251.5, 653.0, 169.0, 653.0, 735.0, 364.0, 543.5, 544.0 ];              // フレーム画像の表示位置Y
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