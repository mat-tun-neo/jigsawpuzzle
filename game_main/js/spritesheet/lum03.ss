const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'lum03';            // ピースの画像名
let width  = [ 129, 132, 155, 107, 127, 161, 129, 157, 129, 156, 134, 132, 156, 127, 131, 106, 126, 131, 102, 107, 159, 130, 127, 103, 159, 104, 127, 159, 105, 132, 106, 129, 100, 126, 106, 157, 106, 132, 104, 131, 103, 126, 100, 102, 107, 130, 101, 127 ];        // 画像サイズX
let height = [ 105, 102, 107, 107, 158, 102, 130, 132, 132, 134, 130, 130, 131, 102, 156, 129, 133, 105, 131, 100, 105, 107, 129, 102, 132, 157, 134, 127, 131, 132, 132, 132, 105, 129, 157, 157, 161, 101, 159, 102, 132, 127, 126, 132, 159, 130, 132, 130 ];        // 画像サイズY
let x = [ 74.5, 240.0, 446.5, 155.5, 528.5, 155.5, 527.5, 252.5, 362.5, 446.0, 239.0, 143.0, 349.0, 528.5, 361.5, 156.0, 73.0, 434.5, 61.0, 446.5, 253.5, 337.0, 73.5, 252.5, 253.5, 446.0, 73.5, 348.5, 350.5, 143.0, 349.0, 527.5, 542.0, 529.0, 447.0, 252.5, 252.0, 337.0, 446.0, 433.5, 155.5, 73.0, 60.0, 61.0, 155.5, 169.0, 541.5, 528.5 ];              // フレーム画像の表示位置X
let y = [ 544.5, 61.0, 252.5, 252.5, 445.0, 735.0, 336.0, 265.0, 362.0, 654.0, 557.0, 169.0, 530.5, 735.0, 156.0, 74.5, 460.5, 447.5, 627.5, 736.0, 348.5, 446.5, 362.5, 735.0, 653.0, 155.5, 266.0, 722.5, 628.5, 653.0, 265.0, 170.0, 253.5, 74.5, 543.5, 155.5, 446.5, 60.5, 350.5, 61.0, 556.0, 73.5, 723.0, 168.0, 350.5, 460.0, 653.0, 557.0 ];              // フレーム画像の表示位置Y
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