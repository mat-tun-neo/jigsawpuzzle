const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'gundam10';            // ピースの画像名
let width  = [ 131, 159, 107, 156, 127, 129, 131, 131, 129, 100, 131, 106, 131, 129, 129, 104, 127, 106, 132, 103, 106, 132, 156, 158, 133, 155, 159, 156, 126, 105, 130, 126, 127, 102, 102, 104, 126, 127, 127, 132, 105, 127, 131, 103, 107, 131, 105, 131 ];        // 画像サイズX
let height = [ 132, 156, 134, 129, 156, 134, 132, 126, 107, 157, 130, 126, 159, 127, 102, 159, 102, 132, 105, 127, 158, 104, 107, 101, 130, 104, 157, 107, 134, 132, 129, 100, 105, 105, 157, 100, 134, 157, 132, 107, 127, 130, 132, 158, 157, 105, 105, 102 ];        // 画像サイズY
let x = [ 264.5, 251.5, 446.5, 349.0, 528.5, 74.5, 434.5, 167.5, 527.5, 60.0, 362.5, 253.0, 434.5, 527.5, 74.5, 156.0, 73.5, 349.0, 434.0, 446.5, 349.0, 168.0, 350.0, 351.0, 238.5, 252.5, 251.5, 253.0, 73.0, 445.5, 142.0, 529.0, 528.5, 61.0, 61.0, 447.0, 529.0, 528.5, 528.5, 141.0, 156.5, 73.5, 433.5, 155.5, 349.5, 142.5, 350.5, 239.5 ];              // フレーム画像の表示位置X
let y = [ 459.0, 350.0, 266.0, 74.5, 640.0, 530.0, 531.0, 73.0, 155.5, 640.5, 169.0, 73.0, 641.5, 73.5, 735.0, 542.5, 61.0, 529.0, 350.5, 73.5, 639.0, 446.0, 252.5, 735.5, 240.0, 156.0, 640.5, 543.5, 266.0, 168.0, 362.5, 736.0, 544.5, 350.5, 155.5, 736.0, 460.0, 349.5, 240.0, 640.5, 722.5, 433.0, 434.0, 254.0, 349.5, 155.5, 445.5, 735.0 ];              // フレーム画像の表示位置Y
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
