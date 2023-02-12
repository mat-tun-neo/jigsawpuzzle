const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam03';            // ピースの画像名
let width  = [ 103, 105, 132, 157, 102, 102, 127, 157, 100, 102, 105, 107, 134, 132, 130, 157, 106, 126, 129, 132, 134, 127, 132, 100, 132, 129, 132, 158, 129, 158, 126, 159, 129, 105, 131, 127, 157, 100, 107, 107, 132, 100, 100, 104, 161, 131, 159, 126 ];        // 画像サイズX
let height = [ 158, 130, 101, 131, 134, 105, 127, 130, 107, 105, 156, 156, 132, 104, 129, 129, 102, 156, 134, 131, 100, 102, 130, 129, 100, 132, 105, 131, 100, 156, 156, 132, 102, 159, 159, 159, 105, 130, 132, 102, 105, 132, 130, 158, 129, 104, 130, 132 ];        // 画像サイズY
let x = [ 155.5, 156.5, 168.0, 155.5, 541.0, 61.0, 73.5, 349.5, 542.0, 61.0, 447.5, 252.5, 266.0, 240.0, 337.0, 252.5, 252.0, 73.0, 362.5, 461.0, 460.0, 73.5, 459.0, 542.0, 362.0, 527.5, 461.0, 448.0, 527.5, 348.0, 73.0, 350.5, 433.5, 251.5, 168.5, 528.5, 155.5, 542.0, 252.5, 155.5, 238.0, 60.0, 542.0, 446.0, 349.5, 336.5, 154.5, 73.0 ];              // フレーム画像の表示位置X
let y = [ 251.0, 557.0, 735.5, 652.5, 363.0, 350.5, 722.5, 362.0, 543.5, 641.5, 641.0, 641.0, 170.0, 544.0, 721.5, 74.5, 735.0, 543.0, 142.0, 434.5, 60.0, 61.0, 337.0, 74.5, 60.0, 170.0, 252.5, 530.5, 736.0, 252.0, 252.0, 626.0, 735.0, 447.5, 447.5, 641.5, 350.5, 266.0, 337.0, 61.0, 253.5, 143.0, 460.0, 154.0, 459.5, 543.0, 142.0, 434.0 ];              // フレーム画像の表示位置Y
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