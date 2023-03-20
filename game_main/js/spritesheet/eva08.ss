const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva08';            // ピースの画像名
let width  = [ 134, 130, 130, 156, 130, 107, 134, 157, 100, 127, 129, 130, 106, 101, 132, 157, 101, 132, 127, 159, 127, 107, 107, 161, 102, 155, 129, 107, 132, 132, 129, 102, 105, 129, 104, 157, 126, 159, 132, 129, 127, 131, 132, 107, 102, 102, 131, 102 ];        // 画像サイズX
let height = [ 157, 133, 132, 132, 100, 127, 102, 130, 159, 100, 105, 104, 132, 159, 131, 102, 129, 129, 157, 132, 132, 131, 133, 131, 127, 161, 134, 102, 103, 161, 104, 106, 155, 107, 130, 130, 130, 126, 132, 129, 102, 105, 132, 156, 130, 107, 104, 156 ];        // 画像サイズY
let x = [ 266.0, 169.0, 336.0, 447.0, 142.0, 446.5, 239.0, 155.5, 542.0, 528.5, 74.5, 433.0, 446.0, 541.5, 362.0, 349.5, 60.5, 362.0, 73.5, 251.5, 73.5, 155.5, 252.5, 446.5, 61.0, 446.5, 74.5, 446.5, 240.0, 240.0, 168.5, 541.0, 154.5, 527.5, 350.0, 446.5, 529.0, 251.5, 143.0, 142.5, 528.5, 265.5, 337.0, 349.5, 61.0, 61.0, 336.5, 541.0 ];              // フレーム画像の表示位置X
let y = [ 640.5, 654.5, 170.0, 653.0, 736.0, 73.5, 735.0, 169.0, 154.5, 60.0, 445.5, 252.0, 461.0, 350.5, 434.5, 735.0, 74.5, 74.5, 349.5, 531.0, 529.0, 361.5, 169.5, 167.5, 722.5, 349.5, 627.0, 735.0, 252.5, 349.5, 447.0, 543.0, 543.5, 252.5, 654.0, 557.0, 460.0, 73.0, 265.0, 74.5, 735.0, 447.5, 267.0, 543.0, 169.0, 252.5, 350.0, 641.0 ];              // フレーム画像の表示位置Y
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