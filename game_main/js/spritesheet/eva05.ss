const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva05';            // ピースの画像名
let width  = [ 127, 131, 129, 156, 131, 132, 129, 102, 127, 157, 127, 133, 127, 106, 102, 107, 157, 105, 105, 105, 126, 107, 126, 102, 157, 107, 156, 131, 106, 161, 132, 131, 132, 107, 156, 159, 106, 157, 156, 157, 102, 131, 129, 100, 100, 103, 100, 102 ];        // 画像サイズX
let height = [ 102, 158, 102, 131, 101, 132, 129, 134, 126, 127, 101, 105, 107, 130, 130, 107, 134, 157, 156, 105, 131, 127, 131, 156, 103, 129, 132, 159, 131, 130, 100, 129, 159, 103, 130, 158, 102, 132, 134, 107, 159, 132, 102, 130, 132, 129, 132, 131 ];        // 画像サイズY
let x = [ 73.5, 336.5, 336.5, 447.0, 434.5, 240.0, 74.5, 541.0, 73.5, 252.5, 528.5, 141.5, 73.5, 252.0, 541.0, 349.5, 155.5, 350.5, 446.5, 156.5, 529.0, 155.5, 73.0, 541.0, 446.5, 155.5, 446.0, 337.5, 155.0, 252.5, 432.0, 239.5, 143.0, 349.5, 349.0, 447.5, 349.0, 446.5, 253.0, 252.5, 61.0, 240.5, 527.5, 542.0, 60.0, 155.5, 542.0, 61.0 ];              // フレーム画像の表示位置X
let y = [ 61.0, 251.0, 735.0, 264.5, 60.5, 265.0, 336.5, 460.0, 723.0, 73.5, 60.5, 154.5, 543.5, 433.0, 363.0, 543.5, 433.0, 640.5, 156.0, 348.5, 143.5, 73.5, 627.5, 252.0, 446.5, 721.5, 655.0, 445.5, 530.5, 627.0, 736.0, 721.5, 251.5, 349.5, 142.0, 542.0, 61.0, 364.0, 530.0, 349.5, 445.5, 168.0, 735.0, 557.0, 143.0, 627.5, 653.0, 239.5 ];              // フレーム画像の表示位置Y
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