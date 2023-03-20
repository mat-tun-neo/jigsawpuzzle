const INIT_PIECE_Y = SCREEN_HEIGHT/2 + 300;     // ピースの初期位置の最下ラインY
const CLICK_COUNT_MSG = "クリック回数："         // クリック回数のタイトル
MODE2_PROBABILITY = 100;                        // 2:キャプチャモードの場合にピースがランダム位置の確率

ASSETS.image["mainwindow"] = "./images/green.jpg" + datestr;

const PIECE = {};
const FRAME = {};
const PIECE_TOTALNUM = 48;                  // ピース数
const OUT_PIXEL = 20/PIECE_TOTALNUM*(-1);   // スクリーン外の判定幅
const PIECE_IMAGE = 'eva14';            // ピースの画像名
let width  = [ 132, 132, 126, 102, 129, 129, 102, 127, 130, 126, 156, 107, 100, 127, 132, 130, 157, 132, 105, 131, 106, 130, 129, 132, 102, 132, 100, 158, 159, 131, 131, 159, 131, 129, 102, 130, 107, 126, 132, 100, 100, 129, 131, 102, 130, 157, 133, 101 ];        // 画像サイズX
let height = [ 104, 129, 107, 107, 157, 157, 129, 101, 126, 130, 127, 102, 156, 129, 132, 132, 127, 105, 134, 105, 127, 159, 105, 156, 127, 132, 107, 156, 103, 129, 132, 134, 106, 130, 131, 132, 127, 131, 131, 131, 131, 106, 134, 131, 132, 129, 132, 129 ];        // 画像サイズY
let x = [ 143.0, 170.0, 73.0, 61.0, 265.5, 527.5, 61.0, 528.5, 143.0, 529.0, 253.0, 446.5, 60.0, 528.5, 459.0, 459.0, 155.5, 337.0, 350.5, 264.5, 447.0, 363.0, 265.5, 141.0, 61.0, 238.0, 542.0, 448.0, 350.5, 361.5, 142.5, 154.5, 433.5, 362.5, 541.0, 433.0, 252.5, 73.0, 240.0, 542.0, 60.0, 168.5, 240.5, 541.0, 460.0, 349.5, 335.5, 60.5 ];              // フレーム画像の表示位置X
let y = [ 156.0, 433.5, 349.5, 640.5, 446.5, 543.5, 168.5, 735.5, 73.0, 169.0, 73.5, 735.0, 544.0, 74.5, 362.0, 459.0, 722.5, 156.5, 557.0, 542.5, 73.5, 350.5, 350.5, 253.0, 722.5, 267.0, 252.5, 253.0, 640.5, 74.5, 628.0, 530.0, 155.0, 460.0, 652.5, 556.0, 722.5, 433.5, 167.5, 434.5, 265.5, 349.0, 627.0, 336.5, 653.0, 721.5, 240.0, 74.5 ];              // フレーム画像の表示位置Y
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