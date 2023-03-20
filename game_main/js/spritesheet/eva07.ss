const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva07';            // ピースの画像名
let width  = [ 129, 158, 103, 134, 131, 159, 157, 134, 127, 132, 102, 134, 127, 161, 132, 134, 102, 101, 100, 102, 130, 161, 102, 157, 127, 105, 156, 102, 156, 129, 103, 100, 100, 131, 130, 134, 133, 156, 100, 130, 131, 107, 107, 102, 105, 126, 132, 132 ];        // 画像サイズX
let height = [ 132, 134, 130, 134, 157, 156, 129, 101, 133, 102, 107, 107, 132, 134, 157, 129, 126, 100, 159, 102, 129, 102, 157, 131, 131, 130, 131, 105, 127, 132, 126, 102, 157, 106, 157, 134, 129, 101, 132, 126, 105, 131, 131, 157, 132, 106, 105, 129 ];        // 画像サイズY
let x = [ 74.5, 348.0, 252.5, 460.0, 459.5, 251.5, 252.5, 266.0, 73.5, 459.0, 541.0, 363.0, 528.5, 155.5, 362.0, 363.0, 61.0, 60.5, 542.0, 541.0, 169.0, 446.5, 61.0, 446.5, 73.5, 447.5, 447.0, 541.0, 350.0, 459.5, 349.5, 542.0, 542.0, 336.5, 142.0, 239.0, 238.5, 156.0, 60.0, 142.0, 168.5, 155.5, 349.5, 541.0, 154.5, 73.0, 265.0, 265.0 ];              // フレーム画像の表示位置X
let y = [ 556.0, 433.0, 459.0, 557.0, 446.5, 349.0, 142.5, 60.5, 141.5, 735.0, 252.5, 640.5, 653.0, 460.0, 543.5, 336.5, 723.0, 60.0, 542.5, 735.0, 556.5, 61.0, 349.5, 142.5, 240.5, 654.0, 240.5, 445.5, 722.5, 337.0, 73.0, 61.0, 349.5, 252.0, 349.5, 239.0, 721.5, 60.5, 459.0, 723.0, 640.5, 143.5, 168.5, 155.5, 240.0, 640.0, 543.5, 627.5 ];              // フレーム画像の表示位置Y
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